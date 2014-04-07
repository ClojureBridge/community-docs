---
layout: docs
title: String
permalink: /docs/clojure/string/
level: easy
author: yokolet
---

The string is probably the most frequently-used data structure in all languages.
However, the idea and implementation of a string varies from language to language.

In Clojure, strings are text between a pair of `"`(double quote) characters.
The `'`(single quote) isn't used to express strings in Clojure.
When we want to use double quotes within a string,
they must be escaped by `\`(backslash).

{% highlight clojure %}
user> (def kind "a rose")
#'user/kind
user> kind
"a rose"
user> (println kind)
a rose
nil
user> (def name "that rose has a name \"The ROSE\"")
#'user/name
user> name
"that rose has a name \"The ROSE\""
user> (println name)
that rose has a name "The ROSE"
nil

user> ; if we use a single quote...
user> (def bad-kind 'a rose')
CompilerException java.lang.RuntimeException: Too many arguments to def, compiling:(/private/var\
/folders/4b/c9gsjvv12tq9n4mph065qs480000gn/T/form-init7461059366215401347.clj:1:1)
user> ; a single quote is a syntax quote, so Clojure sees there are 'a and rose' in def.
{% endhighlight %}
<br/>

Clojure strings have the type `java.lang.String`.
This means Clojure strings can use all methods defined for java.lang.String.
See the Java API document: [http://docs.oracle.com/javase/7/docs/api/java/lang/String.html](http://docs.oracle.com/javase/7/docs/api/java/lang/String.html).

- Advice to coaches

    This document doesn't have a section for Java interoperability.
    Please talk about Java method invocation on Clojure briefly.


{% highlight clojure %}
user> (type "rose")
java.lang.String

user> (.startsWith "rose" "r")  ; startsWith Java method
true
user> (.replace "rose" "r" "R")  ; replace Java method
"Rose"
user> (.compareTo "rose" "roses")
-1
user> (+ "lovely " "rose")  ; Clojure's + function doesn't work
ClassCastException java.lang.String cannot be cast to java.lang.Number  clojure.lang.Numbers.add\
 (Numbers.java:126)
user> (.concat "lovely " "rose")  ; concat Java method works
"lovely rose"

user> (.length "rose")
4
{% endhighlight %}
<br/>

In addition to the methods of java.lang.String, Clojure functions also work for strings.


- Advice to coaches

    Links to string-related functions are listed in References.
    Tell attendees to try some other functions by looking at documents.

{% highlight clojure %}
user> (compare "rose" "roses") ; the same as java.lang.String's compareTo method
-1
user> (str "lovely " "rose")  ; the same as java.lang.String's concat method
"lovely rose"
user> (count "rose") ; the same as java.lang.String's length method
4

user> ;; many of string related functions are defined in clojure.string namespace

user> (clojure.string/reverse "rose")
"esor"
user> (clojure.string/replace-first "rose" #"r" "R")
"Rose"
user> (clojure.string/capitalize "rose")
"Rose"
user> (clojure.string/upper-case "rose")
"ROSE"
{% endhighlight %}
<br/>


In Clojure, strings are seq-able.
Clojure functions for seq also work for strings.
When those functions are used on strings, `Character` type values are returned.

Characters have the `java.lang.Character` type and are expressed as `\` followed by a single letter.

  - take-nth : [http://clojuredocs.org/clojure_core/clojure.core/take-nth](http://clojuredocs.org/clojure_core/clojure.core/take-nth)
  - rest : [http://clojuredocs.org/clojure_core/clojure.core/rest](http://clojuredocs.org/clojure_core/clojure.core/rest)
{% highlight clojure %}
user> (take-nth 2 "rose")
(\r \s)
user> (rest "rose")
(\o \s \e)
user> (clojure.string/join (rest "rose"))
"ose"
{% endhighlight %}
<br/>


### References

- ClojureDocs

  - compare : [http://clojuredocs.org/clojure_core/clojure.core/compare](http://clojuredocs.org/clojure_core/clojure.core/compare)
  - count : [http://clojuredocs.org/clojure_core/clojure.core/count](http://clojuredocs.org/clojure_core/clojure.core/count)
  - format : [http://clojuredocs.org/clojure_core/clojure.core/format](http://clojuredocs.org/clojure_core/clojure.core/format)
  - subs : [http://clojuredocs.org/clojure_core/clojure.core/subs](http://clojuredocs.org/clojure_core/clojure.core/subs)
  - str : [http://clojuredocs.org/clojure_core/clojure.core/str](http://clojuredocs.org/clojure_core/clojure.core/str)
  - clojure.string/blank? : [http://clojuredocs.org/clojure_core/clojure.string/blank_q](http://clojuredocs.org/clojure_core/clojure.string/blank_q)
  - clojure.string/capitalize : [http://clojuredocs.org/clojure_core/clojure.string/capitalize](http://clojuredocs.org/clojure_core/clojure.string/capitalize)
  - clojure.string/join : [http://clojuredocs.org/clojure_core/clojure.string/join](http://clojuredocs.org/clojure_core/clojure.string/join)
  - clojure.string/lower-case : [http://clojuredocs.org/clojure_core/clojure.string/lower-case](http://clojuredocs.org/clojure_core/clojure.string/lower-case)
  - clojure.string/replace : [http://clojuredocs.org/clojure_core/clojure.string/replace](http://clojuredocs.org/clojure_core/clojure.string/replace)
  - clojure.string/replace-first : [http://clojuredocs.org/clojure_core/clojure.string/replace-first](http://clojuredocs.org/clojure_core/clojure.string/replace-first)
  - clojure.string/reverse : [http://clojuredocs.org/clojure_core/clojure.string/reverse](http://clojuredocs.org/clojure_core/clojure.string/reverse)
  - clojure.string/split-lines : [http://clojuredocs.org/clojure_core/clojure.string/split-lines](http://clojuredocs.org/clojure_core/clojure.string/split-lines)
  - clojure.string/upper-case : [http://clojuredocs.org/clojure_core/clojure.string/upper-case](http://clojuredocs.org/clojure_core/clojure.string/upper-case)
  <br/><br/>

- Clojure Documentation, Introduction to Clojure, Functions For Working With Strings

    [http://clojure-doc.org/articles/tutorials/introduction.html#functions-for-working-with-strings](http://clojure-doc.org/articles/tutorials/introduction.html#functions-for-working-with-strings)

- Clojure from the ground up: basic types, Strings

    [http://aphyr.com/posts/302-clojure-from-the-ground-up-basic-types](http://aphyr.com/posts/302-clojure-from-the-ground-up-basic-types)

- Clojure for the Brave and True, 2.3 Strings

    [http://www.braveclojure.com/do-things/#2_3__Strings](http://www.braveclojure.com/do-things/#2_3__Strings)

- PCL -> Clojure, Chapter 10. Numbers, Characters, and Strings

    [http://thinkrelevance.com/blog/2008/09/19/pcl-clojure-chapter-10](http://thinkrelevance.com/blog/2008/09/19/pcl-clojure-chapter-10)