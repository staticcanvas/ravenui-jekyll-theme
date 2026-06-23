## Nunjucks vs Liquid

For your case: **use Liquid first, then selectively move to Nunjucks.**

| Area                     | Liquid   | Nunjucks     |
| ------------------------ | -------- | ------------ |
| Migration from Jekyll    | **Best** | Medium       |
| Syntax familiarity       | **Best** | Good         |
| Component power          | Good     | **Better**   |
| Logic/control flow       | Limited  | **Stronger** |
| Macro/component patterns | Weak     | **Strong**   |
| Long-term extensibility  | Medium   | **High**     |
| Risk during migration    | **Low**  | Medium       |

## My recommendation

```text
Phase 1: Eleventy + Liquid
Phase 2: Normalize component APIs
Phase 3: Convert advanced components to Nunjucks
Phase 4: Keep simple content templates in Liquid
```

## Why

**Liquid is the safe bridge.**
It lets you escape Jekyll without rewriting your whole theme.

**Nunjucks is the better long-term component language.**
It has better macros, better includes, better inheritance, and cleaner reusable UI patterns.

## Rule of thumb

Use **Liquid** for:

```text
pages
posts
simple layouts
legacy components
content-heavy templates
```

Use **Nunjucks** for:

```text
design system components
complex cards
nav systems
tabs
accordions
data-driven sections
enterprise UI blocks
```

## Final call

Do **not** choose one globally yet.

Use:

```text
Liquid = migration layer
Nunjucks = future component layer
```

That gives you the lowest-risk move now and the strongest foundation later.
