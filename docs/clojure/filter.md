---
layout: docs
title: Core Function <code>filter</code>
permalink: /docs/clojure/filter/
level: easy
author: yokolet
---

The `filter` function is one of well-used [`higher-order function`]({{ site.baseurl}}/docs/clojure/higher-order-function/)s.
It takes a function as an argument.
The `filter` function works as its name shows.
It filters out values in a sequence that doesn't meet the given condition.
To fullfill this filtering feature, the function takes a fucntion and sequence for its arguments.
The function given to the `filter` must return truthy value, which is called a *predicate function*.
(see [`Truthiness`]({{ site.baseurl }}/docs/clojure/truthiness))

The syntax is: `(filter pred coll)`

Let's see the examples:

  - odd?: [http://clojuredocs.org/clojure_core/clojure.core/odd_q](http://clojuredocs.org/clojure_core/clojure.core/odd_q)
  - range: [http://clojuredocs.org/clojure_core/clojure.core/range](http://clojuredocs.org/clojure_core/clojure.core/range)
{% highlight clojure %}
user=> ; when the values from 0 to 9 are not odd, those are filtered out
user=> (filter odd? (range 10))
(1 3 5 7 9)
{% endhighlight %}


We can use [`anonymous function`]({{ site.baseurl}}/docs/clojure/anonymous-function) for filtering.
The next example defines flower list as a map (data structure) with simple keys and colors as values.
From this map, picking up yellows, or pinks are shown below.
{% highlight clojure %}
user=> ; defines a flowers list as a map
user=> (def flowers
  #_=>   {:rose-a "red" :rose-b "yellow" :rose-c "pink"
  #_=>    :daisy-a "yellow" :daisy-b "white" :daisy-c "orange"
  #_=>    :tulip-a "pink" :tulip-b "orange" :tulip-c "yellow"})
#'user/flowers

user=> ; picks up yellows with the anonymous function #(= "yellow" (second %))
user=> (filter #(= "yellow" (second %)) flowers)
([:daisy-a "yellow"] [:rose-b "yellow"] [:tulip-c "yellow"])

user=> ; picks up pinks with the anonymous function #(= "pink" (second %))
user=> (filter #(= "pink" (second %)) flowers)
([:tulip-a "pink"] [:rose-c "pink"])
{% endhighlight %}


Also, we can use the function we defined for filtering.
The third example picks up palindromic numbers between 1000 and 4999.
(see palindrome: [http://en.wikipedia.org/wiki/Palindromic_number](http://en.wikipedia.org/wiki/Palindromic_number))

{% highlight clojure %}
user=> ; defines the predicate function whether it is palindrome or not.
user=> (defn palindrome? [x]
  #_=>   (= (str x) (clojure.string/reverse (str x))))
#'user/palindrome?

user=> ; picks up numbers which are palindromes
user=> (filter palindrome? (range 1000 5000))
(1001 1111 1221 1331 1441 1551 1661 1771 1881 1991 2002 2112 2222 2332 2442 2552 2662 2772 2882 2992 3003 3113 3223 3333 3443 3553 3663 3773 3883 3993 4004 4114 4224 4334 4444 4554 4664 4774 4884 4994)
{% endhighlight %}
<br/>

#### References

- ClojureDocs

    [http://clojuredocs.org/clojure_core/clojure.core/filter](http://clojuredocs.org/clojure_core/clojure.core/filter)

- Clojure from the ground up: sequences, Subsequences

    [http://aphyr.com/posts/304-clojure-from-the-ground-up-sequences](http://aphyr.com/posts/304-clojure-from-the-ground-up-sequences)

- Clojure for the Brave and True, Core Functions in Depth

    [http://www.braveclojure.com/core-functions-in-depth/#5__FWPD](http://www.braveclojure.com/core-functions-in-depth/#5__FWPD)

- GetClojure

    <a href="http://getclojure.com/search?q=filter&num=0" target="_blank">http://getclojure.com/search?q=filter&num=0</a>
