---
name: context-research
description: Mandatory workflow for documentation research - always use local Context MCP first (get_docs, search_packages, download_package), only fall back to websearch as last resort. Includes guidance for augmenting the local context database.
license: MIT
compatibility: opencode
metadata:
  audience: all-agents
  priority: high
---

# Context-First Documentation Research

## Overview

This project uses the **Neuledge Context MCP** as the **PRIMARY** source for framework, library, and product documentation research. The `websearch-fallback` Tavily MCP (free tier, 1000 searches/month) is a **LAST RESORT** only.

Maximizing local context usage saves your websearch quota, provides faster offline results, and delivers version-specific accuracy that web search cannot match.

---

## Available Tools

### Context MCP (PRIMARY - use first)

| Tool | Purpose |
|------|---------|
| `context_get_docs` | Query installed documentation by library and topic |
| `context_search_packages` | Search the community registry for available packages |
| `context_download_package` | Download and install a package from the registry |

### Websearch-fallback MCP (LAST RESORT only)

| Tool | Purpose |
|------|---------|
| `websearch-fallback_tavily_search` | Web search (1000 searches/month limit) |
| `websearch-fallback_tavily_extract` | Extract content from URLs |
| `websearch-fallback_tavily_crawl` | Crawl a website |
| `websearch-fallback_tavily_research` | Deep research via web |

---

## Mandatory Research Workflow

**Every time you need documentation for a framework, library, package, or product, follow this exact sequence:**

### Step 1: Try `context_get_docs` first

```
context_get_docs(library="library@version", topic="keyword")
```
- Use short keywords for the topic: `"cors"`, `"createServer"`, `"auth middleware"`
- If you know the library is installed, call this directly

### Step 2: Library not installed? Search the registry

If `get_docs` fails because the library isn't listed in the available enum:

```
context_search_packages(registry="npm", name="library-name")
```
- Common registries: `"npm"`, `"pip"`, `"cargo"`, `"go"`
- This tells you what packages and versions are available

### Step 3: Install the best match

```
context_download_package(registry="npm", name="next", version="15.0.4")
```
- Pick the version closest to what the project uses
- After installation, the package is **immediately** available via `get_docs` — no restart needed

### Step 4: Retry `context_get_docs`

```
context_get_docs(library="next@15.0", topic="middleware auth")
```

### Step 5 (LAST RESORT): Websearch-fallback

Only use `websearch-fallback_tavily_search` when:
- The library has NO package in the context registry (Step 2 returned empty)
- You need very recent information (today's news, breaking changes from hours ago)
- The question is about something not typically in docs (community opinions, comparisons, Stack Overflow answers)

---

## Augmenting the Context Database

When you encounter documentation that isn't in the registry and web search also struggles, augment the local database for future use.

### Method A: Install from GitHub repo (most common)
```bash
# Agent runs via Bash tool:
context add https://github.com/vercel/next.js
context add https://github.com/facebook/react --path packages
```
- Auto-detects docs folder, auto-selects latest tag
- Use `--tag` for a specific version
- Use `--name` to override the package name

### Method B: From a website with llms.txt
```bash
context add https://svelte.dev
context add https://mui.com/material-ui
```
- Fetches `llms.txt` or `llms-full.txt` automatically
- Follows all documented links and extracts content

### Method C: From a local directory
```bash
context add ./my-project/docs --name my-project-docs
```

### Method D: Share with team (save as .db)
```bash
context add https://github.com/my-company/design-system --save ./packages/
# Distribute packages/ folder, teammates install instantly:
context add ./packages/my-design-system.db
```

**When to augment:** When you find yourself using `websearch-fallback` for documentation that should be local. After getting the answer from web search, run `context add` on the source so next time it's instant and offline.

---

## Anti-Patterns (NEVER do these)

1. **Never** call `websearch-fallback` before trying `context_get_docs`
2. **Never** skip Steps 2-3 when a library isn't found - search the registry first
3. **Never** burn websearch quota on "how to use [library]" questions - these are doc lookups
4. **Never** assume a library is unavailable locally without checking `search_packages`

## Pro-Tips

- When working on a project, install all major dependencies' docs upfront to build your local knowledge base
- The context database is persistent - once installed, docs survive restarts
- Use the Bash tool to run `context list` anytime to see what's installed
- For npm packages, the registry name usually matches the package name exactly
- When in doubt between context and websearch, **always choose context first**
