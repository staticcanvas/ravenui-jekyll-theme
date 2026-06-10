---
layout: default
title: Liquid IRL
description: Using theme-specific CSS utility classes directly in your Markdown content.
output-title: true
tags: [style, custom, liquid]
---

ZeroDark SP provides a set of utility classes that can be applied directly to Markdown elements using the Liquid Inline Attribute Syntax (`{: .class-name }`). This allows for high-precision styling without leaving your Markdown files.

{% include comps/heading.html tag="h2" text="Text Colors" icon="type" size=20 %}

Apply theme colors to any text element.

| Class | Example |
| :--- | :--- |
| `.fg-highlight` | <span class="fg-highlight">System Highlight</span> |
| `.fg-platinum` | <span class="fg-platinum">Platinum Accent</span> |
| `.fg-info` | <span class="fg-info">Information</span> |
| `.fg-warning` | <span class="fg-warning">Warning</span> |
| `.fg-danger` | <span class="fg-danger">Danger/Error</span> |
| `.fg-muted` | <span class="fg-muted">De-emphasized</span> |

### Brand Palette
| Class | Example |
| :--- | :--- |
| `.fg-viridian` | <span class="fg-viridian">Viridian Brand</span> |
| `.fg-note` | <span class="fg-note">Note Purple</span> |
| `.fg-slate` | <span class="fg-slate">Slate Gray</span> |
| `.fg-ash` | <span class="fg-ash">Ash Muted</span> |

**Usage:**
```markdown
This is some **important text**{: .fg-danger }.
```

---

{% include comps/heading.html tag="h2" text="Gradients & Borders" icon="palette" size=20 %}

| Class | Description |
| :--- | :--- |
| `.bg-gradient-highlight` | Apply a brand gradient to text or backgrounds. |
| `.border-highlight` | Solid brand-color border. |
| `.border-dim` | Subtle dark border. |
| `.border-dashed` | Change border style to dashed. |

---

{% include comps/heading.html tag="h2" text="Typography Utilities" icon="align-left" size=20 %}

Control font size, weight, and family.

| Class | Description |
| :--- | :--- |
| `.font-heading` | Force **Fraunces** serif font. |
| `.font-mono` | Force **MonaspiceAr** monospace font. |
| `.fz-xs` | Extra Small Font (0.75rem) |
| `.fz-sm` | Small Font (0.875rem) |
| `.fz-lg` | Large Font (1.25rem) |
| `.fz-xl` | Extra Large (1.5rem) |
| `.fz-xxl` | Double Extra Large (2.5rem) |
| `.fw-400` | Regular weight |
| `.fw-500` | Medium weight |
| `.fw-800` | Extra Bold |
| `.fw-900` | Black weight |
| `.robost` | Ultra-bold uppercase with spacing. |

**Usage:**
```markdown
### SYSTEM ONLINE{: .fz-xxl .bg-gradient-highlight .robost }
```

---

{% include comps/heading.html tag="h2" text="Layout & Spacing" icon="layout" size=20 %}

Adjust margins and alignment for individual elements.

| Class | Description |
| :--- | :--- |
| `.m-0` | Remove all margins |
| `.mt-0` | Remove top margin |
| `.mb-0` | Remove bottom margin |
| `.text-center` | Center align text |
| `.text-right` | Right align text |

---

{% include comps/heading.html tag="h2" text="Combining Classes" icon="layers" size=20 %}

You can chain multiple classes together to achieve complex styles.

```markdown
### Pro Tip{: .text-highlight .mb-0 }
This is a high-density note with no bottom margin.{: .fz-sm }
```

### Pro Tip{: .text-highlight .mb-0 }
This is a high-density note with no bottom margin.{: .fz-sm }
