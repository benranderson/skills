---
name: obsidian-lookup
description: Use when a task might have prior notes, conventions, decisions, or worked examples in Ben's Obsidian vault. Covers subsea/pipeline engineering (DNV, PD 8010, lateral/upheaval buckling, VAS, pipe-soil interaction, wall thickness), software/tooling (Python, uv, FastAPI, Azure, packaging), and work processes. Triggers include "check my notes", "have I written about this", "what's my approach to", or any domain task where prior thinking likely exists.
---

# Obsidian Vault Lookup

Read the Obsidian vault for prior guidance. Look things up only; never write back here (use the `obsidian-writeup` skill for that).

Vault root: `/Users/benranderson/Library/Mobile Documents/iCloud~md~obsidian/Documents/Vault`

## Folder map

- `Engineering/` - subsea/pipeline domain: buckling (lateral, upheaval, VAS), DNV-ST-F101, PD 8010, wall thickness, pipe-soil interaction, free spans, effective axial force, installation, thermal design. One note per topic.
- `Software/` - languages, tools, patterns: Python, uv, FastAPI, pandas, Azure, Docker, packaging, testing, git. One note per topic.
- `Work/` - projects, meetings, appraisals, brag documents, presentations, decisions, processes (subfolders like `Projects/`, `Meetings/`, `Guidance/`).
- `Blog/`, `Books/`, `Finance/`, `Parenting/`, `Music/`, `Miscellaneous/` - other domains.
- `Templates/` - note templates. Reference for structure, never as content.

Ignore `.trash/`, `.obsidian/`, `.attachments/`, `Attachments/`, `Anki/`, `Bases/`, and `π/` (a pi config, not notes).

## Vault conventions

- Every note starts with YAML frontmatter. The common key is `related:`, a list of `"[[Wikilink]]"` strings. Some notes also carry `tags:` and `date:`.
- Body uses `##` section headers and `[[wikilinks]]` to connect topics.
- Notes are often short stubs: a definition plus links to books, codes, papers.

## Looking things up

1. **Start narrow.** Search 2-3 domain keywords, scoped to the likely folder from the map above.
2. **Try the title.** One note per topic, so the topic name is usually the filename. `Software/CodeQL.md` beats grepping for "codeql".
3. **Widen.** If nothing hits, run a semantic or full-vault search before concluding the vault is empty on the topic.
4. **Follow the links.** Chase `[[wikilinks]]` in the body and the `related:` list in the frontmatter; they point at the rest of the thinking.
5. **Read the whole note before quoting.** Stubs mislead when skimmed.

## Reporting lookups

- Cite notes as markdown links.
- Report what the note says. Do not round a stub up into a claim it does not make.
- Flag when a note is stale or contradicts current repo code. **Code and tests win**; the vault is context, not truth.
- When the vault is wrong rather than merely thin, offer to correct it with the `obsidian-writeup` skill.
- If nothing relevant exists, say so plainly rather than padding.
