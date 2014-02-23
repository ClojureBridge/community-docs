---
layout: docs
title: Anonymous Function
permalink: /docs/clojure/anonymous-function/
level: easy
author: yokolet
---

*Anonymous function* is a function that doesn't have a name.
Some other languages have this feature.
In Java, anonymous function is often used in GUI programming.
The anonymous function is created by `fn` function,
and has a short-hand way by `#(...)`, anonymous function literal.


The simple syntax is:

`(fn [params*] body)`

While `defn` creates function and always binds to the name,
`fn` just creates function. The created function can be bound to name by `def` function.
For example, `(def my-plus (fn [coll] (.....)))`.


### References

- ClojureDocs

    [http://clojuredocs.org/clojure_core/clojure.core/fn](http://clojuredocs.org/clojure_core/clojure.core/fn)

- Clojure, Special Forms

    <a href="http://clojure.org/special_forms#Special Forms--(fn name? [params* ] exprs*)">http://clojure.org/special_forms#Special Forms--(fn name? [params* ] exprs*)</a>

- Clojure for the Brave and True, Do Things, 3.4 Anonymous Function

    [http://www.braveclojure.com/do-things/#3_4__Anonymous_Functions](http://www.braveclojure.com/do-things/#3_4__Anonymous_Functions)