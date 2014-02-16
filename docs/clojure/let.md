---
layout: docs
title: Assignment <code>let</code>
permalink: /docs/clojure/let/
level: easy
author: yokolet
---

- Advice to coaches

    As you know, in most cases, let binding is used in a function, and with destructure.
    We have function and destructure sections.
    It may be good to come back this lab after or during the function lab.

Like [`def`]({{ site.baseurl}}/docs/clojure/def/) does, `let` creates a *binding*.
In other languages, it is called a local variable assignment in general.
In Clojure, it has the diffrenct name, *lexical binding*.
Like the local variable in other languages, Clojure's lexically bound variable is available to
use in a limitted code block (scope).

The syntax is `(let [bindings*] body)`.

Let's try below on REPL.

{% highlight clojure %}
user> (let [her-number 234] (println her-number))
234
nil
user> her-number
CompilerException java.lang.RuntimeException: Unable to resolve symbol: her-number in this context
, compiling:(/private/var/folders/4b/c9gsjvv12tq9n4mph065qs480000gn/T/form-init6323661111322215411
.clj:1:743)
user> ; because her-number is available within let parenthesis (body).
{% endhighlight %}

We can write as many as bindings (key-value pair) within a square braket.
Those bindings are evaluated one by one, so we can use the evaluated result
within a single square bracket. Try examples below:

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


As the examples above, the value part of bindings can be a function.
We can use `println` function in let bindings, also.
This is often used for debugging to make sure what value is in there.


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

- Clojure from the ground up, Let bindings section
    [http://aphyr.com/posts/303-clojure-from-the-ground-up-functions](http://aphyr.com/posts/303-clojure-from-the-ground-up-functions)

- Clojure for the Brave and True, Do Things, 4.2 let
    [http://www.braveclojure.com/do-things/#4_2__let](http://www.braveclojure.com/do-things/#4_2__let)