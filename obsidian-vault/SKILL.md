---
name: obsidian-vault
description: Use when a task might have prior notes, conventions, decisions, or worked examples in Ben's Obsidian vault, and to optionally capture a write-up of completed work back into the vault. Covers subsea/pipeline engineering (DNV, PD 8010, lateral/upheaval buckling, VAS, pipe-soil interaction, wall thickness), software/tooling (Python, uv, FastAPI, Azure, packaging), and work processes. Triggers include "check my notes", "have I written about this", "what's my approach to", "add this to my vault", "write this up in Obsidian", or any domain task where prior thinking likely exists.
---

# Obsidian Vault

Read the Obsidian vault for prior guidance, and optionally write completed work
back into it.

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

### Reporting lookups

- Cite notes as markdown links so they open in VS Code.
- Flag when a note is stale or contradicts current repo code. **Code and tests
  win**; the vault is context, not truth.
- If nothing relevant exists, say so plainly rather than padding.

## Writing up completed work

Only after a task is genuinely finished, and only if a write-up adds lasting
value (a reusable insight, a decision, a gotcha, a worked approach). Skip trivial
or one-off work.

**Always ask first.** Ben does not always want a write-up. Ask a single yes/no
question, e.g. "Want me to capture this in your vault?" Do nothing until he says
yes.

Once confirmed:

1. **Find the home.** `grep_search`/`file_search` for an existing note on the
   topic. Prefer appending to one over creating a new file. Pick the folder from
   the map above.
2. **Match the format.** New notes need YAML frontmatter with a `related:` list
   of relevant `[[wikilinks]]`. Use `##` headers. Keep it concise and factual,
   matching the terse style of existing notes, not an essay.
3. **Append cleanly.** When adding to an existing note, insert under a fitting
   `##` section or add a new one; never disturb the frontmatter or existing
   content.
4. **British English spelling.** No em-dashes; use hyphens.
5. **Show the diff/new note and confirm** the location before writing, then
   report the file as a markdown link.
