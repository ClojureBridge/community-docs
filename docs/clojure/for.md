---
layout: docs
title: Loop <code>for</code>
permalink: /docs/clojure/for/
level: easy
author: yokolet
---

The *for loop* is a typical idea in a comuputer languagne.
When we want to apply the same logic (operations) to each element of a given array (vector or list in Clojure),
we apply the idea of *for loop* to that.
In general, incrementing (or decrementing) an index of array, something same is done on each element.
However, a way of realizing the *for loop* varies language to language.
Some use the index explicitely, others use an iterator.
Or, some don't use neither index nor iterator.
Among them, Clojure takes very different approach.
<br/><br/>

Clojure's `for` is a sort of loop what it is in other languages.
But, it is categorized to a sequence operator like
[`map`]({{ site.baseurl}}/docs/clojure/map/)(core function) or
[`reduce`]({{ site.baseurl}}/docs/clojure/reduce/).
More importantly, in Clojure, `for` is a *list comprehension*, which means it creates a list from a given list. 
<br/><br/>

The syntax of `for` macro is:
`(for [binding-form coll-expr filter-expr?] expr)`

Try some examples.
{% highlight clojure %}
user> (for [w ["LOVe" "coding" "hEllo" "worLD!"]]  ; like let, *for* takes binding-form
           (clojure.string/capitalize w))
("Love" "Coding" "Hello" "World!")

user> ; only when length of the word exceeds 5
user> (for [w ["LOVe" "coding" "hEllo" "worLD!"] :when (> (count w) 5)]
           (clojure.string/capitalize w))
("Coding" "World!")

user> ; using let binding
user> (for [w ["LOVe" "coding" "hEllo" "worLD!"] :let [length (count w)]]
           (str (clojure.string/capitalize w) ": " length))
("Love: 4" "Coding: 6" "Hello: 5" "World!: 6")

user> ; when multiple vectors are inputs...
user> (for [x ["a" "b" "c"]
              y ["a" "b" "c"]
              z ["a" "b" "c"]]
           (str x y z))
("aaa" "aab" "aac" "aba" "abb" "abc" "aca" "acb" "acc" "baa" "bab" "bac" "bba" "bbb" "bbc" "bca\
" "bcb" "bcc" "caa" "cab" "cac" "cba" "cbb" "cbc" "cca" "ccb" "ccc")
{% endhighlight %}


### References

- ClojureDocs

    [http://clojuredocs.org/clojure_core/clojure.core/for](http://clojuredocs.org/clojure_core/clojure.core/for)

- Clojure from the ground up: macros, List comprehensions

    [http://aphyr.com/posts/305-clojure-from-the-ground-up-macros](http://aphyr.com/posts/305-clojure-from-the-ground-up-macros)

- Introdcution to Clojure, Bread and Butter Functions

    [http://clojure-doc.org/articles/tutorials/introduction.html#bread-and-butter-functions](http://clojure-doc.org/articles/tutorials/introduction.html#bread-and-butter-functions)