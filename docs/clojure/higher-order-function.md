---
layout: docs
title: Higher-order Function
permalink: /docs/clojure/higher-order-function/
level: easy
author: yokolet
---

Higher-order function is:

  - a function that takes one or more functions as arguments<br/>
  or
  - a function that returns a function

In other languages, this feature may have another name.
For example, Ruby names it *block* for a callee function though caller doesn't have specific name.

In Clojure, caller functions are high-order functions and callees don't have specifci names.
Some of well known higher-order functions among core functions would be
[`map`]({{ site.baseurl}}/docs/clojure/map/),
[`reduce`]({{ site.baseurl}}/docs/clojure/reduce/),
[`remove`]({{ site.baseurl}}/docs/clojure/remove/),
[`filter`]({{ site.baseurl}}/docs/clojure/filter/), or
[`iterate`]({{ site.baseurl}}/docs/clojure/iterate/).

Before going to those core functions, let's try the example below.
In this example, we will create a function that does something when two vectors are given.

- Advice to coaches

    `concat-evens` function is the same example in
    [`anonymous function`]({{ site.baseurl}}/docs/clojure/anonymous-function/).
    If the attendees hasn't look at Anonymous Function section and struggle to understand the example, go back the Anonymous Function section.


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

### References

- PCL -> Clojure, Chapter 11, Higher-order functions

    [http://thinkrelevance.com/blog/2008/09/22/pcl-clojure-chapter-11](http://thinkrelevance.com/blog/2008/09/22/pcl-clojure-chapter-11)