---
name: obsidian-lookup
description: Use when a task might have prior notes, conventions, decisions, or worked examples in Ben's Obsidian vault. Covers subsea/pipeline engineering (DNV, PD 8010, lateral/upheaval buckling, VAS, pipe-soil interaction, wall thickness), software/tooling (Python, uv, FastAPI, Azure, packaging), and work processes. Triggers include "check my notes", "have I written about this", "what's my approach to", or any domain task where prior thinking likely exists.
---

# Obsidian Vault Lookup

Read the Obsidian vault for prior guidance. Look things up only; never write back
here (use the `obsidian-writeup` skill for that).

Vault root: `/Users/benranderson/Library/Mobile Documents/iCloud~md~obsidian/Documents/Vault`

## Folder map

- `Engineering/` - subsea/pipeline domain: buckling (lateral, upheaval, VAS),
  DNV-ST-F101, PD 8010, wall thickness, pipe-soil interaction, free spans,
  effective axial force, installation, thermal design. One note per topic.
- `Software/` - languages, tools, patterns: Python, uv, FastAPI, pandas, Azure,
  Docker, packaging, testing, git. One note per topic.
- `Work/` - projects, meetings, appraisals, brag documents, presentations,
  decisions, processes (subfolders like `Projects/`, `Meetings/`, `Guidance/`).
- `Blog/`, `Books/`, `Finance/`, `Parenting/`, `Music/`, `Miscellaneous/` -
  other domains.
- `Templates/` - note templates. Reference for structure, never as content.

Ignore `.trash/`, `.obsidian/`, `.attachments/`, `Attachments/`, `Anki/`.

## Vault conventions

- Every note starts with YAML frontmatter. The common key is `related:`, a list
  of `"[[Wikilink]]"` strings. Some notes also carry `tags:` and `date:`.
- Body uses `##` section headers and `[[wikilinks]]` to connect topics.
- Notes are often short stubs: a definition plus links to books, codes, papers.

## Looking things up

1. Start narrow: `grep_search` for 2-3 domain keywords, scoped with
   `includePattern` to the likely folder (e.g. `Engineering/**`).
2. If nothing hits, widen to `semantic_search` across the vault.
3. Follow `[[wikilinks]]` in any hit; they point to the related notes.
4. Read the full note before quoting; stubs mislead if only skimmed.

## Reporting lookups

- Cite notes as markdown links so they open in VS Code.
- Flag when a note is stale or contradicts current repo code. **Code and tests
  win**; the vault is context, not truth.
- If nothing relevant exists, say so plainly rather than padding.
