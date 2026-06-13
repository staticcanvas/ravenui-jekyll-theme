---
layout: default
title: Markdown Overrides
output-title: true
tags: [markdown, style, syntax]
description: Zero-Dark enhances standard markdown with high-contrast, technical styling.
---

We have extended the default Jekyll/Kramdown rendering to match the theme's professional aesthetic.

{% include comps/heading.html tag="h2" text="Typography" icon="type" size=20 %}

#### Blockquotes
> Zero-Dark blockquotes feature a subtle accent border and muted text, perfect for secondary information or context.

#### Inline Code
Use backticks for `inline code snippets`. These use the font family configured for mono text with a subtle background highlight.

#### Keyboard Shortcuts
You can render styled keys like <kbd>Ctrl</kbd> + <kbd>/</kbd> to document shortcuts.

---


{% include comps/heading.html tag="h2" text="Code Blocks" icon="code" size=20 %}

Syntax highlighting is powered by **Rouge** with our custom **Ethereal Rouge** theme.

```javascript
// Zero-Dark Code Block
const theme = {
  name: "Zero-Dark",
  version: "1.3.4",
  status: "stable"
};
```

**Features:**
- **Copy to Clipboard:** One-click copying for all code blocks.
- **Language Labels:** Automatic language detection and labeling.
- **Widescreen Support:** Horizontal scrolling with custom scrollbar styling.

---

{% include comps/heading.html tag="h2" text="Tables" icon="grid" size=20 %}

Tables are styled for density and readability.

| Feature | Support | Note |
| :--- | :--- | :--- |
| High Contrast | 🟩 Full | 85% contrast ratio. |
| Responsive | 🟦 Full | Horizontal scroll on mobile. |
| Zebra Stripes | 🟥 None | Clean, border-based separation. |

---

{% include comps/heading.html tag="h2" text="Horizontal Rules" icon="minus" size=20 %}

Standard markdown `---` renders as a subtle, low-opacity divider to separate logical sections without visual clutter.

---

{% include comps/heading.html tag="h2" text="Stylized Lists" icon="list" size=20 %}

We have overridden standard markdown lists to match the theme's high-contrast aesthetic.

#### Unordered Lists
- Automatic vector diamond bullets.
- Refined vertical spacing.

#### Ordered Lists
1. Automatic double-digit numbering (`01`, `02`).
2. Highlighted background for the counter.

#### Task Lists (Checkboxes)
- [x] Custom styled checkbox for completed tasks.
- [x] Accessible, high-contrast states.
