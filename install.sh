#!/usr/bin/env bash
# Symlink every skill in this repo into the agent skills discovery folder.
# Idempotent: safe to re-run after adding a new skill.
set -euo pipefail

repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
target_dir="${AGENT_SKILLS_DIR:-$HOME/.agents/skills}"
prompts_dir="${VSCODE_PROMPTS_DIR:-$HOME/Library/Application Support/Code/User/prompts}"

# Symlink one path into a target dir, reporting the result. Returns 1 if a link was created.
link_into() {
	local src="$1" dest="$2"
	if [ -L "$dest" ] && [ "$(readlink "$dest")" = "$src" ]; then
		return 0
	fi
	if [ -e "$dest" ] && [ ! -L "$dest" ]; then
		echo "skip: $(basename "$dest") (a real file/dir already exists at $dest)" >&2
		return 0
	fi
	ln -sfn "$src" "$dest"
	echo "linked: $(basename "$dest")"
	return 1
}

# Remove symlinks in a dir that point into this repo but whose source is gone.
# Only touches links we own; tool-managed skills are left alone.
prune_dir() {
	local dir="$1"
	[ -d "$dir" ] || return 0
	for link in "$dir"/*; do
		[ -L "$link" ] || continue
		case "$(readlink "$link")" in
			"$repo_dir"/*) [ -e "$link" ] || { rm -f "$link"; echo "pruned: $(basename "$link")"; } ;;
		esac
	done
}

mkdir -p "$target_dir"
linked=0
for skill in "$repo_dir"/*/; do
	[ -f "${skill}SKILL.md" ] || continue
	link_into "${skill%/}" "$target_dir/$(basename "$skill")" || linked=$((linked + 1))
done

# Prompt files become /slash-commands in VS Code chat.
if [ -d "$repo_dir/prompts" ]; then
	mkdir -p "$prompts_dir"
	for prompt in "$repo_dir"/prompts/*.prompt.md; do
		[ -f "$prompt" ] || continue
		link_into "$prompt" "$prompts_dir/$(basename "$prompt")" || linked=$((linked + 1))
	done
fi

prune_dir "$target_dir"
prune_dir "$prompts_dir"

echo "done ($linked new link(s))"
