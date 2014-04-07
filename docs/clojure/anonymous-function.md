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

{% highlight clojure %}
user> (fn [coll] (filter even? coll))
#<user$eval4837$fn__4838 user$eval4837$fn__4838@660652c5>

user> ; anonymous function is defined, but how can we use this?
user> ; here's one way to use anonymous function
user> ((fn [coll] (filter even? coll)) [1 2 3 4 5 6])
(2 4 6)

user> ; if we use #() literal, an anonymous function can be written like this.
user> (#(filter even? %) [1 2 3 4 5 6])
(2 4 6)

user> ; to use anonymous function more than once, bind it to a name.
user> (def evens (fn [coll] (filter even? coll)))
#'user/evens
user> (evens [1 2 3 4 5 6])
(2 4 6)
{% endhighlight %}

You may have thought that the function above is the equivalent to:
{% highlight clojure %}
user> (defn evens-by-defn
        [coll]
        (filter even? coll))
#'user/evens-by-defn
user> (evens-by-defn [1 2 3 4 5 6])
(2 4 6)
{% endhighlight %}

However, Clojure programmers use anonymous function very often.
Why do we need anonymous function?

The biggest reason is to use functions for higher-order-function
(See [`Higher-order Function`]({{ site.baseurl}}/docs/clojure/higher-order-function/) ).

Another reason can been seen in the next example.

Let's say we want to get the even numbers after two vectors are combined:

- concat: [http://clojuredocs.org/clojure_core/clojure.core/concat](http://clojuredocs.org/clojure_core/clojure.core/concat)

If we use def to save the value...

{% highlight clojure %}
user> (defn evens-with-def
        [vec1 vec2]
        (def combined (concat vec1 vec2))
        (filter even? combined))
#'user/evens-with-def
user> (evens-with-def [1 2 3] [4 5 6])
(2 4 6)
user> combined
[1 2 3 4 5 6]
{% endhighlight %}

`combined` is exposed outside of our function, and this is bug-prone.

If we use an anonymous function...

{% highlight clojure %}
user> (defn evens-with-fn
        [vec1 vec2]
        ((fn [x] (filter even? x))
         (concat vec1 vec2)))
#'user/evens-with-fn
user> (evens-with-fn [1 2 3] [4 5 6])
(2 4 6)
{% endhighlight %}

There's no variable for a combined vector.

We could also use `let`, which provides lexical binding and limits it to within the scope.

{% highlight clojure %}
user> (defn evens-with-let
        [vec1 vec2]
        (let [combined-in-let (concat vec1 vec2)]
          (filter even? combined-in-let)))
#'user/evens-with-let
user> (evens-with-let [1 2 3] [4 5 6])
(2 4 6)
user> combined-in-let
CompilerException java.lang.RuntimeException: Unable to resolve symbol: combined-in-let in this c
ontext, compiling:(/private/var/folders/4b/c9gsjvv12tq9n4mph065qs480000gn/T/form-init632366111132
2215411.clj:1:743)
user> ; combined-in-let is available only in let body
{% endhighlight %}

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