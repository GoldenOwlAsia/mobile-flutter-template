{{flutter_js}}
{{flutter_build_config}}

// Customize the Flutter loader config here.
// See https://docs.flutter.dev/platform-integration/web/initialization
_flutter.loader.load({
  config: {
    // Flutter 3.50: opt into WebAssembly on Safari (webkit) and Firefox
    // (gecko) in addition to Chromium (blink). Build with
    // `flutter build web --wasm` so the WebAssembly artifacts exist; browsers
    // without Wasm support fall back to the JavaScript build automatically.
    // These engines become enabled by default in a future stable release.
    wasmAllowList: {
      blink: true,
      webkit: true,
      gecko: true,
    },
  },
});
