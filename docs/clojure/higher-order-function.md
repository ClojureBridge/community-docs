---
layout: docs
title: Higher-order Function
permalink: /docs/clojure/higher-order-function/
level: easy
author: yokolet
---

A higher-order function is:

  - a function that takes one or more functions as arguments<br/>
  or
  - a function that returns a function

In other languages, this feature may have another name.
For example, Ruby names it *block* for a callee function, although the caller doesn't have specific name.

In Clojure, caller functions are high-order functions while callees don't have specific names.
Some well known higher-order functions are
[`map`]({{ site.baseurl}}/docs/clojure/map/),
[`reduce`]({{ site.baseurl}}/docs/clojure/reduce/),
[`remove`]({{ site.baseurl}}/docs/clojure/remove/),
[`filter`]({{ site.baseurl}}/docs/clojure/filter/), and
[`iterate`]({{ site.baseurl}}/docs/clojure/iterate/).
<br/><br/>

#### Functions that take functions as arguments

Before going to those core functions, let's try the example below.
This example is the first type of higher-order function.
In this example, we will create a function that does something when given two vectors.

- Advice to coaches

    `concat-evens` function is the same example in
    [`anonymous function`]({{ site.baseurl}}/docs/clojure/anonymous-function/).
    If the attendees haven't looked at the Anonymous Function section and they struggle to understand the example, go back to the Anonymous Function section.


Suppose we want to combine two vectors and take even numbers out:

~~~klipse
(defn concat-evens
        [vec1 vec2]
        ((fn [x] (filter even? x))
         (concat vec1 vec2)))
(concat-evens [1 2 3] [4 5 6])
~~~

Suppose we want to combine two vectors and take odd numbers out:

~~~klipse
(defn concat-odds
        [vec1 vec2]
        ((fn [x] (filter odd? x))
         (concat vec1 vec2)))
(concat-odds [1 2 3] [4 5 6])
~~~

Let's see: the difference of two functions above is just `even?` or `odd?`. What if either `even?` or `odd?` function would be passed as an argument?

~~~klipse
(defn concat-some
        [f vec1 vec2]
        ((fn [x] (filter f x))
         (concat vec1 vec2)))
(concat-some even? [1 2 3] [4 5 6])
~~~

~~~klipse
(concat-some odd? [1 2 3] [4 5 6])
~~~

Yay! we created a higher-order function: `concat-some` takes a function as an argument.

As we saw above, higher-order functions are a useful way to make functions more generic.
<br/><br/>

#### Function that returns a function

Let's try one more example. This example is the second type of higher-order function.

- Advice to coaches

    The `partial` function may be difficult to undertand/use for beginners.
    It would be good to use other examples, (partial * 2), to explain.

- partial: [http://clojuredocs.org/clojure_core/clojure.core/partial](http://clojuredocs.org/clojure_core/clojure.core/partial)


~~~klipse
(defn greeting-in-am [who]
        (str "Good morning, " who))
(greeting-in-am "everybody")
~~~

~~~klipse
(defn greeting-in-pm [who]
        (str "Good afternoon, " who))
(greeting-in-pm "everybody")
~~~

~~~klipse
(defn greeting-anytime [who]
        (str "Hello, " who))
(greeting-anytime "everybody")
~~~

Let's see: the difference between the three functions above is
only the first argument of `str`. Can we create a generalized function?

~~~klipse
(defn greeting [when]
        (case when
          :am (partial str "Good morning, ")
          :pm (partial str "Good afternoon, ")
          (partial str "Hello, ")))

(fn? (greeting :am))
~~~

As you can see, `greeting` returns a function!

Now, let's see it in action.

With `:am`:

~~~klipse
((greeting :am) "everybody, " "nobody, " "whoever")
~~~

With `:pm`:

~~~klipse
((greeting :pm) "Andy, " "Bob, " "Charlie, " "David")
~~~

With anything else:

~~~klipse
((greeting :hm...) "Ann, " "Beth")
~~~

With a single `greeting` function, we cover the three functions previously defined. Additionally, now, we can pass any number of arguments. Everything other than :am and :pm falls on the last "Hello, ".


### References

- PCL -> Clojure, Chapter 11, Higher-order functions

    [http://thinkrelevance.com/blog/2008/09/22/pcl-clojure-chapter-11](http://thinkrelevance.com/blog/2008/09/22/pcl-clojure-chapter-11)
