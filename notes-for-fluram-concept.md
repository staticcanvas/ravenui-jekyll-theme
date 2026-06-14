Mirroring your Jekyll theme's layout and configuration over to Flarum is a brilliant architectural shortcut, but you need to be aware that the two platforms handle theming in fundamentally different ways.

While Jekyll is a static site generator built on Ruby and Liquid templates, **Flarum is a dynamic Single Page Application (SPA)** powered by a PHP/Laravel backend and a **Mithril.js** frontend. There are zero HTML/Blade/Twig templates to override on the frontend. Everything is rendered via JavaScript components.

Here is an analysis of how customizable Flarum is and how you can achieve your goal of syncing your `_config.yml` parameters.

---

## 🟥 How Customizable is Flarum?

Flarum is **highly extensible**, but it requires a programmatic approach rather than simple template swapping. In Flarum, a "theme" is literally just a standard Flarum extension categorized as a theme.

### 1. Style & Branding (The Easy Part)

Flarum uses **LESS** for its styling. Out of the box, Flarum exposes a core set of semantic LESS variables (like `@primary-color`, `@secondary-color`, `@body-bg`, etc.).

* If you just want to pass your Jekyll color palette down, you can override these variables.
* The backend automatically compiles these LESS sheets into a single minified CSS asset delivered to the SPA client.

### 2. Layout & DOM Manipulation (The Hard Part)

Because Flarum is an SPA built on Mithril.js, you cannot just rewrite an HTML file to change the structure of a post or a discussion sidebar.

* To alter the layout, you must use Flarum’s **Frontend Extenders** in JavaScript/TypeScript.
* You hook into specific components (e.g., `DiscussionList`, `HeaderPrimary`, `PostStream`) and use methods like `extend` or `override` to manipulate the virtual DOM (VNODE) before it renders.

---

## 🟥 Architectural Blueprint: Mirroring `_config.yml` Parameters

To cleanly port your Jekyll theme configuration into Flarum without hardcoding, you need a solid foundation that syncs your Jekyll configuration data to Flarum's asset compilation layer.

### Step 1: The Settings Bridge

Flarum allows extensions to register custom administration settings. You can create an admin settings page within your Flarum theme extension that exposes the exact same keys as your Jekyll configuration (e.g., your layout choices, specific hex codes, boolean toggles for components).

### Step 2: Injecting Settings into LESS

To pass your dynamic color parameters down into the stylesheet compilation phase, you use Flarum's `Settings` object during the frontend asset boot phase.

In your extension’s `extend.php` file, you can listen to the generation of the CSS and inject variables programmatically:

```php
use Flarum\Extend;
use Flarum\Frontend\Assets;
use Flarum\Settings\SettingsRepositoryInterface;

return [
    (new Extend\Frontend('forum'))
        ->css(__DIR__.'/less/forum.less'),

    // Injecting Jekyll-mirrored parameters directly into the LESS compiler
    (new Extend\Settings)
        ->serializeToForum('myThemeLayout', 'my_theme.layout_type'),

    // Hooking into asset compilation to pass dynamic colors
    function (Assets $assets, SettingsRepositoryInterface $settings) {
        $primaryColor = $settings->get('my_theme.primary_color', '#123456');
        $assets->addLessCustomVariables([
            'primary-color' => $primaryColor,
        ]);
    }
];

```

### Step 3: Handling Layouts via JS Components

For layout configurations (e.g., `layout: grid` vs `layout: sidebar`), you read the serialized setting within your frontend JavaScript/TypeScript files:

```javascript
import { extend } from 'flarum/common/extend';
import DiscussionList from 'flarum/forum/components/DiscussionList';

app.initializers.add('my-mirrored-theme', () => {
  // Check the setting passed from the PHP backend
  const layoutType = app.forum.attribute('myThemeLayout');

  if (layoutType === 'grid') {
    extend(DiscussionList.prototype, 'view', function(vnode) {
      // Modify virtual DOM classes to trigger your grid CSS rules
      vnode.children.forEach(child => {
        if (child.attrs && child.attrs.className) {
          child.attrs.className += ' jekyll-mirrored-grid';
        }
      });
    });
  }
});

```

---

## 🟥 Summary Verdict

Can you do it? **Yes.** By building a Flarum theme extension, you can read configuration data out of a database (or seed it programmatically from your Jekyll source code via an API script) and map those properties directly to Flarum's LESS variables and Mithril components.

The visual design will match seamlessly, but your template files themselves cannot be shared; you will write Liquid for Jekyll and Mithril JS/LESS for Flarum.


That is a rock-solid, production-grade architectural vision. By treating Jekyll as your heavy-lifting content engine and Flarum as your dynamic, headless identity and community layer, you get the absolute best of both worlds: instant static page loads for documentation alongside highly interactive user features.

Because Flarum is built as a pure, modern JSON:API from the ground up, this reverse-integration is incredibly clean. Every action in the Flarum UI is powered by API requests, meaning your Jekyll site can pull public data directly without needing any complex server-side wrappers.

Here is the blueprint for how you can build Jekyll components to ingest and display Flarum's public data seamlessly.

---

## 🎛️ Integration Mechanics: Build Time vs. Runtime

