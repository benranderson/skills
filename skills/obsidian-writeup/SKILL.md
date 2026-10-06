---
name: obsidian-writeup
description: Use to capture a write-up of completed work into Ben's Obsidian vault. Covers subsea/pipeline engineering (DNV, PD 8010, lateral/upheaval buckling, VAS, pipe-soil interaction, wall thickness), software/tooling (Python, uv, FastAPI, Azure, packaging), and work processes. Triggers include "add this to my vault", "write this up in Obsidian", "capture this in my notes".
---

# Obsidian Vault Write-up

Capture completed work back into the Obsidian vault. To read prior notes instead, use the `obsidian-lookup` skill.

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

## Writing up completed work

Only after a task is genuinely finished, and only if a write-up adds lasting value (a reusable insight, a decision, a gotcha, a worked approach). Skip trivial or one-off work.

**Always ask first.** Ben does not always want a write-up. Ask a single yes/no question, e.g. "Want me to capture this in your vault?" Do nothing until he says yes.

Once confirmed:

1. **Find the home.** Search the vault for an existing note on the topic. Prefer appending to one over creating a new file. Pick the folder from the map above. If two notes already cover the same ground, say so and propose merging them rather than adding a third.
2. **Draft it.** New notes need YAML frontmatter with a `related:` list of relevant `[[wikilinks]]`. Use `##` headers. Keep it concise and factual, matching the terse style of existing notes, not an essay.
3. **Shape it for the reader.** Apply the `i-have-adhd` skill: lead each section with the command or action, number multi-step procedures, prefer a table over a prose list when every row answers the same question, and write troubleshooting entries symptom-first (`**Skill installed but invisible?**`, then cause, then `Fix:`). Cap a visible list at five items.
4. **Strip the AI tells.** Apply the `humanizer` skill to the prose: no not-X-but-Y contrasts, no one-line closers that restate the line above, no decorative bold, no forced triads, no sentences that describe the note itself ("the table below compares", "four sources, each removed differently"). Leave code blocks, paths, commands, and link targets unchanged. British English spelling.
5. **Check the links.** Every `[[wikilink]]` must resolve to a note that exists, so search for the target before writing one. When creating a new note, add a link to it from the most relevant existing note, otherwise nothing in the vault points at it.
6. **Write and report.** Append under a fitting `##` section or add a new one; never disturb the frontmatter or existing content. If the note contradicts how things now work, correct it in the same edit and say what changed. Confirm the location first when creating a new note or when more than one home is plausible. Report the file as a markdown link.
