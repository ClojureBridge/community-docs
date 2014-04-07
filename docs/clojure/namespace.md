---
layout: docs
title: Namespace
permalink: /docs/clojure/namespace/
level: easy
author: yokolet
---

A namespace groups related functions, vars, and other things.
Without namespaces, different functions with the same names would interfere and cause problems.
Even in a REPL, you always work within a namespace.

The repl prompt below is probably familiar to you already.
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


Let's create a new namespace. You can do this in three ways:

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

    Please explain the differences of the three functions, perhaps by using the `doc` function. If the namespace has been changed by `in-ns`, you can call the `doc` function using its namespace. For example:  `(clojure.repl/doc clojure.core/in-ns)`.

<br/>
You can confirm that var names are different in each namespace.
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



So far, we have learned how to create a namespace. The next step is to use namespaces.
You will do this very often because almost all Clojure programs use some or many libraries.
Every library groups functions into its own namespace.

To explore namespaces, we want to set up at least two different namespaces and different functions in those namespaces.

Create a Clojure project and write two Clojure files, `one.clj` and `two.clj`.

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

Once the code is ready, start repl in the my-nses (top) directory.
To use our code, we have two choices: `use` or `require`.
For the first attempt, we will use the `use` function.

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
user=> ; it looks like it's working, yay!

user=> (use 'my-nses.two)

IllegalStateException area already refers to: #'my-nses.one/area in namespace: user  clojure.lang.Namespace.warnOrFailOnReplace (Namespace.java:88)
user=> ; oh no!

user=> ; it's ok. we can narrow down functions to use

user=> (use '[my-nses.two :only [greeting]])
nil
user=> (greeting "Clojure")
Hello!  Clojure
nil
user=> ; but how can we use the area function in my-nses.two namespace ?
{% endhighlight %}

As we tried, `use` function loads the functions of the specified namespace(s) into
current namespace. If you have a duplicate function, that will result in an exception.

In the next attempt, we will use the `require` function.
This resolves the error that happened above.

{% highlight clojure %}
user=> (require 'my-nses.two)
nil
user=> (my-nses.two/area 1 1)
4
user=> ; but every time, we need to type, m, y, -, n, s, e, s, ., t, w, o ?

user=> ; no, we can set up a shortcut

user=> (require '[my-nses.two :as two])
nil
user=> (two/area 2 0)
6
user=> (two/area 2 1)
7
user=> ; we can still use functions in my-nses.one namespace

user=> (area 2 1)
1.0
{% endhighlight %}


We tried just some of the namespace management functions. Clojure has more ways to avoid function name collision. If you're not using a repl, requiring or using other namespaces is slightly different.

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

