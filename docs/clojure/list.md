---
layout: docs
title: Data Structure <code>list</code>
permalink: /docs/clojure/list/
level: easy
author: mathonsunday
---

Two ways to construct list

Lists are comparable

This means that lists are well-suited for small collections, or collections which are read in linear order, but are slow when you want to get arbitrary elements from later in the list. For fast access to every element, we use a vector.

Example of where we'd use a linked list - fifo queue - queue management system


### References

- ClojureDocs

	- first : [http://clojuredocs.org/clojure_core/clojure.core/first](http://clojuredocs.org/clojure_core/clojure.core/first) 
	- nth : [http://clojuredocs.org/clojure_core/clojure.core/nth](http://clojuredocs.org/clojure_core/clojure.core/nth)

- Clojure from the ground up: basic types, Lists

    [http://aphyr.com/posts/302-clojure-from-the-ground-up-basic-types](http://aphyr.com/posts/302-clojure-from-the-ground-up-basic-types)

- Clojure for the Brave and True, 2.7 Lists

    [http://www.braveclojure.com/do-things/#2_7__Lists](http://www.braveclojure.com/do-things/#2_7__Lists)
