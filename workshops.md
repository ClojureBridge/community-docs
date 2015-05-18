---
layout: page
title: "Workshops"
description: ""
---

{% for post in site.posts %}
  <div class="posts">
    <h4 class="title"><a href="{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a></h4>
    <h4>{{ post.description }}</h4>
    <hr/>
  </div>
{% endfor %}