When bringing Flarum data into Jekyll, you must decide where the integration lives. A robust architecture uses a mix of both approaches depending on the component's goal.

### 1. Build-Time Ingestion (Static Jekyll Plugins)

For content that changes slowly (e.g., a "Featured Discussions" or "Community Announcements" block on your docs home page), you can write a custom Jekyll generator or plugin in Ruby. During `jekyll build`, it hits your Flarum API, pulls down the data, and bakes it right into the static HTML.

* **Pros:** Absolute zero performance hit for readers; maximum SEO value.
* **Cons:** Requires a site rebuild to update the content (though this can easily be automated using a Flarum webhook to trigger your CI/CD pipeline whenever a specific tag gets a new post).

### 2. Runtime Ingestion (Vanilla JS Components)

For highly dynamic, user-specific data (e.g., "Latest Forum Topics", active user counts, or a live comment thread replacing standard tools like Disqus), you drop JavaScript components directly into your Jekyll liquid templates. These fetch the Flarum JSON data directly from the client's browser.

---

## 🏗️ Technical Blueprint: Connecting the Two

Flarum exposes its core data through exposed endpoints without requiring authentication for public content.

### Step 1: Mapping the Data Paths

To build your Jekyll components, you will target three primary public Flarum API paths:

| Component Goal | Flarum API Endpoint | Useful Query Parameters |
| --- | --- | --- |
| **Global Stats** | `/api` | Contains overall user, discussion, and post totals. |
| **Latest Topics** | `/api/discussions` | `?sort=-createdAt&page[limit]=5` |
| **Category Feed** | `/api/discussions` | `?filter[q]=tag:announcements` |
| **Post Comments** | `/api/posts` | `?filter[discussion]=<id>&filter[type]=comment` |

### Step 2: Sample Jekyll Component Architecture (Live Forum Comments)

Instead of embedding a bulky third-party iframe for documentation feedback, you can create a native Liquid component inside your Jekyll theme (`_includes/flarum-comments.html`) that pulls the discussion thread for that specific document page.

```html
<!-- _includes/flarum-comments.html -->
<div id="flarum-comments-root" data-discussion-id="{{ page.flarum_discussion_id }}">
  <div class="comments-header">
    <h3>Community Discussion</h3>
    <a id="flarum-join-link" href="#" target="_blank" class="btn-community">Join the Conversation</a>
  </div>
  <ul id="comments-list" class="loading">
    <li>Loading latest community insights...</li>
  </ul>
</div>

<script>
  (function() {
    const root = document.getElementById('flarum-comments-root');
    const discussionId = root.getAttribute('data-discussion-id');
    const forumUrl = "{{ site.flarum_url }}"; // Set this in your Jekyll _config.yml
    
    if (!discussionId) return;

    // Set the link to direct users to the actual forum thread
    document.getElementById('flarum-join-link').href = `${forumUrl}/d/${discussionId}`;

    // Fetch the public posts directly from Flarum's JSON:API
    fetch(`${forumUrl}/api/discussions/${discussionId}`)
      .then(response => response.json())
      .then(data => {
        const list = document.getElementById('comments-list');
        list.innerHTML = '';
        list.classList.remove('loading');

        // Extract posts from the JSON:API "included" object (where Flarum stores related post data)
        const posts = data.included ? data.included.filter(item => item.type === 'posts' && item.attributes.contentType === 'comment') : [];
        
        if (posts.length === 0) {
          list.innerHTML = '<li class="no-comments">No comments yet. Start the discussion on the forum!</li>';
          return;
        }

        // Render the top 5 clean, static HTML items inside your Jekyll layout
        posts.slice(0, 5).forEach(post => {
          const li = document.createElement('li');
          li.className = 'flarum-comment-item';
          li.innerHTML = `
            <div class="comment-meta">
              <span class="comment-date">${new Date(post.attributes.createdAt).toLocaleDateString()}</span>
            </div>
            <div class="comment-body">${post.attributes.contentHtml}</div>
          `;
          list.appendChild(li);
        });
      })
      .catch(err => {
        console.error('Failed to load community stream:', err);
      });
  })();
</script>

```

Then, in your Jekyll documentation pages, markdown front-matter acts as the linking mechanism:

```yaml
---
layout: doc
title: "Advanced API Configuration"
flarum_discussion_id: "42"
---

# Advanced API Configuration
This documentation details how to set up the system parameters...

```

---

## ⚠️ Architectural Details to Guard For

To make sure this scales flawlessly for production deployments, ensure your Jekyll theme addresses two critical infrastructure boundaries:

* **CORS Configuration:** Out of the box, browsers will block your Jekyll frontend from hitting your Flarum sub-domain API due to Cross-Origin Resource Sharing rules. Your documentation theme's manual should explicitly instruct users to configure their Flarum Nginx/Apache block or use a CORS extension to allow the documentation domain to pull data securely.
* **Rate Limiting:** If the documentation site gets massive traffic spike hits, raw un-cached client-side API calls can strain the Flarum server. For your theme's high-traffic sections (like a global header showing total member counts), design it to leverage Jekyll's build-time plugins to cache that data or write a quick service worker to cache the responses on the client side.