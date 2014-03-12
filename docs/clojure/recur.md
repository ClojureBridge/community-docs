---
layout: docs
title: Loop <code>recur</code>
permalink: /docs/clojure/recur/
level: easy
author: yokolet
---

While [`for`]({{ site.baseurl}}/docs/clojure/for/) is a sort of loop,
`recur` is a real loop in Clojure.
Also, `recur` has a remarkable idea that we may call it "this is *the Clojure*."

If you have a programming background, you may have heard, *tail recursion*,
which is a major feature of functional languages.
This `recur` special form is the one of *tail recursion*.
As the words, *tail recursion*, express, `recur` must be called in the *tail position*.
In other words, `recur` must be in the last thing to be evaluated.
<br/><br/>

The syntax of `recur` macro is: `(recur exprs*)`

Look at simple examples:

  - count: [http://clojuredocs.org/clojure_core/clojure.core/count](http://clojuredocs.org/clojure_core/clojure.core/count)
  - first: [http://clojuredocs.org/clojure_core/clojure.core/first](http://clojuredocs.org/clojure_core/clojure.core/first)
  - rest: [http://clojuredocs.org/clojure_core/clojure.core/rest](http://clojuredocs.org/clojure_core/clojure.core/rest)
  - str: [http://clojuredocs.org/clojure_core/clojure.core/str](http://clojuredocs.org/clojure_core/clojure.core/str)

{% highlight clojure %}
user> (defn some-join [coll result]
        (if (= 1 (count coll)) (str result (first coll))
          (recur (rest coll) (str result (first coll) ", "))))

#'user/some-join
user> (some-join ["hello" "world" "love" "coding"] "Words: ")
"Words: hello, world, love, coding"

user> ; when we want to do something just before the recur
user> ; we can use *do*

user> (defn some-join [coll result]
          (if (= 1 (count coll)) (str result (first coll))
            (do
              (println result)
              (recur (rest coll) (str result (first coll) ", ")))))
#'user/some-join
user> (some-join ["hello" "world" "love" "coding"] "Words: ")
Words:
Words: hello,
Words: hello, world,
"Words: hello, world, love, coding"

user> ; however, just for printing out the process, let binding works
user> (defn some-join [coll result]
        (let [_ (println result)]
          (if (= 1 (count coll)) (str result (first coll))
              (recur (rest coll) (str result (first coll) ", ")))))
#'user/some-join
user> (some-join ["hello" "world" "love" "coding"] "Words: ")
Words:
Words: hello,
Words: hello, world,
Words: hello, world, love,
"Words: hello, world, love, coding"

user> ; we attempted the same thing as clojure.string/join function does
user> (str "Words: " (clojure.string/join ", " ["hello" "world" "love" "coding"]))
"Words: hello, world, love, coding"
{% endhighlight %}
<br/>

Even though we can write code without `recur`, the use of `recur` is strongly recommended in Clojure.
The reason is the *tail-call optimazation (TCO)*.

Compare recursive call, sum-up function,  and `recur`, sum-up-with-recur function.
The recursive call raises StackOverflowError when summing up to 10000.
On the other hand, `recur` can sum up even 100000.
This is why *tail-call optimization (TCO)* works effectively.

  - empty?: [http://clojuredocs.org/clojure_core/clojure.core/empty_q](http://clojuredocs.org/clojure_core/clojure.core/empty_q)
  - range: [http://clojuredocs.org/clojure_core/clojure.core/range](http://clojuredocs.org/clojure_core/clojure.core/range)

{% highlight clojure %}
user> (defn sum-up [coll result]
        (if (empty? coll) result
          (sum-up (rest coll) (+ result (first coll)))))

#'user/sum-up
user> (sum-up (range 10) 0)
45
user> (sum-up (range 10000) 0)
StackOverflowError   clojure.lang.ChunkedCons.more (ChunkedCons.java:47)


user> (defn sum-up-with-recur [coll result]
        (if (empty? coll) result
          (recur (rest coll) (+ result (first coll)))))
#'user/sum-up-with-recur
user> (sum-up-with-recur (range 10) 0)
45
user> (sum-up-with-recur (range 10000) 0)
49995000
user> (sum-up-with-recur (range 100000) 0)
4999950000
{% endhighlight %}

In every computer language, we can write recursive call.
However, recursion with TCO is a Clojure specific feature.
With TCO, Clojure is good at processing a huge list.

### References

- ClojureDocs

    [http://clojuredocs.org/clojure_core/clojure.core/recur](http://clojuredocs.org/clojure_core/clojure.core/recur)

- Clojure.org, Special Forms, recur

    <a href="http://clojure.org/special_forms#Special%20Forms--(recur%20exprs*)">http://clojure.org/special_forms#Special%20Forms--(recur%20exprs*)</a>

- Clojure from the ground up: macros, Recursion

    [http://aphyr.com/posts/305-clojure-from-the-ground-up-macros](http://aphyr.com/posts/305-clojure-from-the-ground-up-macros)


- Clojure for the Brave and True, Functional Programming, 2.1 Recursion instead of for/while

    [http://www.braveclojure.com/functional-programming/#2_1__Recursion_instead_of_for_while](http://www.braveclojure.com/functional-programming/#2_1__Recursion_instead_of_for_while)
