# agent-skills

My personal agent skills.

## How it works

Agents discover skills in `~/.agents/skills/`, but that folder is also written to by other tools. To keep this repo clean, each skill lives here and is **symlinked** into the discovery folder.

Each skill also has a matching prompt file in `prompts/`, symlinked into the VS Code user prompts folder so it works as a `/slash-command` in chat. The command just delegates to the skill.

## Skills

- `obsidian-vault` - Read the Obsidian vault for prior guidance, and optionally write up completed work.
- `minto-pyramid` - Structure business writing answer-first (Minto pyramid).
- `otc-abstract` - Draft and review Offshore Technology Conference abstracts.
- `signs-of-ai-writing` - Strip machine-generated tells from prose.
- `fastpipe-calc-module` - Add or wire up a calculation in the fastpipe codebase.

## Install

Symlink all skills and prompt commands into place:

```bash
./install.sh
```

Re-run it any time you add a new skill or prompt; it only creates missing links and skips anything already in place. Override targets with `AGENT_SKILLS_DIR` and `VSCODE_PROMPTS_DIR` if your folders are elsewhere.

## Add a skill

1. Create `<skill-name>/SKILL.md` with YAML frontmatter (`name`, `description`) and a Markdown body. Front-load trigger phrases in `description` - that is what makes an agent auto-invoke the skill.
2. Optionally add `prompts/<skill-name>.prompt.md` to expose it as `/<skill-name>` in chat.
3. Run `./install.sh`.
4. Commit.
