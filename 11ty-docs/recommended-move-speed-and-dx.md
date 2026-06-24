## Recommendation

**Move to Eleventy first. Do not build `zap-ssg` yet.**

Your best path:

```text
Jekyll → Eleventy/Liquid → Eleventy/Nunjucks where useful → zap-ssg only after profiling
```

## Why

Your current analysis is mostly right, but I would adjust the verdict:

| Option                                | Verdict                                                  |
| ------------------------------------- | -------------------------------------------------------- |
| **Optimize Jekyll with Zig/.NET AOT** | Reject. Wrong battle.                                    |
| **Move to Hugo**                      | Reject unless speed matters more than authoring comfort. |
| **Move to Eleventy**                  | Best immediate move.                                     |
| **Build zap-ssg now**                 | Too early. Prototype later.                              |

Eleventy supports Liquid directly, and its docs expose Liquid configuration including parameter parsing control, which matters for component migration. ([Eleventy][1]) Mozilla’s Jekyll-to-Eleventy migration is also a real signal: they reported the site building in under 3 seconds instead of minutes. ([Mozilla Hacks – the Web developer blog][2])

## Critical correction

Do **not** assume Eleventy + Bun will be flawless.

Use Bun for scripts and local execution, but keep Node compatibility until proven otherwise. Bun is fast, but some ecosystem packages can still behave differently. Bun’s runtime is designed for fast startup and file execution, but Eleventy plugins, image tools, or native packages may still be the constraint. ([Bun][3])

## Architecture I’d use

```text
/theme
  /components
  /layouts
  /partials
  /tokens
  /data
/content
/assets
/scripts
.eleventy.js
```

Keep the first migration boring:

```text
Liquid components stay Liquid.
CSS stays CSS.
URLs stay stable.
Data shape stays stable.
Only the build engine changes.
```

Then migrate only painful Liquid components to Nunjucks.

## zap-ssg decision

Build `zap-ssg` only if Eleventy fails one of these:

```text
cold build > acceptable threshold
watch rebuild feels slow
component API becomes awkward
data pipeline becomes too custom
plugin layer becomes fragile
```

For `zap-ssg`, do **not** start with a custom Liquid AST parser. Start with a strict component compiler model:

```text
Markdown/frontmatter parser
layout resolver
component registry
data loader
HTML renderer
asset copier
incremental cache
```

Liquid compatibility should be a migration layer, not the foundation.

## Final verdict

**Eleventy is the correct next engineering step.**

It preserves your 82-component investment, removes Ruby from the build path, keeps the system extensible, and gives you a clean testbed for what `zap-ssg` actually needs to be.

[1]: https://www.11ty.dev/docs/languages/liquid/?utm_source=chatgpt.com "Liquid — Eleventy - 11ty"
[2]: https://hacks.mozilla.org/2020/10/to-eleventy-and-beyond/?utm_source=chatgpt.com "To Eleventy and Beyond - the Web developer blog"
[3]: https://bun.com/docs/runtime?utm_source=chatgpt.com "Bun Runtime"
