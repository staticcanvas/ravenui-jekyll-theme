---
layout: default
title: Spacer
output-title: true
tags: [ui, layout, spacer, utilities]
description: A configurable vertical whitespace component for layout building on blank or custom-layout pages.
enable_search: true
---

Use `spacer.html` to add precise vertical separation between elements, particularly on blank or splash layouts where normal markdown paragraph spacing is insufficient.

{% include comps/heading.html tag="h2" text="Live Examples" icon="move-vertical" size=20 %}

**Named size tokens:**

{% include comps/spacer.html size="xs" divider=true divider_style="subtle" %}
`xs` — 0.5rem
{% include comps/spacer.html size="sm" divider=true divider_style="subtle" %}
`sm` — 1rem
{% include comps/spacer.html size="md" divider=true divider_style="subtle" %}
`md` — 2rem (default)
{% include comps/spacer.html size="lg" divider=true divider_style="subtle" %}
`lg` — 4rem
{% include comps/spacer.html size="xl" divider=true divider_style="subtle" %}
`xl` — 6rem

**Gradient divider variant:**

{% include comps/spacer.html size="lg" divider=true divider_style="gradient" %}

{% capture spacer_code %}
{% raw %}
```liquid
{# Named size (xs | sm | md | lg | xl | 2xl) #}
{% include comps/spacer.html size="md" %}

{# Custom height — any CSS unit #}
{% include comps/spacer.html height="5rem" %}

{# With a subtle divider at midpoint #}
{% include comps/spacer.html size="xl" divider=true %}

{# With a gradient divider #}
{% include comps/spacer.html size="xl" divider=true divider_style="gradient" %}

{# With an anchor ID (for scroll targeting) #}
{% include comps/spacer.html size="lg" id="section-break" %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=spacer_code %}

---

{% include comps/heading.html tag="h2" text="API Reference" icon="code" size=20 %}

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `size` | String | `md` | Named height token. Options: `xs`, `sm`, `md`, `lg`, `xl`, `2xl`. Ignored when `height` is set. |
| `height` | String | — | Explicit CSS height (e.g. `"3rem"`, `"80px"`, `"10vh"`). Takes precedence over `size`. |
| `divider` | Boolean | `false` | Renders a horizontal rule at the vertical midpoint of the spacer. |
| `divider_style` | String | `subtle` | Style of the divider line. Options: `subtle`, `gradient`. |
| `id` | String | — | HTML `id` attribute — useful for scroll anchoring to a section break. |
| `class` | String | — | Additional CSS classes to apply to the spacer element. |

---

{% include comps/heading.html tag="h2" text="Size Token Reference" icon="ruler" size=20 %}

| Token | CSS Value | CSS Custom Property Override |
| :--- | :--- | :--- |
| `xs` | `0.5rem` | `--rd-spacer-xs` |
| `sm` | `1rem` | `--rd-spacer-sm` |
| `md` | `2rem` | `--rd-spacer-md` |
| `lg` | `4rem` | `--rd-spacer-lg` |
| `xl` | `6rem` | `--rd-spacer-xl` |
| `2xl` | `10rem` | `--rd-spacer-2xl` |

> **Note:** All size defaults can be overridden globally by setting the corresponding CSS custom property in your project's stylesheet (e.g. `--rd-spacer-lg: 5rem;`).
