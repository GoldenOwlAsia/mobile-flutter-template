#!/bin/bash
# Inject DART_DEFINES from flavor-specific .env file before Flutter iOS build.

set -euo pipefail

if [[ -z "${FLUTTER_ROOT:-}" || -z "${PROJECT_DIR:-}" || -z "${CONFIGURATION:-}" || -z "${FLUTTER_TARGET:-}" ]]; then
  echo "error: FLUTTER_ROOT, PROJECT_DIR, CONFIGURATION, and FLUTTER_TARGET must be set." >&2
  exit 1
fi

ROOT="${PROJECT_DIR}/.."
case "${CONFIGURATION}" in
  *staging)
    FLAVOR=staging
    ENV_FILE="${ROOT}/.env.staging"
    ;;
  *production)
    FLAVOR=production
    ENV_FILE="${ROOT}/.env.production"
    ;;
  *)
    exec /bin/sh "${FLUTTER_ROOT}/packages/flutter_tools/bin/xcode_backend.sh" build
    ;;
esac

if [[ ! -f "${ENV_FILE}" ]]; then
  echo "error: Env file not found: ${ENV_FILE}" >&2
  exit 1
fi

GENERATED="${PROJECT_DIR}/Flutter/Generated.xcconfig"
if [[ ! -f "${GENERATED}" ]]; then
  echo "error: ${GENERATED} missing (run flutter pub get)." >&2
  exit 1
fi

NEW_DEFINES=""
existing="$(grep '^DART_DEFINES=' "${GENERATED}" | cut -d= -f2- || true)"
if [[ -n "${existing}" ]]; then
  IFS=',' read -ra existing_arr <<< "${existing}"
  for enc in "${existing_arr[@]}"; do
    dec="$(printf '%s' "${enc}" | base64 -d 2>/dev/null || true)"
    case "${dec}" in
      FLUTTER_APP_FLAVOR=*) ;;
      FLUTTER_*) NEW_DEFINES="${NEW_DEFINES:+${NEW_DEFINES},}${enc}" ;;
    esac
  done
fi

NEW_DEFINES="${NEW_DEFINES:+${NEW_DEFINES},}$(printf '%s' "FLUTTER_APP_FLAVOR=${FLAVOR}" | base64 | tr -d '\n')"

while IFS= read -r line || [[ -n "${line}" ]]; do
  line="$(printf '%s' "${line}" | tr -d '\r')"
  case "${line}" in
    \#* | "") continue ;;
  esac
  NEW_DEFINES="${NEW_DEFINES:+${NEW_DEFINES},}$(printf '%s' "${line}" | base64 | tr -d '\n')"
done < "${ENV_FILE}"

export DART_DEFINES="${NEW_DEFINES}"

tmp="$(mktemp)"
while IFS= read -r line || [[ -n "${line}" ]]; do
  case "${line}" in
    DART_DEFINES=*) printf 'DART_DEFINES=%s\n' "${NEW_DEFINES}" ;;
    FLAVOR=*) printf 'FLAVOR=%s\n' "${FLAVOR}" ;;
    FLUTTER_TARGET=*) printf 'FLUTTER_TARGET=%s\n' "${FLUTTER_TARGET}" ;;
    *) printf '%s\n' "${line}" ;;
  esac
done < "${GENERATED}" > "${tmp}"
mv "${tmp}" "${GENERATED}"

exec /bin/sh "${FLUTTER_ROOT}/packages/flutter_tools/bin/xcode_backend.sh" build
