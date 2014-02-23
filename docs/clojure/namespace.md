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
user=> ; below creates a new namespace if necessary and stays on the current namespace

user=> (create-ns 'my.first.ns)
#<Namespace my.first.ns>

user=> ; below creates a new namespace if necessary and moves on to the given namespace

user=> (in-ns 'my.second.ns)
#<Namespace my.second.ns>

my.second.ns=> ; below is the same as in-ns, plus, loads clojure.core

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



So far, we learned how to create the namespace. Next step is to use the namespaces.
This happens very often since almost all Clojure programs use some or many libraries.
Every libaries are grouped by their own namespaces.

To use namespaces, we want at least two different namespaces and function in those.

Create a Clojure project and write two Clojure code, `one.clj` and `two.clj`.


{% highlight bash %}
$ lein new my-nses
{% endhighlight %}

Both `one.clj` and `two.clj` should be in the my-nses/src/my_nses directory.

    my-nses/src
    └── my_nses
        ├── one.clj
        └── two.clj

{% gist 8293730 %}

{% gist 8293748 %}

If the code is ready, start repl at the my-nses (top) directory.
To use our code, we have two choices, `use` and `require` functions.
For the first attempt, we will use `use` function.

{% highlight clojure %}
user=> (use 'my-nses.one)
nil
user=> (greet)
Good-Bye!
nil
user=> (greet "Clojure")
Welcome!  Clojure
nil
user=> (area 4 6)
12.0
user=> ; it looks working yay!

user=> (use 'my-nses.two)

IllegalStateException area already refers to: #'my-nses.one/area in namespace: user  clojure.lang.Namespace.warnOrFailOnReplace (Namespace.java:88)
user=> ; oh no!

user=> ; it's ok. we can narrow down functions to use

user=> (use '[my-nses.two :only [greeting]])
nil
user=> (greeting "Clojure")
Hello!  Clojure
nil
user=> ; but, how can we use area function in my-nses.two namespace ?
{% endhighlight %}

As we tried, `use` function loads functions of specified namespace(s) to
current namespace. So, duplication ends up in the exception.

In the next attempt, we use `require` function.
This resolves the trouble happened above.

{% highlight clojure %}
user=> (require 'my-nses.two)
nil
user=> (my-nses.two/area 1 1)
4
user=> ; but every time, we need to type, m, y, -, n, s, e, s, ., t, w, o ?

user=> ; no, we can setup shortcut

user=> (require '[my-nses.two :as two])
nil
user=> (two/area 2 0)
6
user=> (two/area 2 1)
7
user=> ; still we can use functions in my-nses.one namespace

user=> (area 2 1)
1.0
{% endhighlight %}


We tried just a part of namespace mangement functions. Clojure has more ways to avoid function name collision. Also, requiring or using other namespaces not on repl is slightly different.

Please see references for details:

### References
These are useful references, especially, the first is worth reading.

- Clojure Libs and Namespaces: require, use, import, and ns

  [http://blog.8thlight.com/colin-jones/2010/12/05/clojure-libs-and-namespaces-require-use-import-and-ns.html](http://blog.8thlight.com/colin-jones/2010/12/05/clojure-libs-and-namespaces-require-use-import-and-ns.html)

- Clojure namespaces

  [http://clojure.org/namespaces](http://clojure.org/namespaces)

- ClojureDocs

  - `*ns*`
      [http://clojuredocs.org/clojure_core/clojure.core/*ns*](http://clojuredocs.org/clojure_core/clojure.core/*ns*)
  - `ns`
      [http://clojuredocs.org/clojure_core/clojure.core/ns](http://clojuredocs.org/clojure_core/clojure.core/ns)
  - `in-ns`
      [http://clojuredocs.org/clojure_core/clojure.core/in-ns](http://clojuredocs.org/clojure_core/clojure.core/in-ns)
  - `create-ns`
      [http://clojuredocs.org/clojure_core/clojure.core/create-ns](http://clojuredocs.org/clojure_core/clojure.core/create-ns)
  - `use`
      [http://clojuredocs.org/clojure_core/clojure.core/use](http://clojuredocs.org/clojure_core/clojure.core/use)
  - `require`
      [http://clojuredocs.org/clojure_core/clojure.core/require](http://clojuredocs.org/clojure_core/clojure.core/require)
<br/><br/>

- Clojure Namespaces and Vars

    [http://clojure-doc.org/articles/language/namespaces.html](http://clojure-doc.org/articles/language/namespaces.html)

- Clojure for the Brave and True, Organizing Your Project: a Librarian's Tale, 3. Creating and Switching to Namespaces

  [http://www.braveclojure.com/organization/](http://www.braveclojure.com/organization/) 

