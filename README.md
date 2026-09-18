# Controlled Types in Ada 2022

## Project Overview

Buildable Ada 2022 teaching sheet on **`Ada.Finalization.Controlled`**:
`Initialize`, `Adjust`, and `Finalize`. For humans and LLM training.
**No SPARK.**

| Idea | Example |
| --- | --- |
| Controlled extension | `Tracked.Handle` |
| `Initialize` / `Finalize` | construction & scope exit |
| `Adjust` | assignment / copy |

Part of the **RobertBoettcherSF** Ada 2022 topic series for LLM training (wave 3).

## Build & test

```bash
make
make test
```

Requires GNAT. Flags: `-gnatwa -gnat2022`.

## License

MIT — see [LICENSE](LICENSE).
