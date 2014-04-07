---
layout: docs
title: Assignment <code>let</code>
permalink: /docs/clojure/let/
level: easy
author: yokolet
---

- Advice to coaches

    The *let* binding is frequently used in function definitions.
    We have functions with destructuring and functions with let/destructuring sections.
    It may be good to come back to this lab after or during the function lab.

Like [`def`]({{ site.baseurl}}/docs/clojure/def/), `let` creates a *binding*.
In other languages, it is called a local variable assignment.
In Clojure, it has the different name: *lexical binding*.
Similar to  local variables in other languages, Clojure's lexically bound variables are available to
use in a limited code block (scope).
However, unlike other languages, the values never change (immutable).
For convenience, this document uses the word *variable* but its value won't vary once the value is assigned.

The syntax is `(let [bindings*] exprs*)`.

Let's try this in a REPL.

{% highlight clojure %}
user> (let [her-number 234] (println her-number))
234
nil
user> her-number
CompilerException java.lang.RuntimeException: Unable to resolve symbol: her-number in this context
, compiling:(/private/var/folders/4b/c9gsjvv12tq9n4mph065qs480000gn/T/form-init6323661111322215411
.clj:1:743)
user> ; because her-number is available only within let parenthesis (body).
{% endhighlight %}

We can write as many bindings (key-value pairs) as we want within the square brackets.
Those bindings are evaluated one by one, so we can use the evaluated result
within a single square bracket. Try these examples below:

{% highlight clojure %}
user> (let [x 1
            y 1
            z (+ x y)
            z (* 2 z) ] (println z))
4
nil
user> (let [+ str    ; locally, + works as string concatenation
            w (+ "a" "b" "c")]
        (println (+ "I got " w)))
I got abc
nil
{% endhighlight %}


As seen in the examples above, the value part of bindings can be a function.
We can use `println` function in let bindings, too.
This is often used for debugging so that you can check the value.


{% highlight clojure %}
user> (let [x 1
            y 1
            z (+ x y)
            _ (println (str "z was " z))
            z (* 2 z)]
        z)
z was 2
4
{% endhighlight %}


### References

- ClojureDocs

    [http://clojuredocs.org/clojure_core/clojure.core/let](http://clojuredocs.org/clojure_core/clojure.core/let)

- Introduction to Clojure, Let and Locals

    [http://clojure-doc.org/articles/tutorials/introduction.html#let-and-locals](http://clojure-doc.org/articles/tutorials/introduction.html#let-and-locals)

- Clojure from the ground up: functions, "Let bindings"

    [http://aphyr.com/posts/303-clojure-from-the-ground-up-functions](http://aphyr.com/posts/303-clojure-from-the-ground-up-functions)

- Clojure for the Brave and True, Do Things, 4.2 let

    [http://www.braveclojure.com/do-things/#4_2__let](http://www.braveclojure.com/do-things/#4_2__let)