# HowToCook upstream snapshot

This directory vendors the complete `dishes/` tree from
[`Anduin2017/HowToCook`](https://github.com/Anduin2017/HowToCook) at commit
`308cc8b7dab1da84b20e7fafdf836a715437f582`.

- Imported recipes: 373
- Imported template documents: 1
- Imported images: 355 (actual upstream files; no Git LFS pointers)
- License: Unlicense (see `LICENSE`)
- Refresh command: `bun run sync-how-to-cook`

The copied Markdown remains upstream source material. A recipe is only marked as formally verified
inside Lean to Cook when it also has a strict schema entry and a compiled Lean certificate.
