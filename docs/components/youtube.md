---
layout: default
title: YouTube Embed
output-title: true
tags: [ui, elements, media, video]
description: Privacy-friendly and responsive YouTube video embedding component.
---

The `youtube.html` component provides a responsive wrapper for embedding YouTube videos. It uses the privacy-enhanced domain (`youtube-nocookie.com`) by default to protect user data and comply with privacy regulations.

{% include comps/heading.html tag="h2" text="Live Example" icon="play" size=20 %}

{% include comps/youtube.html id="dQw4w9WgXcQ" title="Rick Astley - Never Gonna Give You Up" %}

{% capture yt_eg %}
{% raw %}
```liquid
{% include comps/youtube.html 
   id="dQw4w9WgXcQ" 
   title="Rick Astley - Never Gonna Give You Up" %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=yt_eg %}

---

{% include comps/heading.html tag="h2" text="API Reference" icon="code" size=20 %}

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `id` | String | | The 11-character YouTube Video ID (e.g., `dQw4w9WgXcQ`). |
| `title` | String | `"YouTube video player"` | Accessibility title for the iframe `title` attribute. |
| `aspect_ratio` | String | `"16/9"` | Aspect ratio for the responsive container (e.g., `16/9`, `4/3`, `21/9`). |
| `autoplay` | Boolean | `false` | Set to `true` to autoplay the video on load. |
| `mute` | Boolean | `false` | Set to `true` to mute the audio (often required for autoplay to work in modern browsers). |
| `start` | Integer | | The start time in seconds (e.g., `30` to start 30 seconds in). |
| `class` | String | | Optional CSS class to append to the container. |
