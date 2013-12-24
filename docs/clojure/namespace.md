---
layout: docs
title: Namespace
permalink: /docs/clojure/namespace/
level: easy
author: yokolet
---

Namepace exists to form a group of related functions, vars and others.
What if there's no namespace in Clojue? The world wil be chaos.
Her libary and your library may have the same name but different function.
How can you differentiate hers from yours of the same name?
For this purpose, namespace exists.
Also, you are always in a namespace when you do some stuffs on repl.


The repl prompt below should be familiar to you alreay.
{% highlight clojure %}
user=>
{% endhighlight %}

What is this `user`? This is the default namespace when you start the repl.

{% highlight clojure %}
user=> *ns*
#<Namespace user>

user=> (doc *ns*)
-------------------------
clojure.core/*ns*
  A clojure.lang.Namespace object representing the current namespace.
nil
{% endhighlight %}


Let's create a new namespace. To accomplish this task, you have three function choices.

{% highlight clojure %}
user=> ; creates a new namespace if necessary and stays on the current namespace

user=> (create-ns 'my.first.ns)
#<Namespace my.first.ns>

user=> ; creates a new namespace if necessary and moves on to the given namespace

user=> (in-ns 'my.second.ns)
#<Namespace my.second.ns>

my.second.ns=> ; the same as in-ns, plus, loads clojure.core

my.second.ns=> (ns my.third.ns)
nil
my.third.ns=> (ns user) ; back to user namespace
nil
user=>

{% endhighlight %}

- Advice to coaches

    Please explain the differences of above three functions a little, for example, using `doc` function. If the namespce has been changed by `in-ns`, doc function works with namespace, for example,  `(clojure.repl/doc clojure.core/in-ns)`.

<br/>
Confirm var names are different on each namespace.
{% highlight clojure %}
user=> (def abc 123)  ; creates a var, #'user/abc
#'user/abc
user=> (ns-map 'user)  ; looks up user namespace var mapping
{sorted-map #'clojure.core/sorted-map, read-line #'clojure.core/read-line, re-pattern #'clojure.core/re-pattern, cond->> #'clojure.core/cond->>, keyword? #'clojure.core/keyword?, (... a bunch, snip)

user=> ('abc (ns-map *ns*))  ; finds a value giving a key, abc
#'user/abc
user=> ; #'user/abc is there

user=> (ns my.third.ns)
nil
my.third.ns=> (def abc 456) ; creates a var, #my.third.ns/abc
#'my.third.ns/abc

my.third.ns=> ('abc (ns-map *ns*)) ; checks #'my.third.ns/abc is there
#'my.third.ns/abc

my.third.ns=> abc
456
my.third.ns=> user/abc
123
{% endhighlight %}

(More comming soon ...)
