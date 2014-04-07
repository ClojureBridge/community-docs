---
layout: docs
title: Destructuring
permalink: /docs/clojure/destructuring/
level: easy
author: yokolet
---

- Advice to coaches

    The examples here are easy ones.
    However, the idea of destructuring may not be easy to understand for beginners.
    Please explain how it works.<br/><br/>


*Destructuring* is a Clojure-specific way of variable assignment (binding in Clojure).
It enables us to bind:

  - each element in a vector to corresponding variables - *case 1*
  - one element in a vector to a variable - *case 2*
  - each value in a map (key-value pairs) to the corresponding variables - *case 3*

in a single binding.


Let's try some simple examples:

{% highlight clojure %}
user> (def my-vector [123 234 345 456 567])
#'user/my-vector

user> ; case 1
user> (let [[a b c d e] my-vector]
        (println (str a ", " b ", " c ", " d ", " e)))
123, 234, 345, 456, 567
nil

user> ; case 2
user> (let [[_ _ a] my-vector]
        (println a))
345
nil

user> (def my-map {:a 123 :b 234 :c 345 :d 456 :e 567})
#'user/my-map

user> ; case 3
user> (let [{a :a b :b c :c d :d e :e} my-map]
        (println (str a ", " b ", " c ", " d ", " e)))
123, 234, 345, 456, 567
nil
{% endhighlight %}

As we see above, destructuring has two kinds of bindings:

  - vector binding forms
  - map binding forms
<br/><br/>


#### Vector binding forms

  - destructuring-able types: whatever `nth` function can be applied

    - example: vector, list, seq, string<br/><br/>

  - works like pattern matching

  - optional binding rules, `&`, `:as`

    - `&`  binds reminders to a given variable

    - `:as`  binds entire values to a given variable

  See more examples:

{% highlight clojure %}
user> (def my-vector [123 234 345 456 567])
#'user/my-vector

user> (let [[a b & more] my-vector]
        (println (str "I got " a ", " b " and " more)))
I got 123, 234 and (345 456 567)
nil

user> (let [[a b :as all] my-vector]
        (println (str "I got " a ", " b " from " all)))
I got 123, 234 from [123 234 345 456 567]
nil

user> ; put & and :as together
user> (let [[a b & more :as all] my-vector]
        (println (str "I got " more " from " all)))
I got (345 456 567) from [123 234 345 456 567]
nil
user> ; but & should always come before :as
user> (let [[a b :as all & more] my-vector]
        (println (str "I got " more " from " all)))
CompilerException java.lang.RuntimeException: Unable to resolve symbol: more in this context, com
piling:(/private/var/folders/4b/c9gsjvv12tq9n4mph065qs480000gn/T/form-init6323661111322215411.clj:2:18)

user> ; if we use destructuring for a string...
user> (let [[a b c d e] "hello"]
        (println (str e d c b a)))
olleh
nil
{% endhighlight %}
<br/>

#### Map binding forms

  - destructuring-able types: whatever *associative* types

    - example: map<br/><br/>

  - works looking at key

  - optional binding rules, `:keys`, `:as`, `:or`

    - `:keys` convention applies to avoid wordiness. variable names are key names without `:`

    - `:as`  binds entire key-value pairs to a given variable

    - `:or`  defines default values for specified keys


  See more examples:

{% highlight clojure %}
user> (def my-map {:a 123 :b 234 :c 345 :d 456 :e 567})
#'user/my-map

user> (let [{:keys [a b c d e f]} my-map]
        (println (str a ", " b ", " c ", " d ", " e)))
123, 234, 345, 456, 567
nil

user> (let [{a :a b :b :as all} my-map]
        (println (str "I got " a ", " b " from " all)))
I got 123, 234 from {:a 123, :c 345, :b 234, :d 456, :e 567}
nil

user> (let [{a :a b :b x :x :or {x -987} :as all} my-map]
        (println (str "I got " a ", " b ", and " x " from " all)))
I got 123, 234, and -987 from {:a 123, :c 345, :b 234, :d 456, :e 567}
nil

user> ; if we use a vector for map binding destructuring, indexes are keys
user> (let [{a 0 b 1 c 10 :as all :or {c -987}} my-vector]
        (println (str "I got " a ", " b ", " c " from " all)))

I got 123, 234, -987 from [123 234 345 456 567]
nil
{% endhighlight %}
<br/>

#### Where destructuring is used

  - let bindings

  - function parameter lists

  All examples of destructuring here are in let bindings.
  However, destructuring can also be used in function parameter lists.


### References

- Clojure, Special Forms, Binding Forms(Destructuring)

    [http://clojure.org/special_forms#Special Forms--Binding Forms (Destructuring)](http://clojure.org/special_forms#Special Forms--Binding Forms (Destructuring))


- Introduction to Clojure, Destructuring

    [http://clojure-doc.org/articles/tutorials/introduction.html#destructuring](http://clojure-doc.org/articles/tutorials/introduction.html#destructuring)

- Clojure for the Brave and True, Do Things, 3.3.3. Destructuring

    [http://www.braveclojure.com/do-things/#3_3_3__Destructuring](http://www.braveclojure.com/do-things/#3_3_3__Destructuring)