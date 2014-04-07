---
layout: docs
title: Loop <code>for</code>
permalink: /docs/clojure/for/
level: easy
author: yokolet
---

The *for loop* is a common concept in computer languages.
When we want to apply the same logic (operations) to each element of a given array (vector or list in Clojure),
we apply the idea of a *for loop* to that.
In general, this involves incrementing (or decrementing) an index and performing a similar function on each element.
However, the way to implement a for loop varies from language to language.
Some use an index variable explicitly. Others use an iterator. Some use neither.
Clojure takes a very different approach.
<br/><br/>

Clojure's `for` is categorized as a sequence operator, like [`map`]({{ site.baseurl}}/docs/clojure/map/)(core function) or
[`reduce`]({{ site.baseurl}}/docs/clojure/reduce/).
More importantly, in Clojure, `for` is used for *list comprehension*, which means it creates a list from a given list. 
<br/><br/>

The syntax of the `for` macro is:
`(for [binding-form coll-expr filter-expr?] expr)`

Try some examples.
{% highlight clojure %}
user> (for [w ["LOVe" "coding" "hEllo" "worLD!"]]  ; like let, *for* takes binding-form
           (clojure.string/capitalize w))
("Love" "Coding" "Hello" "World!")

user> ; we can get the same result using the *map* core function
user> (map clojure.string/capitalize ["LOVe" "coding" "hEllo" "worLD!"])
("Love" "Coding" "Hello" "World!")

user> ; include only when length of the word exceeds 5
user> (for [w ["LOVe" "coding" "hEllo" "worLD!"] :when (> (count w) 5)]
           (clojure.string/capitalize w))
("Coding" "World!")

user> ; using let binding
user> (for [w ["LOVe" "coding" "hEllo" "worLD!"] :let [length (count w)]]
           (str (clojure.string/capitalize w) ": " length))
("Love: 4" "Coding: 6" "Hello: 5" "World!: 6")

user> ; when the input consists of multiple vectors
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