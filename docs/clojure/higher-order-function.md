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


{% highlight clojure %}
user> ; suppose we want to combine two vectors and take even numbers out
user> (defn concat-evens
        [vec1 vec2]
        ((fn [x] (filter even? x))
         (concat vec1 vec2)))
#'user/concat-evens
user> (concat-evens [1 2 3] [4 5 6])
(2 4 6)

user> ; suppose we want to combine two vectors and take odd numbers out
user> (defn concat-odds
        [vec1 vec2]
        ((fn [x] (filter odd? x))
         (concat vec1 vec2)))
#'user/concat-odds
user> (concat-odds [1 2 3] [4 5 6])
(1 3 5)

user> ; let's see. the difference of two functions above is just even? or odd?
user> ; what if either even? or odd? function is passed as an argument?
user> (defn concat-some
        [f vec1 vec2]
        ((fn [x] (filter f x))
         (concat vec1 vec2)))
#'user/concat-some
user> (concat-some even? [1 2 3] [4 5 6])
(2 4 6)
user> (concat-some odd? [1 2 3] [4 5 6])
(1 3 5)
user> ; yay! we created a higher-order function. concat-some takes a function as an argument.
{% endhighlight %}

As we saw above, higher-order functions are a useful way to make functions more generic.
<br/><br/>

#### Function that returns a function

Let's try one more example. This example is the second type of higher-order function.

- Advice to coaches

    The `partial` function may be difficult to undertand/use for beginners.
    It would be good to use other examples, (partial * 2), to explain.

- partial: [http://clojuredocs.org/clojure_core/clojure.core/partial](http://clojuredocs.org/clojure_core/clojure.core/partial)


{% highlight clojure %}
user> (defn greeting-in-am [who]
        (str "Good morning, " who))
#'user/greeting-in-am
user> (greeting-in-am "everybody")
"Good morning, everybody"

user> (defn greeting-in-pm [who]
        (str "Good afternoon, " who))
#'user/greeting-in-pm
user> (greeting-in-pm "everybody")
"Good afternoon, everybody"

user> (defn greeting-anytime [who]
        (str "Hello, " who))
#'user/greeting-anytime
user> (greeting-anytime "everybody")
"Hello, everybody"

user> ; let's see. the difference of three functions above is
user> ; the first argument of str function only
user> ; can we create a generalized function?

user> (defn greeting [when]
        (case when
          :am (partial str "Good morning, ")
          :pm (partial str "Good afternoon, ")
          (partial str "Hello, ")))
#'user/greeting
user> (greeting :am)
#<core$partial$fn__4190 clojure.core$partial$fn__4190@19f112e5>
user> (greeting :pm)
#<core$partial$fn__4190 clojure.core$partial$fn__4190@4b232f3c>
user> (greeting :when?)
#<core$partial$fn__4190 clojure.core$partial$fn__4190@507155fb>

user> ; greeting function returns a function!

user> ((greeting :am) "everybody, " "nobody, " "whoever")
"Good morning, everybody, nobody, whoever"

user> ((greeting :pm) "Andy, " "Bob, " "Charlie, " "David")
"Good afternoon, Andy, Bob, Charlie, David"

user> ((greeting :hm...) "Ann, " "Beth")
"Hello, Ann, Beth"

user> ; only one greeting function covers three functions previously defined.
user> ; additionally, now, we can pass any number of arguments.
user> ; everything other than :am and :pm falls on the last "Hello, "
{% endhighlight %}


### References

- PCL -> Clojure, Chapter 11, Higher-order functions

    [http://thinkrelevance.com/blog/2008/09/22/pcl-clojure-chapter-11](http://thinkrelevance.com/blog/2008/09/22/pcl-clojure-chapter-11)