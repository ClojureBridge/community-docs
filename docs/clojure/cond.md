---
layout: docs
title: Conditional <code>cond</code>
permalink: /docs/clojure/cond/
level: easy
author: yokolet
---

The `cond` macro is, like [`if`]({{ site.baseurl}}/docs/clojure/if/) conditional,
does branching. Unlike `if`, `cond` can take multiple tests and corresponding clauses.
Since Clojure doesn't have *else if*, cond is used for that purpose.
For example, below needs three tests.

  - if a temperature is over 65F, I'll enjoy walking at a park.
  - if a temperature is lower than 65F and higher than 45F, I'll spend time at a cafe.
  - if a temperature is below 45F, I'll crawl in my bed.

In this case, we can't use `if`, but can do by `cond`.

The syntax is: `(cond & clauses)`


{% highlight clojure %}
user> (defn what-to-do
        [temp]
        (cond
         (> temp 65) "I'll enjoy walking at a park."
         (> temp 45) "I'll spend time at a cafe."
         :else "I'll curl up in my bed."))
#'user/what-to-do
user> (what-to-do 70)
"I'll enjoy walking at a park."
user> (what-to-do 50)
"I'll spend time at a cafe."
user> (what-to-do 30)
"I'll curl up in my bed."
{% endhighlight %}
<br/><br/>

Clojure has `condp` macro also.
The usage is similar to `cond`, but it takes a part of *test* right after the condp.

The syntax is: `(condp pred expr & clauses)`

{% highlight clojure %}
user> (defn what-to-do-p
        [temp]
        (condp < temp
               65 "I'll enjoy walking at a park."
               45 "I'll spend time at a cafe."
               "I'll curl up in my bed"))
#'user/what-to-do-p
user> (what-to-do-p 70)
"I'll enjoy walking at a park."
user> (what-to-do-p 50)
"I'll spend time at a cafe."
user> (what-to-do-p 30)
"I'll curl up in my bed"
{% endhighlight %}
<br/>


### References

- ClojureDocs

  - `cond`
    [http://clojuredocs.org/clojure_core/clojure.core/cond](http://clojuredocs.org/clojure_core/clojure.core/cond)

  - `condp`
    [http://clojuredocs.org/clojure_core/clojure.core/condp](http://clojuredocs.org/clojure_core/clojure.core/condp)

- Introduction to Clojure, Control Structures

    [http://clojure-doc.org/articles/tutorials/introduction.html#control-structures](http://clojure-doc.org/articles/tutorials/introduction.html#control-structures)

- Clojure from the ground up: macros, Control flow

    [http://aphyr.com/posts/305-clojure-from-the-ground-up-macros](http://aphyr.com/posts/305-clojure-from-the-ground-up-macros)


- GetClojure

    <a href="http://getclojure.com/search?q=cond&num=0" target="_blank">http://getclojure.com/search?q=cond&num=0</a>