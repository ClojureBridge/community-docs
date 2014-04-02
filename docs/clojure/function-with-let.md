---
layout: docs
title: Function with <code>let</code> and Destructuring
permalink: /docs/clojure/function-with-let/
level: easy
author: yokolet
---

In Clojure, assignements are done by *bindings*.
Even though it is within a function definition, assignments are done by bindings.
Within function, we want variables only available to use within that function.
Unless the code will be buggy.
We don't know how other functions will be affected by the value change.

Clojure programmers use [`let` binding]({{ site.baseurl}}/docs/clojure/let/) a lot for locally(within the function) used variables.

Here's the simple example.
We may write the code below without `let` binding, however, using `let` makes the last form simple. 

{% gist 9927610 %}

{% highlight clojure %}
user=> (question "Mary" "John")
"Hey Mary, is Mary's and John's the same?"
{% endhighlight %}
<br/>

Let's look at one more example.
This example tests given 3 numbers will create a [right triangle](http://www.webmath.com/rtri.html).
When a (ajacent), b (opposite), and c (hypotenuse) is given,
the function tests a * a + b * b = c * c .
The function assumes three values will be given as a vector, [a b c]

  - nth: [http://clojuredocs.org/clojure_core/clojure.core/nth](http://clojuredocs.org/clojure_core/clojure.core/nth)

{% gist 9927616 %}

{% highlight clojure %}
user=> (right-triangle? [1 2 3])
false
user=> (right-triangle? [3 4 5])
true
user=> (right-triangle? [5 6 7])
false
{% endhighlight %}
<br/>

The *right-triangle?* function above used *nth* function to get each value.
In such a case, Clojure has a smart way of assigning values.
It is [`destructuring`]({{ site.baseurl}}/docs/clojure/destructuring).
The function *right-triangle2?* below uses destructuring in function arguments.

{% gist 9927633  %}

{% highlight clojure %}
user=> (right-triangle2? [1 2 3])
false
user=> (right-triangle2? [3 4 5])
true
user=> (right-triangle2? [5 6 7])
false

user=> ; we can do above three in a single line using map function
user=> (map right-triangle2? [[1 2 3] [3 4 5] [5 6 7]])
(false true false)
{% endhighlight %}


### References

- Clojure for the Brave and True, Do Things, 3.3 Defining Functions

    [http://www.braveclojure.com/do-things/#3_3_3__Destructuring](http://www.braveclojure.com/do-things/#3_3_3__Destructuring)