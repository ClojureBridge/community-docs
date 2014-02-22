---
layout: docs
title: Basics of Function
permalink: /docs/clojure/function-creation/
level: easy
author: yokolet
---

Clojure is a functional programming language.
Creating and using functions, also, creating functions to use functions are what Clojure programers do.
Clojure has a couple of ways to create a function.
Among them, function definition by `defn` would be the most popular one.

The syntax is:

  ```
  (defn name doc-string? attr-map? [params*] body)
  ```

Just above may be unclear how to write.
It is a good idea to look at how other functions do.
For example, let's look at `+` function,
which we can see at [https://github.com/clojure/clojure/blob/master/src/clj/clojure/core.clj](https://github.com/clojure/clojure/blob/master/src/clj/clojure/core.clj)

{% highlight clojure %}
(defn +
  "Returns the sum of nums. (+) returns 0. Does not auto-promote
  longs, will throw on overflow. See also: +'"
  {:inline (nary-inline 'add 'unchecked_add)
   :inline-arities >1?
   :added "1.2"}
  ([] 0)
  ([x] (cast Number x))
  ([x y] (. clojure.lang.Numbers (add x y)))
  ([x y & more]
    (reduce1 + (+ x y) more)))
{% endhighlight %}

Compare `defn` syntax and the actual function code.

  - `name` is `+`
  - `doc-string?` is "Returns the sum of nums...(snip)...See also: +'"
  - `attr-map?` is `{:inline (nary-inline...(snip)...:added "1.2"}`
  - `[params*]` is either `[], [x], [x y], or [x y & more]`
  - `body`s follow each params. `0`,` (cast Number x)` or other


We use `+` function like:
{% highlight clojure %}
user=> (+)            ; params []
0
user=> (+ 3)          ; parans [x]
3
user=> (+ 3 4)        ; params [x y]
7
user=> (+ 3 4 5 6 7)  ; params [x y & more]
25
{% endhighlight %}


Also, see the function documentation using `doc` function how `doc-string?`
and other compoments will show up.

- Advice to coaches

    Please make sure *console* is opened if attendees are using LightTable.
    On other repl, in some case, clojure.repl is not loaded.
    For such case, don't forget `(use '[clojure.repl])`.
    The `doc` function is available after that.



{% highlight clojure %}
user=> (doc +)
-------------------------
clojure.core/+
([] [x] [x y] [x y & more])
  Returns the sum of nums. (+) returns 0. Does not auto-promote
  longs, will throw on overflow. See also: +'
nil
{% endhighlight %}


Let's get back to the `defn` syntax, `(defn name doc-string? attr-map? [params*] body)`.

  - We need `name`.
  - `doc-string?` and `attr-map?` are optional.
  - `[params*]` can take multiple forms, [], [x], [x y], [x y & more], [x & more], or [& more].
      We need at least one of them.
      In other languages, there's an idea of *operator overload*,
      and in some cases, multiple same name methods of different number of argurments exist
      (the number of arguments is called *arity*).
      Clojure can do in a single definition.


So far, we learned how to create the function. It's time to try your own function. Here's an example:

{% gist 9161447 %}

{% highlight clojure %}
user> (do-something)
"nothing"
user> (do-something 1)
"easy!"
user> (do-something 1 1)
"hm, ok, will do"
user> (do-something 1 1 1)
"oh, no, so many!"
{% endhighlight %}
<br/>

The first example doesn't use given arguments. Next example uses arguments.
This `add-up` function sums up given initial value and all elements in
the given collection (vector or list).
Unless given collection is empty, the function recursively calls itself.
When, the given collection gets empty, it returns the summed up value.
To visualize what's going on during the recursive call,
`println` is added in `let` binding. (see  [`let` binding]({{ site.baseurl}}/docs/clojure/let/) )

{% gist 9162464 %}

{% highlight clojure %}
user> (add-up 1 '(1 2))
val: 1, coll: (1 2)
val: 2, coll: (2)
val: 4, coll: clojure.lang.PersistentList$EmptyList@1
4
user> (add-up 3 [1 2 3])
val: 3, coll: [1 2 3]
val: 4, coll: (2 3)
val: 6, coll: (3)
val: 9, coll: clojure.lang.PersistentList$EmptyList@1
9
{% endhighlight %}
<br/>

Above function is for a practice to create function.
However, Clojure has a handy function, `reduce`.
With this function, we can get the same results.

{% highlight clojure %}
user> (reduce + 1 '(1 2))
4
user> (reduce + 3 [1 2 3])
9
{% endhighlight %}

It's always good to check [Clojure Cheat Sheet](http://clojure.org/cheatsheet) or
search online for the function.


### References

- ClojureDocs

    [http://clojuredocs.org/clojure_core/clojure.core/defn](http://clojuredocs.org/clojure_core/clojure.core/defn)


- Clojure from the ground up: functions, "Defining functions"

    [http://aphyr.com/posts/303-clojure-from-the-ground-up-functions](http://aphyr.com/posts/303-clojure-from-the-ground-up-functions)


- Clojure for the Brave and True, Do Things, 3.3 Defining Functions

    [http://www.braveclojure.com/do-things/#3_3__Defining_Functions](http://www.braveclojure.com/do-things/#3_3__Defining_Functions)