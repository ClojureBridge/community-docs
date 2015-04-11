---
layout: page
title: "Workshops"
description: ""
---

{% for post in site.posts %}
  <div class="posts">
    <h3 class="title"><a href="{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a></h2>
    <h3>{{ post.description }}</h3>
    <hr/>
  </div>
{% endfor %}
