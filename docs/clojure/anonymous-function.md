---
layout: docs
title: Anonymous Function
permalink: /docs/clojure/anonymous-function/
level: easy
author: yokolet
---

An *anonymous function* is a function that doesn't have a name.
Some other languages have this feature.
For example, in Java, anonymous functions are often used in GUI programming.
JavaScript heavily uses anonymous functions for callbacks.


The anonymous function is created by the `fn` function,
and has a short-hand of `#(...)`, or an anonymous function literal.


The simple syntax is:

`(fn [params*] body)`
<br/><br/>

While `defn` creates a function and binds it to the specified name,
`fn` just creates a function. The created function can be bound to the name by the `def` function.
For example, `(def my-plus (fn [coll] (.....)))`.
In this case, the anonymous function gets the name `my-plus`.

- Advice to coaches

    Beginners may be confused by how to pass arguments to an anonymous function.
    Take time to explain how arguments are consumed by anonymous functions.


Let's try anonymous functions.

- filter: [http://clojuredocs.org/clojure_core/clojure.core/filter](http://clojuredocs.org/clojure_core/clojure.core/filter)

- even?: [http://clojuredocs.org/clojure_core/clojure.core/even_q](http://clojuredocs.org/clojure_core/clojure.core/even_q)

Here is how we define an anonymous function:

~~~klipse
(fn [coll] (filter even? coll))
~~~

here's one way to use anonymous function

~~~klipse
((fn [coll] (filter even? coll)) [1 2 3 4 5 6])
~~~

if we use #() literal, an anonymous function can be written like this:

~~~klipse
(#(filter even? %) [1 2 3 4 5 6])
~~~

to use anonymous function more than once, bind it to a name:

~~~klipse
(def evens (fn [coll] (filter even? coll)))
(evens [1 2 3 4 5 6])
~~~

You may have thought that the function above is the equivalent to:

~~~klipse
(defn evens-by-defn
        [coll]
        (filter even? coll))
(evens-by-defn [1 2 3 4 5 6])
~~~

However, Clojure programmers use anonymous function very often.
Why do we need anonymous function?

The biggest reason is to use functions for higher-order-function
(See [`Higher-order Function`]({{ site.baseurl}}/docs/clojure/higher-order-function/) ).

Another reason can been seen in the next example.

Let's say we want to get the even numbers after two vectors are combined:

- concat: [http://clojuredocs.org/clojure_core/clojure.core/concat](http://clojuredocs.org/clojure_core/clojure.core/concat)

If we use def to save the value...

~~~klipse
(defn evens-with-def
        [vec1 vec2]
        (def combined (concat vec1 vec2))
        (filter even? combined))
(evens-with-def [1 2 3] [4 5 6])
~~~

`combined` is exposed outside of our function, and this is bug-prone.

<pre><code class="language-klipse" data-eval-context="expr">
combined
</code></pre>

But, if we use an anonymous function...

~~~klipse
(defn evens-with-fn
        [vec1 vec2]
        ((fn [x] (filter even? x))
         (concat vec1 vec2)))
(evens-with-fn [1 2 3] [4 5 6])
~~~

There's no variable for a combined vector.

We could also use `let`, which provides lexical binding and limits it to within the scope.

~~~klipse
(defn evens-with-let
        [vec1 vec2]
        (let [combined-in-let (concat vec1 vec2)]
          (filter even? combined-in-let)))
(evens-with-let [1 2 3] [4 5 6])
~~~

`combined-in-let` is not exposed outside of our function:

~~~klipse
combined-in-let
~~~

- Advice to coaches

    The third example here doesn't use anonymous functions.
    This would be a good example of how Clojure provides many ways to do the same thing.

### References

- ClojureDocs

    [http://clojuredocs.org/clojure_core/clojure.core/fn](http://clojuredocs.org/clojure_core/clojure.core/fn)

- Clojure, Special Forms

    <a href="http://clojure.org/special_forms#Special Forms--(fn name? [params* ] exprs*)">http://clojure.org/special_forms#Special Forms--(fn name? [params* ] exprs*)</a>

- Clojure for the Brave and True, Do Things, 3.4 Anonymous Function

    [http://www.braveclojure.com/do-things/#3_4__Anonymous_Functions](http://www.braveclojure.com/do-things/#3_4__Anonymous_Functions)
