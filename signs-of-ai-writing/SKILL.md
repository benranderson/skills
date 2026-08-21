---
name: signs-of-ai-writing
description: Use when writing or editing any prose the user will read - documentation, comments, commit messages, PR descriptions, READMEs, emails, wiki/encyclopedia text, blog posts, chat responses - to strip out the tells that make text read as machine-generated. Triggers include requests to "make this sound human", "remove AI tone", "less robotic", "less corporate", or complaints that writing feels generic, padded, promotional, or formulaic.
license: MIT
metadata:
  author: benranderson
  version: "2.0.0"
  source: "Adapted from Wikipedia:Signs of AI writing (WP:AISIGNS), CC BY-SA 4.0"
---

# Signs of AI Writing

## Overview

LLMs regress to the mean: they smooth specific, unusual facts into generic, positive, important-sounding prose, and they reach for a recognisable set of words, structures, and formatting. The goal is writing that stays specific and plain, so it reads as if a knowledgeable human wrote it directly.

This guide is descriptive, not a rulebook. One tell in isolation is often innocent; a pile-up of them is the signal. Fix the underlying problem (vagueness, puffery, unsupported claims), not just the surface word.

## When to use

- Writing or reviewing docs, comments, commit messages, PR/issue text, READMEs, wiki articles, emails
- The user asks for a "more human", "less robotic", "less promotional", or "less corporate" tone
- Text feels padded, generic, formulaic, or over-hyped even if technically correct

## Content tells

### Undue emphasis on significance, legacy, and broader trends
Puffing up a subject by tying it to larger movements or its "lasting impact".
Watch for: `stands as`, `serves as`, `is a testament to`, `plays a crucial/pivotal/vital/key role`, `underscores/highlights its importance`, `reflects a broader`, `marking a shift`, `key turning point`, `evolving landscape`, `leaving an indelible mark`, `setting the stage for`.
Fix: state the plain fact and stop. Do not editorialise about importance.

### Canned emphasis on notability and media coverage
Proving importance by listing that a subject was "covered" rather than saying what was said.
Watch for: `received independent coverage`, `featured in various outlets`, `profiled in`, `maintains an active social media presence`.
Fix: summarise the actual content, or cut it.

### Superficial analysis via trailing "-ing" phrases
Tacking an interpretive participle clause onto a factual sentence.
Watch for sentences ending in `..., highlighting its significance`, `..., reflecting broader trends`, `..., cementing its legacy`, `..., contributing to the region's growth`.
Fix: delete the clause. If the analysis matters, attribute it to a real source.

### Promotional / advertisement-like language
Travel-brochure or press-release tone.
Watch for: `boasts a`, `vibrant`, `rich (history/culture)`, `nestled`, `in the heart of`, `renowned`, `groundbreaking`, `a diverse array of`, `state-of-the-art`, `commitment to`.
Fix: neutral, factual description.

### Vague attribution and overgeneralised opinion
Attributing views to a vague authority, or inflating one source into many.
Watch for: `Industry reports suggest`, `Observers have noted`, `Experts argue`, `Critics say`, `Many sources`, `It is widely regarded`.
Fix: name the actual source, or drop the claim.

### Outline-like "challenges and future prospects" endings
Watch for a formulaic `Despite its ..., X faces several challenges` paragraph, or sections titled `Challenges`, `Future Outlook`, `Legacy`.
Fix: only include forward-looking or challenge material if it is specific and sourced.

## Language and grammar tells

### High density of "AI vocabulary"
One is coincidence; a cluster is the tell. Common offenders: `delve`, `underscore`, `tapestry`, `testament`, `boasts`, `crucial`, `pivotal`, `showcase`, `foster`, `enhance`, `leverage`, `landscape` (abstract), `meticulous`, `intricate/intricacies`, `garner`, `interplay`, `align with`, `robust`, `seamless`, `realm`, `navigate` (figurative), `Additionally,` (sentence-initial).
Fix: pick the plain word. Overuse of a word does not implicate its synonyms.

### Avoiding plain "is" / "are"
LLMs swap simple copulas for busier verbs.
Watch for: `serves as`, `stands as`, `functions as`, `represents`, `features`, `offers`, `boasts`, `refers to` (in a lead, as if defining the word not the thing).
Fix: use `is`/`are`/`has` where they fit. `Gallery 825 is LAAA's exhibition space` beats `Gallery 825 serves as LAAA's exhibition space`.

### Negative parallelisms
Manufactured contrast that pretends to correct a misconception.
Watch for: `not just X, but Y`, `it's not about A, it's about B`, `not only ... but also`, `no X, no Y, just Z`, and the Grok-style `X rather than Y`.
Fix: make the positive statement directly.

### Rule of three
Reflexive triples: `fast, reliable, and scalable`; `adjective, adjective, and adjective`.
Fix: vary the rhythm; keep only the items that carry information.

### Elegant variation
Straining to avoid repeating a word, so one subject acquires three names in a paragraph.
Fix: repeat the plain noun. Clarity beats variety.

## Style and formatting tells

- Use sentence case headings (`Design overview`, not `Design Overview`).
- Don't bold every key term or the lead phrase of every bullet.
- The `- **Header:** description` pattern on every bullet is an AI fingerprint. Use prose, or plain list items.
- Never use em-dashes (—). Use a hyphen (-), comma, colon, or parentheses, or restructure. (Standing user preference; also a classic tell, especially space-padded ` — `.)
- Don't use emoji as decoration on headings or bullets (✅, 🚀, 🎯) unless explicitly requested.
- Don't paste curly quotes/apostrophes (" " ' ') into code, configs, or plain-text contexts that expect straight ones.
- Don't use tiny decorative tables for two or three facts that belong in a sentence.

## Communication-artifact tells (never leave these in)

- Chat pleasantries: `Certainly!`, `Of course!`, `I hope this helps`, `Would you like me to...`, `Let me know if...`, `Here is a...`.
- Knowledge-cutoff / hedging disclaimers: `As of my last update`, `While specific details are limited`, `not widely documented`, `based on available information`, followed by speculation.
- Unfilled placeholders: `[insert X here]`, `2025-xx-xx`, template blanks left in the text.
- Canned policy/process assurances (in commits/PRs): `revised to ensure neutrality and compliance while preserving the original meaning`. Say what changed and why, specifically.

## Prefer these (signs of human writing)

- Plain verbs: `use` (not utilise), `wrote` (not authored), `moved` (not relocated), `tried` (not attempted), `help` (not facilitate), `about` (not regarding).
- Simple constructions: `there is a`, `it has`, `is the first`.
- Direct superlatives and specifics: `the first train-coupling device`, not `a revolutionary titan of industry`.

## Quick checklist

Before finishing:
1. Search for `—` and remove every one.
2. Cut opening sentences that restate the prompt or set a scene.
3. Delete trailing `-ing` interpretation clauses and `Despite its... challenges` filler.
4. Replace clustered AI vocabulary (delve, underscore, leverage, robust, showcase) with plain words.
5. Restore plain `is`/`are`/`has` where an LLM inflated the verb.
6. Break at least one rule-of-three list; drop empty items.
7. Convert Title Case headings to sentence case; strip decorative bold/emoji.
8. Remove chat pleasantries, hedging disclaimers, and leftover placeholders.
9. Read it aloud. If a knowledgeable colleague would not say it that way, rewrite it.

## Core principle

Say the thing directly, once, in the fewest words that keep it clear and accurate. Specificity and restraint read as human; puffery, hedging, and symmetry read as machine.
