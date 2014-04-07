---
layout: docs
title: HTML generation by Hiccup
permalink: /docs/web-applications/hiccup/
level: easy
author: yokolet
---

A web application is there to send back HTML (and Javascript/Stylesheet) to a web browser.
HTML may be a statically created file, or it can be dynamically created by a program.
This section is about how to create HTML dynamically with Clojure.

In Clojure world, there are a number of HTML generation tools:

  - [Hiccup](https://github.com/weavejester/hiccup)
  - [Enlive](https://github.com/cgrand/enlive)
  - [Selmer](https://github.com/yogthos/Selmer)
  - [Hoplon](http://hoplon.io/)
  - etc.

This document focuses on Hiccup, which is simple and commonly used.

<br/><br/>

#### Project setup

Since Hiccup is not included in Clojure, we need to get the Hiccup library first.
We do this by following the three steps below:

  1. Create a Clojure project

     ```
     lein new hello-hiccup
     ```

  2. Add Hiccup to dependencies to project.clj

      - `cd hello-hiccup`
      - open project.clj with your favorite editor
      - add [hiccup "1.0.5"] to the dependencies<br/><br/>

      The project.clj will look like below:

      {% gist 9358960 %}


  3. Start repl (this triggers to download Hiccup archive)

      ```
      lein repl
      ```
<br/><br/>

- Advice to coaches

    To try Hiccup examples here on LightTable, we need some extra steps.

    1. Before connecting to instarepl, open `src/hello-hiccup/core.clj`
    2. Add hiccup.core to ns form.

        {% gist 9359173 %}

    3. Evaluate core.clj by cmd-enter (this resolves dependencies on LightTable)
    4. Open instarepl
    <br/><br/>

#### Try on repl

Hiccup sees HTML as data.
On Hiccup, HTML tags and attributes are expressed by Clojure's data structure.

Let's try some examples on repl.

{% highlight clojure %}
user=> (use 'hiccup.core)
nil
user=> (use 'hiccup.page)
nil
user=> (use 'hiccup.form)
nil
user=> ; everything is loaded on the repl
user=> ; let's try some HTML tags

user=> (html
  #_=> [:div {:class "url"}
  #_=> [:a {:href "http://clojure.org"} "Clojure - home"]])
"<div class=\"url\"><a href=\"http://clojure.org\">Clojure - home</a></div>"

user=> ; html5 tag and javascript/stylesheet tags
user=> (html5
  #_=> {:lang "en"}
  #_=> [:head (include-js "myscript.js") (include-css "mystyle.css")]
  #_=> [:body [:div [:h1 {:class "info"} "Hiccup"]]])
"<!DOCTYPE html>\n<html lang=\"en\"><head><script src=\"myscript.js\" type=\"text/javascript\"></script><link href=\"mystyle.css\" rel=\"stylesheet\" type=\"text/css\"></head><body><div><h1 class=\"info\">Hiccup</h1></div></body></html>"

user=> ; HTML form tags
user=> (label :hello "clojure")         ; generates Clojure data
[:label {:for "hello"} "clojure"]
user=> (html (label :hello "clojure"))  ; html macro converts it to HTML
"<label for=\"hello\">clojure</label>"

user=> (text-field :title)
[:input {:type "text", :name "title", :id "title", :value nil}]
user=> (html (text-field :title))
"<input id=\"title\" name=\"title\" type=\"text\" />"

user=> (check-box :yes true "yay!")
[:input {:type "checkbox", :name "yes", :id "yes", :value "yay!", :checked true}]
user=> (html (check-box :yes true "yay!"))
"<input checked=\"checked\" id=\"yes\" name=\"yes\" type=\"checkbox\" value=\"yay!\" />"

user=> ; using vector data
user=> (def colors [:white :green :pink])
#'user/colors
user=> (html (select-options colors))
"<option>white</option><option>green</option><option>pink</option>"
{% endhighlight %}


- Advice to coaches

    It's a good idea to look at the Hiccup API docs and try some more tags.
    <br/><br/>

### References

- Hiccup Home

    [https://github.com/weavejester/hiccup](https://github.com/weavejester/hiccup)

- Hiccup API document

    [http://weavejester.github.io/hiccup/](http://weavejester.github.io/hiccup/)