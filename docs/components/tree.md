---
layout: default
title: Directory Tree
output-title: true
tags: [ui, layout, elements, code]
description: A CSS-based folder and file structure tree diagram component to showcase project directories.
enable_search: true
---
The `tree.html` component renders a clean, CSS-styled directory structure map complete with visual lines and folder/file icons. It parses a simple space-indented list of files and folders, eliminating the need to write complex nested HTML lists.

{% include comps/heading.html tag="h2" text="Live Example" icon="folder-git" size=20 %}

{% capture my_tree_data %}
my-project/
  _includes/
    comps/
      tree.html
      icon.html
    core/
      sidebar.html
  _sass/
    ravenui-sp/
      _tree.scss
  index.md
  LICENSE
{% endcapture %}
{% include comps/tree.html data=my_tree_data %}

{% capture tree_eg %}
{% raw %}
```liquid
{% capture my_tree_data %}
my-project/
  _includes/
    comps/
      tree.html
      icon.html
    core/
      sidebar.html
  _sass/
    ravenui-sp/
      _tree.scss
  index.md
  LICENSE
{% endcapture %}
{% include comps/tree.html data=my_tree_data %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=tree_eg %}

---

{% include comps/heading.html tag="h2" text="Syntax Guide" icon="file-text" size=20 %}

To draw the directory tree:
1. Create a text block with space indentations representing folder depth (usually 2 spaces per level).
2. End folder names with a trailing slash (`/`) to automatically render them with folder icons instead of file icons.
3. Pass the captured text block into the `data` parameter of the component.

---

{% include comps/heading.html tag="h2" text="API Reference" icon="code" size=20 %}

### **tree.html Parameters**

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `data` | String | | The raw indented text block representing the directory tree. |
| `class` | String | | Optional custom CSS class. |
