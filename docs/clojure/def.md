---
layout: docs
title: Assignment <code>def</code>
permalink: /docs/clojure/def/
level: easy
author: yokolet
---

In other languages, a variable assignement looks like `var myvar = "something"`, `@myvar = "something"`, or `String myVar = "something"`.

Clojure does a bit different way. Besides, Clojure doesn't call it the variable assignment. It is *var binding*, and whose idea is a bit different from assignement in other languages.

In Clojure, syntax is `(def var-name var-value)`.

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

    If attendees don't know what is a variable, explain briefly.
    Explain the difference between `my-number` and `user/my-number` if necessary.
    Also, it would be helpful to mention about global Vars and namespaces.
    However, the namespace has it's own section, so don't need to be in detail.

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
user=> (str "a" "b") ; str function concatenates strings
"ab"

user=> (def original-plus +) ; saves its original one to make it back later
#'user/original-plus

user=> (def + str) ; binds + to str function
WARNING: + already refers to: #'clojure.core/+ in namespace: user, being replaced by: #'user/+
#'user/+
user=> (+ "a" "b") ; now string concatination works by +
"ab"
user=> (+ 1 2) ; but this doesn't work as an arithmetic operation anymore
"12"
user=> (def + original-plus) ; re-binds to original-plus
#'user/+
user=> (+ 1 2) ; back to normal
3

user=> ; also functions can be bound to

user=> (def ten-times (fn [x] (* 10 x)))
#'user/ten-times
user=> (ten-times 6)
60

user=> (type 'abc)
clojure.lang.Symbol
user=> (def 'abc "abc")

CompilerException java.lang.RuntimeException: First argument to def must be a Symbol, compiling:(NO_SOURCE_PATH:1:1)
user=> ; wow, confusing error message. but we don't need quote for var-name
{% endhighlight %}

- Advice to coaches

    The lab is to use Vars after those are bound.
    If attendees haven't studied how to write function, lab using function is optional.
    The last example is also optional.
