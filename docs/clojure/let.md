---
layout: docs
title: Assignment <code>let</code>
permalink: /docs/clojure/let/
level: easy
author: yokolet
---

Like [`def`]({{ site.baseurl}}/docs/clojure/def/) does, `let` creates a *binding*.
In general, it is called a local variable assignment in other languages.
However, in Clojure, it has the name *lexical binding*.
Like the local variable in other languages, Clojure's lexically binded variable is available to
use in a scope (a limitted code block).

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
user> ; her-number is available to use within let parenthesis.
{% endhighlight %}

We can write as many as bindings within a square braket.
Those bindings are evaluated one by one, so we can write as in below:

{% highlight clojure %}
user> (let [x 1
            y 1
            z (+ x y)
            double (* 2 z)] (println double))
4
nil
user> (let [+ str    ; locally, + works as string concatenation
            w (+ "a" "b" "c")]
        (println (+ "I got " w)))
I got abc
nil
{% endhighlight %}
