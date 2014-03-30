---
layout: docs
title: Conditional <code>case</code>
permalink: /docs/clojure/case/
level: easy
author: yokolet
---

The `case` macro is a similar conditional to [`cond/condp`]({{ site.baseurl}}/docs/clojure/cond/).
It branches to mutiple clauses.
The difference is, `case` doesn't evaluate branching expression.
In `case`, it should be a constant.
What we can do with `case` looks like [`map (data structure)`]({{ site.baseurl}}/docs/clojure/hash/).

The syntax is: `(case e & clauses)`

{% highlight clojure %}
user> (defn cases-to-do
        [temp]
        (case temp
          :65-80 "I'll enjoy walking at a park."
          :45-64 "I'll spend time at a cafe."
          "I'll curl up in my bed"))
#'user/cases-to-do
user> (cases-to-do :65-80)
"I'll enjoy walking at a park."
user> (cases-to-do :45-64)
"I'll spend time at a cafe."
user> (cases-to-do :30)
"I'll curl up in my bed"
user> (cases-to-do :100) ; also falls to default
"I'll curl up in my bed"

user> ; if we use map...
user> (def my-cases {:64-80 "I'll enjoy walking at a park."
                     :45-64 "I'll spend time at a cafe."
                     :other "I'll curl up in my bed"})
#'user/my-cases
user> (my-cases :64-80)
"I'll enjoy walking at a park."
user> (my-cases :45-64)
"I'll spend time at a cafe."
user> (my-cases :other)
"I'll curl up in my bed"
user> (my-cases :30) ; hash-map can't take a key that doesn't match anything
nil
{% endhighlight %}


### References

- ClojureDocs

    [http://clojuredocs.org/clojure_core/clojure.core/case](http://clojuredocs.org/clojure_core/clojure.core/case)


- Clojure from the ground up: macros, Control flow

    [http://aphyr.com/posts/305-clojure-from-the-ground-up-macros](http://aphyr.com/posts/305-clojure-from-the-ground-up-macros)


- GetClojure

    <a href="http://getclojure.com/search?q=case&num=0" target="_blank">http://getclojure.com/search?q=case&num=0</a>
