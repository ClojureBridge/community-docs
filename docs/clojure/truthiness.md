---
layout: docs
title: Truthiness
permalink: /docs/clojure/truthiness/
level: easy
author: yokolet
---

Is it true or false? This test is used very often while coding.
The form for testing true/false may not be straightforward.
Sometimes it is a result of function, a variable, or a combination of those.
But the rule is simple. Try the following examples and see what makes it true or false.


#### On repl

{% highlight clojure %}
user=> (true? true)
true
user=> (false? false)
true
user=> (nil? nil)
true
user=> (true? 2)
false
user=> (false? nil)
false
user=> (true? (= 2 4/2))
true
user=> (false? (= 2 2 3))
true
user=> (not (true? (= 3 4)))
true
{% endhighlight %}


- Advice to coaches

    The examples above test whether values are true or false. In contrast, examples below are truthy or falsey.

    Since this is a pretty easy lab, it may be a good time to explain `(doc false?)` or the usage of functions of functions, like `(not (true? (= 3 4)))`.

#### On repl

  - if: [http://clojuredocs.org/clojure_core/clojure.core/if](http://clojuredocs.org/clojure_core/clojure.core/if), [`if`]({{ site.baseurl}}/docs/clojure/if/)

{% highlight clojure %}
user=> (if true :it-is-truthy :it-isn't-truthy)
:it-is-truthy
user=> (if 2 :it-is-truthy :it-isn't-truthy)
:it-is-truthy

user=> (if false :it-isn't-falsey :it-is-falsey)
:it-is-falsey
user=> (if nil :it-isn't-falsey :it-is-falsey)
:it-is-falsey

user=> (if-not true :it-isn't-truthy :it-is-truthy)
:it-is-truthy
user=> (if-not false :it-is-falsey :it-isn't-falsey)
:it-is-falsey

user=> (if-not (= 3/2 9/6) :it-isn't-truthy :it-is-truthy)
:it-is-truthy
{% endhighlight %}


- Advice to coaches

    Pleaae explain the rule of truthy and falsey. Only false and nil are falsey. All others are truthy. If possible, let attendees create their own if/if-not examples.

    For attendees who have programming backgrounds, it may be interesting to talk about the result of `(if (Boolean. "false") :truthy :falsey)`.
