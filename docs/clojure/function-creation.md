---
layout: docs
title: Basics of Function
permalink: /docs/clojure/function-creation/
level: easy
author: yokolet
---

Clojure is a functional programming language.
Creating and using functions--and creating functions that use functions--is what Clojure programers do.
Clojure has a number of ways to create a function.
Defining a function with `defn` is the most popular approach.

The syntax is:

  ```
  (defn name doc-string? attr-map? [params*] body)
  ```

It may not be clear how to write a function based on that syntax.
It is a good idea to look at how other functions are defined.
For example, let's look at the source code of `+` function.

- Advice to coaches

    Please make sure *console* is opened if attendees are using LightTable.
    On other repl, in some cases, clojure.repl might not be loaded.
    If so, don't forget `(use '[clojure.repl])`.
    The `source` and `doc` functions will be available after that.

{% highlight clojure %}
user> (source +)
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
nil
{% endhighlight %}

Compare the `defn` syntax and the actual function code.

  - `name` is `+`
  - `doc-string?` is "Returns the sum of nums...(snip)...See also: +'"
  - `attr-map?` is `{:inline (nary-inline...(snip)...:added "1.2"}`
  - `[params*]`s are `[]`, `[x]`, `[x y]`, and `[x y & more]`
  - `body`s follow each param. `0`,` (cast Number x)` and other

We use `+` function like:
{% highlight clojure %}
user=> (+)            ; params []
0
user=> (+ 3)          ; params [x]
3
user=> (+ 3 4)        ; params [x y]
7
user=> (+ 3 4 5 6 7)  ; params [x y & more]
25
{% endhighlight %}


You can look up the function's documentation by using the `doc` function. `doc-string?`
and other components will be displayed.

{% highlight clojure %}
user=> (doc +)
-------------------------
clojure.core/+
([] [x] [x y] [x y & more])
  Returns the sum of nums. (+) returns 0. Does not auto-promote
  longs, will throw on overflow. See also: +'
nil
{% endhighlight %}

Clojure has another way to look at functions.
`meta` function shows the definition in `attr-map?` along with other information. See the example below:

{% highlight clojure %}
user> (meta #'+)
{:arglists ([] [x] [x y] [x y & more]), :ns #<Namespace clojure.core>, :name +, :column 1, :added
 "1.2", :inline-arities #<core$_GT_1_QMARK_ clojure.core$_GT_1_QMARK_@f73b0ec>, :doc "Returns the
 sum of nums. (+) returns 0. Does not auto-promote\n  longs, will throw on overflow. See also: +'
", :line 936, :file "clojure/core.clj", :inline #<core$nary_inline$fn__3961 clojure.core$nary_inl
ine$fn__3961@31e8b384>}
{% endhighlight %}

See [`def`]({{ site.baseurl}}/docs/clojure/def/) for what `#'+` is.

- Advice to coaches

    Mention that `defn` is the same as `(def name (fn [params* ] exprs*))`
    or `(def name (fn ([params* ] exprs*)+))`, which are explained in
    `(doc defn)`.


<br/>

Let's get back to the `defn` syntax, `(defn name doc-string? attr-map? [params*] body)`.

  - `name` is required.
  - `doc-string?` and `attr-map?` are optional.
  - `[params*]` can take multiple forms, [], [x], [x y], [x y & more], [x & more], or [& more].
      We need at least one of them.

      In some programming languages, you can *overload operators* or define multiple versions of the same method with different numbers of arguments.
      The number of arguments is called *arity*. Clojure can do that in a single definition.
<br/><br/>

So far, we learned how to create a function.
It's time to try your own function. Here's an example of multiple arities:

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

The first example doesn't use given arguments. The next example uses arguments.

This `add-up` function:

  - sums up the given initial value and all elements in the given collection (vector or list)
  - recursively calls itself unless the given collection is empty
  - returns the summed up value when the given collection becomes empty
  - prints out val and coll to visualize what's going on during the recursive call (in `let` binding)

(see  [`let` binding]({{ site.baseurl}}/docs/clojure/let/),
[`cond`]({{ site.baseurl}}/docs/clojure/cond/) )

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

The example above is just practice in creating functions.
In real life, you could use `reduce` in Clojure to write simpler code.
With `reduce`, we can get the same results with the code below:

{% highlight clojure %}
user> (reduce + 1 '(1 2))
4
user> (reduce + 3 [1 2 3])
9
{% endhighlight %}

It's always good to check the [Clojure Cheat Sheet](http://clojure.org/cheatsheet) or
search online for functions.


### References

- ClojureDocs

    [http://clojuredocs.org/clojure_core/clojure.core/defn](http://clojuredocs.org/clojure_core/clojure.core/defn)

- Introduction to Clojure, Functions: Defining Your Own

    [http://clojure-doc.org/articles/tutorials/introduction.html#functions:-defining-your-own](http://clojure-doc.org/articles/tutorials/introduction.html#functions:-defining-your-own)

- Functions in Clojure

    [http://clojure-doc.org/articles/language/functions.html](http://clojure-doc.org/articles/language/functions.html)

- Clojure from the ground up: functions, "Defining functions"

    [http://aphyr.com/posts/303-clojure-from-the-ground-up-functions](http://aphyr.com/posts/303-clojure-from-the-ground-up-functions)


- Clojure for the Brave and True, Do Things, 3.3 Defining Functions

    [http://www.braveclojure.com/do-things/#3_3__Defining_Functions](http://www.braveclojure.com/do-things/#3_3__Defining_Functions)


- GetClojure

    <a href="http://getclojure.com/search?q=defn&num=0" target="_blank">http://getclojure.com/search?q=defn&num=0</a>
