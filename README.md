# skills

My personal agent skills.

## Skills

- `obsidian-lookup` - Read the Obsidian vault for prior guidance.
- `obsidian-writeup` - Capture a write-up of completed work into the Obsidian vault.
- `minto-pyramid` - Structure business writing answer-first (Minto pyramid).
- `otc-abstract` - Draft and review Offshore Technology Conference abstracts.
- `signs-of-ai-writing` - Strip machine-generated tells from prose.
- `fastpipe-calc-module` - Add or wire up a calculation in the fastpipe codebase.

## Install

```bash
npx skills@latest add benranderson/skills -a github-copilot -a pi -g
```

Repeat `-a` per agent; comma-separated lists are rejected. Drop `-g` to install into the current project instead of globally. Skills land in `~/.agents/skills/`, which GitHub Copilot reads directly and Pi symlinks to, so there is one copy and no collisions.

Skills are invocable as their own commands, e.g. `/obsidian-lookup`.

To install as a VS Code Copilot plugin instead, add the repo as a marketplace and install `br-skills` from it:

```jsonc
// settings.json
"chat.plugins.marketplaces": [
    "https://github.com/benranderson/skills"
]
```

Then run **Manage Plugins** from the Command Palette.

