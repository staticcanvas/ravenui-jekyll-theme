---
layout: default
title: API Reference
output-title: true
tags: [ui, documentation, api]
description: A high-density component for documenting web REST API endpoints, HTTP methods, headers, and payloads.
enable_search: true
---
The `api-reference.html` component provides a structured, high-density layout designed for documenting web REST APIs (HTTP endpoints, request payloads, response schemas, and header definitions).

{% include comps/heading.html tag="h2" text="Live Example" icon="play" size=20 %}

{% capture api_headers %}
<li>
    <code>Authorization</code>
    <span class="rd-api-ref-param-type">String</span>
    <span class="rd-api-ref-param-desc">Bearer token for user authentication (Required).</span>
</li>
{% endcapture %}

{% capture api_query %}
<li>
    <code>limit</code>
    <span class="rd-api-ref-param-type">Integer</span>
    <span class="rd-api-ref-param-desc">Number of records to retrieve (Default: 20).</span>
</li>
{% endcapture %}

{% capture api_req_body %}
```json
{
  "name": "Project Alpha",
  "visibility": "public"
}
```
{% endcapture %}

{% capture api_res_body %}
```json
{
  "id": 10293,
  "name": "Project Alpha",
  "created_at": "2026-06-10T11:22:00Z"
}
```
{% endcapture %}

{% include comps/api-reference.html 
    method="POST" 
    path="/api/v1/projects" 
    title="Create Project"
    description="Initialize a new developer workspace and project tracking metrics."
    headers=api_headers
    params=api_query
    body=api_req_body
    response=api_res_body
%}

{% capture api_ref_code %}
{% raw %}
```liquid
{% capture my_headers %}
<li>
    <code>Authorization</code>
    <span class="rd-api-ref-param-type">String</span>
    <span class="rd-api-ref-param-desc">Bearer token.</span>
</li>
{% endcapture %}

{% include comps/api-reference.html 
    method="POST" 
    path="/api/v1/projects" 
    headers=my_headers 
%}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=api_ref_code %}

---

{% include comps/heading.html tag="h2" text="API Reference" icon="code" size=20 %}

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `method` | String | `"GET"` | HTTP request method badge (`GET`, `POST`, `PUT`, `PATCH`, `DELETE`). |
| `path` | String | | The API endpoint route URL path (e.g. `/api/v1/users`). |
| `id` | String | `path` slug | Unique element anchor ID. |
| `title` | String | | Description title displayed on the right-hand header. |
| `description` | String | | Markdown-supported description of the endpoint behavior. |
| `headers` | String | | HTML list items (`<li>`) for HTTP Request Headers. |
| `params` | String | | HTML list items (`<li>`) for URL Query Parameters. |
| `body` | String | | Markdown/code block payload request body. |
| `response` | String | | Markdown/code block payload response body. |
| `class` | String | | Optional CSS class to append to the container. |
