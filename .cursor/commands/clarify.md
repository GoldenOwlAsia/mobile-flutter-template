# Clarify before implementing

**Do not write production code yet.** Your job is to reduce ambiguity so the next step can implement in one pass.

## Inputs

Use whatever the user referenced (message, selection, open files). If critical information is missing, say what you need.

## Output structure

1. **Goal** — Restate the user’s intent in one or two sentences (what “done” looks like).
2. **Assumptions** — Bullet list of what you are assuming; mark each as *confirmed*, *likely*, or *uncertain*.
3. **Open questions** — Numbered questions, **only** those that change design or behavior. Prefer multiple-choice or yes/no where possible.
4. **Proposed approach** — High-level plan: which layers/files will likely change (`feature/view`, `logic`, `network`, `router`, etc.), aligned with `rules/architecture.md`.
5. **Out of scope** — What you will explicitly not do unless the user asks.
6. **Risks / tradeoffs** — Security (`rules/security-requirements.md`), breaking API, migration, or test burden — brief.

## Rules

- Ask the **minimum** number of questions; merge related ones.
- If the request is already unambiguous, say so and give a tight implementation plan instead of artificial questions.
- Do not paste large speculative code; sketches and file paths are enough.
