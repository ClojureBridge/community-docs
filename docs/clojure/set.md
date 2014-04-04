---
layout: docs
title: Data Structure <code>set</code>
permalink: /docs/clojure/set/
level: 
author: 
---

The *set* is one of data strucrues. Every computer language has this data structure.
It looks like array (vector in Clojure), but every element is unique.
The elements' order is not guaranteed.

We can create *set* data structure by `set` function.
Also, we can create it by var binding.

The syntax is: `(set coll)`

{% highlight clojure %}
user=> (set '[111 1 2035 1 57 111])
#{1 111 2035 57}

user=> (def my-set #{"Jan", "Feb" "Mar" "Apr" "May" "Jun"})
#'user/my-set
user=> my-set
#{"Jun" "Apr" "Feb" "May" "Jan" "Mar"}
{% endhighlight %}

Let's try more examples.
For examples below, we will use sentences from "Pride and Prejudice," Chapter 59.
Copy and paste this to repl.

{% gist 9967875 %}

  - regular expresion: [http://clojure.org/other_functions#Other Useful Functions and Macros-Regex Support](http://clojure.org/other_functions#Other Useful Functions and Macros-Regex Support)
  - re-seq: [http://clojuredocs.org/clojure_core/clojure.core/re-seq](http://clojuredocs.org/clojure_core/clojure.core/re-seq)
  - count: [http://clojuredocs.org/clojure_core/clojure.core/count](http://clojuredocs.org/clojure_core/clojure.core/count)
  - sort: [http://clojuredocs.org/clojure_core/clojure.core/sort](http://clojuredocs.org/clojure_core/clojure.core/sort)
  - reduce: [http://clojuredocs.org/clojure_core/clojure.core/reduce](http://clojuredocs.org/clojure_core/clojure.core/reduce)
  - conj: [http://clojuredocs.org/clojure_core/clojure.core/conj](http://clojuredocs.org/clojure_core/clojure.core/conj)

{% highlight clojure %}
user=> ; takes out words from sentences using regular expression

user=> (def words (re-seq #"\w+" sentences))
#'user/words
user=> words
("The" "evening" "passed" "quietly" "unmarked" "by" "anything" "extraordinary" "The" "acknowledged" "lovers" "talked" "and" "laughed" "the" "unacknowledged" "were" "silent" "Darcy" "was" "not" "of" "a" "disposition" "in" "which" "happiness" "overflows" "in" "mirth" "and" "Elizabeth" "agitated" "and" "confused" "rather" "knew" "that" "she" "was" "happy" "than" "felt" "herself" "to" "be" "so" "for" "besides" "the" "immediate" "embarrassment" "there" "were" "other" "evils" "before" "her" "She" "anticipated" "what" "would" "be" "felt" "in" "the" "family" "when" "her" "situation" "became" "known" "she" "was" "aware" "that" "no" "one" "liked" "him" "but" "Jane" "and" "even" "feared" "that" "with" "the" "others" "it" "was" "a" "dislike" "which" "not" "all" "his" "fortune" "and" "consequence" "might" "do" "away")

user=> ; how many words are there?
user=> (count words)
103

user=> ; to make it understandable, sort it
user=> (sort words)
("Darcy" "Elizabeth" "Jane" "She" "The" "The" "a" "a" "acknowledged" "agitated" "all" "and" "and" "and" "and" "and" "anticipated" "anything" "aware" "away" "be" "be" "became" "before" "besides" "but" "by" "confused" "consequence" "dislike" "disposition" "do" "embarrassment" "even" "evening" "evils" "extraordinary" "family" "feared" "felt" "felt" "for" "fortune" "happiness" "happy" "her" "her" "herself" "him" "his" "immediate" "in" "in" "in" "it" "knew" "known" "laughed" "liked" "lovers" "might" "mirth" "no" "not" "not" "of" "one" "other" "others" "overflows" "passed" "quietly" "rather" "she" "she" "silent" "situation" "so" "talked" "than" "that" "that" "that" "the" "the" "the" "the" "there" "to" "unacknowledged" "unmarked" "was" "was" "was" "was" "were" "were" "what" "when" "which" "which" "with" "would")

user=> ; we see many duplications. let's make those unique
user=> (def unique-words (set words))
#'user/unique-words
user=> (sort unique-words)
("Darcy" "Elizabeth" "Jane" "She" "The" "a" "acknowledged" "agitated" "all" "and" "anticipated" "anything" "aware" "away" "be" "became" "before" "besides" "but" "by" "confused" "consequence" "dislike" "disposition" "do" "embarrassment" "even" "evening" "evils" "extraordinary" "family" "feared" "felt" "for" "fortune" "happiness" "happy" "her" "herself" "him" "his" "immediate" "in" "it" "knew" "known" "laughed" "liked" "lovers" "might" "mirth" "no" "not" "of" "one" "other" "others" "overflows" "passed" "quietly" "rather" "she" "silent" "situation" "so" "talked" "than" "that" "the" "there" "to" "unacknowledged" "unmarked" "was" "were" "what" "when" "which" "with" "would")

user=> ; how many words are left?
user=> (count unique-words)
80

user=> ; let's add "Jane" and "Lydia"
user=> ; "Jane" is already there, so she should not be added twice
user=> (sort (reduce conj unique-words ["Jane" "Lydia"]))
("Darcy" "Elizabeth" "Jane" "Lydia" "She" "The" "a" "acknowledged" "agitated" "all" "and" "anticipated" "anything" "aware" "away" "be" "became" "before" "besides" "but" "by" "confused" "consequence" "dislike" "disposition" "do" "embarrassment" "even" "evening" "evils" "extraordinary" "family" "feared" "felt" "for" "fortune" "happiness" "happy" "her" "herself" "him" "his" "immediate" "in" "it" "knew" "known" "laughed" "liked" "lovers" "might" "mirth" "no" "not" "of" "one" "other" "others" "overflows" "passed" "quietly" "rather" "she" "silent" "situation" "so" "talked" "than" "that" "the" "there" "to" "unacknowledged" "unmarked" "was" "were" "what" "when" "which" "with" "would")


user=> ; what if we eliminate articles and FANBOYS (For-And-Nor-But-Or-Yet-So)
user=> (sort (disj unique-words "a" "the" "for" "and" "nor" "but" "or" "yet" "so"))
("Darcy" "Elizabeth" "Jane" "She" "The" "acknowledged" "agitated" "all" "anticipated" "anything" "aware" "away" "be" "became" "before" "besides" "by" "confused" "consequence" "dislike" "disposition" "do" "embarrassment" "even" "evening" "evils" "extraordinary" "family" "feared" "felt" "fortune" "happiness" "happy" "her" "herself" "him" "his" "immediate" "in" "it" "knew" "known" "laughed" "liked" "lovers" "might" "mirth" "no" "not" "of" "one" "other" "others" "overflows" "passed" "quietly" "rather" "she" "silent" "situation" "talked" "than" "that" "there" "to" "unacknowledged" "unmarked" "was" "were" "what" "when" "which" "with" "would")
{% endhighlight %}

### References

- clojure.org, Data Structures, Sets

    [http://clojure.org/data_structures#Data Structures-Sets](http://clojure.org/data_structures#Data Structures-Sets)

- clojure.org, The Reader, Reafer forms

    [http://clojure.org/reader#The Reader--Reader forms](http://clojure.org/reader#The Reader--Reader forms)

- ClojureDocs

  - set

      [http://clojuredocs.org/clojure_core/clojure.core/set](http://clojuredocs.org/clojure_core/clojure.core/set)

  - disj

      [http://clojuredocs.org/clojure_core/clojure.core/disj](http://clojuredocs.org/clojure_core/clojure.core/disj)

- Introduction to Clojure

  - Functions for Creating Data Structures

      [http://clojure-doc.org/articles/tutorials/introduction.html#functions-for-creating-data-structures](http://clojure-doc.org/articles/tutorials/introduction.html#functions-for-creating-data-structures)

  - Functions For Working With Data Structures

      [http://clojure-doc.org/articles/tutorials/introduction.html#functions-for-working-with-data-structures](http://clojure-doc.org/articles/tutorials/introduction.html#functions-for-working-with-data-structures)

- Clojure from the ground up: basic types, Sets

    [http://aphyr.com/posts/302-clojure-from-the-ground-up-basic-types](http://aphyr.com/posts/302-clojure-from-the-ground-up-basic-types)

- Clojure for the Brave and True, Do Things, 2.8 Sets

    [http://www.braveclojure.com/do-things/#2_8__Sets](http://www.braveclojure.com/do-things/#2_8__Sets)

- GetClojure

    <a href="http://getclojure.com/search?q=set&num=0" target="_blank">http://getclojure.com/search?q=set&num=0</a>
