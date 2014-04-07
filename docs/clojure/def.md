---
layout: docs
title: Assignment <code>def</code>
permalink: /docs/clojure/def/
level: easy
author: yokolet
---

In other languages, a variable assignment looks like `var myvar = "something"`, `@myvar = "something"`, or `String myVar = "something"`.

Clojure does things in a different way. First, Clojure doesn't call it a variable assignment. It is a *var binding*, and this idea is a bit different from assignment in other languages.

In Clojure, the syntax is `(def var-name var-value)`.

{% highlight clojure %}
user=> (def my-number 234)
#'user/my-number
user=> ; what's that returned thing, "#'user/my-number" ?

user=> (type #'user/my-number)
clojure.lang.Var
user=> ; it is a Var. you just created the Var, at the same time, `my-number` has been bound to 234.

user=> my-number
234
user=> user/my-number
234
user=> ; what's the difference?

{% endhighlight %}

- Advice to coaches

    If attendees don't know what a variable is, please explain briefly.
    The difference between `my-number` and `user/my-number` would be worth mentioning.
    A namespace will have a new binding from Symbol to Var when the def function is used.
    Then each Var will have its value.

    Also, it would be helpful to talk about global Vars and namespaces.
    However, the namespace has its own section, so you don't need to go into detail.

Try some examples.

{% highlight clojure %}
user=> (def my-number 5678)
#'user/my-number
user=> (def your-number 1045)
#'user/your-number
user=> (+ my-number your-number)
6723

user=> ; we can bind various things, for example..
user=> (+ "a" "b") ; + works only for numbers in Clojure

ClassCastException java.lang.String cannot be cast to java.lang.Number  clojure.lang.Numbers.add (Numbers.java:126)
user=> (str "a" "b") ; str function concatenates strings, so ...
"ab"

user=> (def original-plus +) ; saves its original one to make it back later
#'user/original-plus

user=> (def + str) ; binds + to str function
WARNING: + already refers to: #'clojure.core/+ in namespace: user, being replaced by: #'user/+
#'user/+
user=> (+ "a" "b") ; now string concatenation works by +
"ab"
user=> (+ 1 2) ; but this doesn't work as an arithmetic operation any more
"12"
user=> (def + original-plus) ; re-binds to original-plus
#'user/+
user=> (+ 1 2) ; back to normal
3

user=> ; user defined functions can be bound too

user=> (def ten-times (fn [x] (* 10 x)))
#'user/ten-times
user=> (ten-times 6)
60

user=> (type 'abc)
clojure.lang.Symbol
user=> (def 'abc 123)

CompilerException java.lang.RuntimeException: First argument to def must be a Symbol, compiling:(NO_SOURCE_PATH:1:1)
user=> ; Don't put quote before Var name. It is interpreted as (def (quote abc) 123).
{% endhighlight %}

- Advice to coaches

    The main purpose of this lab is to learn how to use Vars after those are bound.
    If attendees haven't studied how to write functions, the lab using functions is optional.


What if you don't remember that you created a Var? If you want to test if a Var exists, use the `resolve` function with the Symbol style of the Var name.

{% highlight clojure %}
user=> (def abc 123)
#'user/abc
user=> (resolve 'abc)
#'user/abc
user=> (resolve abc)

ClassCastException java.lang.Long cannot be cast to clojure.lang.Symbol  clojure.core/ns-resolve (core.clj:3954)
{% endhighlight %}


### References

- ClojureDocs

    [http://clojuredocs.org/clojure_core/clojure.core/def](http://clojuredocs.org/clojure_core/clojure.core/def)

- Introduction to Clojure, Vars

    [http://clojure-doc.org/articles/tutorials/introduction.html#vars](http://clojure-doc.org/articles/tutorials/introduction.html#vars)

- GetClojure

    <a href="http://getclojure.com/search?q=def&num=0" target="_blank">http://getclojure.com/search?q=def&num=0</a>