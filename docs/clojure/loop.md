---
layout: docs
title: Loop <code>loop</code>
permalink: /docs/clojure/loop/
level: easy
author: yokolet
---

The `loop` special form is, unlike its name, not a so-to-speak *for loop* itself.
The usage of `loop` is the same as [`let`]({{ site.baseurl}}/docs/clojure/let/) binding.
However, `loop` sets a *recursion point*.
The *recursion point* is designed to use with [`recur`]({{ site.baseurl}}/docs/clojure/recur/),
which means `loop` is always used with `recur`.
To make loop happen, `recur`'s number of arguments (*arity*) must coinside with the number of bindings. That way, `recur` loops back to `loop`.


The syntax is: `(loop [bindings*] exprs*)`

{% highlight clojure %}
user> (loop [coll ["hello" "world" "love" "coding"] result "Words: "]   ; 2 bindings
        (if (= 1 (count coll)) (str result (first coll))
            (recur (rest coll) (str result (first coll) ", "))))  ; arity 2
"Words: hello, world, love, coding"
{% endhighlight %}
Compare the exmple above to the one in [`recur`]({{ site.baseurl}}/docs/clojure/recur/).
<br/><br/>

For a loop exercise, let's think about how to calculate the sum of the geometric series ([http://en.wikipedia.org/wiki/Geometric_series](http://en.wikipedia.org/wiki/Geometric_series).
The well-known geometric series is 1/2 + 1/4 + 1/8 + 1/16 + ...., which converges to 1.

  - inc [http://clojuredocs.org/clojure_core/clojure.core/inc](http://clojuredocs.org/clojure_core/clojure.core/inc)
  - Math/pow [http://docs.oracle.com/javase/7/docs/api/java/math/BigInteger.html#pow(int)](http://docs.oracle.com/javase/7/docs/api/java/math/BigInteger.html#pow(int))
  - N (of 2N); BigInt [http://clojure.org/data_structures#Data Structures-Numbers](http://clojure.org/data_structures#Data Structures-Numbers)

{% highlight clojure %}
user> (defn geometric-series
        "takes maximum number of elements,
         calculates geometric series"
        [max]
        (loop [n 1 acc 0]                                      ; 2 bindings
          (if (> n max) acc
            (recur (inc n) (+ acc (/ 1 (Math/pow 2N n)))))))   ; arity 2
#'user/geometric-series
user> (geometric-series 1)
0.5
user> (geometric-series 2)
0.75
user> (geometric-series 10)
0.9990234375
user> (geometric-series 50)
0.9999999999999991
user> (geometric-series 100)
1.0
user> (geometric-series 1000)
1.0
user> ; converged to 1
{% endhighlight %}

### References

- ClojureDocs

    [http://clojuredocs.org/clojure_core/clojure.core/loop](http://clojuredocs.org/clojure_core/clojure.core/loop)

- Clojure.org, Special Forms, loop

    <a href="http://clojure.org/special_forms#Special%20Forms--(loop%20[bindings*%20]%20exprs*)">http://clojure.org/special_forms#Special%20Forms--(loop%20[bindings*%20]%20exprs*</a>

- Intrduction to Clojure, Looping and Recursion

    [http://clojure-doc.org/articles/tutorials/introduction.html#looping-and-recursion](http://clojure-doc.org/articles/tutorials/introduction.html#looping-and-recursion)

- Clojure from the ground up: macros, Recursion

    [http://aphyr.com/posts/305-clojure-from-the-ground-up-macros](http://aphyr.com/posts/305-clojure-from-the-ground-up-macros)

- Clojure for the Brave and True, Do Things, 4.3. loop

    [http://www.braveclojure.com/do-things/#4_3__loop](http://www.braveclojure.com/do-things/#4_3__loop)

- GetClojure

    <a href="http://getclojure.com/search?q=loop&num=0" target="_blank">http://getclojure.com/search?q=loop&num=0</a>