# agent-skills

My personal agent skills, packaged as an installable plugin.

## How it works

This repo is a plugin. Skills live under `skills/<skill-name>/SKILL.md`, and `.claude-plugin/plugin.json` lists them so the whole set installs as one managed bundle. Installing the plugin discovers every skill and exposes each as a `/slash-command`. No symlinks to maintain.

## Skills

- `obsidian-vault` - Read the Obsidian vault for prior guidance, and optionally write up completed work.
- `minto-pyramid` - Structure business writing answer-first (Minto pyramid).
- `otc-abstract` - Draft and review Offshore Technology Conference abstracts.
- `signs-of-ai-writing` - Strip machine-generated tells from prose.
- `fastpipe-calc-module` - Add or wire up a calculation in the fastpipe codebase.

## Install

Install this repo as a plugin from your agent (for example `npx skills@latest add <owner>/skills`, or clone it into your agent's plugin folder). The plugin manifest handles discovery.

## Add a skill

1. Create `skills/<skill-name>/SKILL.md` with YAML frontmatter (`name`, `description`) and a Markdown body. Front-load trigger phrases in `description` - that is what makes an agent auto-invoke the skill.
2. Add `"./skills/<skill-name>"` to the `skills` array in `.claude-plugin/plugin.json`.
3. Commit.
