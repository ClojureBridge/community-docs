---
layout: page
title: "Workshops"
description: ""
---

{% for post in site.posts %}
  <div class="posts">
    <div id="aside"><span>{{ post.date | date:"%m/%d/%Y" }}</span></div>
    <h2 class="title"><a href="{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a></h2>
    <h3>Date: {{ post.description }}</h3>
    <hr/>
  </div>
{% endfor %}
