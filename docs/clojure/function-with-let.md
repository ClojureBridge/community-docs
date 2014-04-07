---
layout: docs
title: Function with <code>let</code> and Destructuring
permalink: /docs/clojure/function-with-let/
level: easy
author: yokolet
---

In Clojure, assignements are done with *bindings*.
Even when you're within a function definition, assignments are done by bindings.
We want variables to be available only within that function.
Otherwise, the code may be buggy because other functions may be affected by value changes.

Clojure programmers use [`let` binding]({{ site.baseurl}}/docs/clojure/let/) for local variables that work only within the functions.

Here's a simple example.
We could write the code below without using the `let` binding. However, using `let` makes the last form simpler. 

{% gist 9927610 %}

{% highlight clojure %}
user=> (question "Mary" "John")
"Hey Mary, are Mary's and John's the same?"
{% endhighlight %}
<br/>

We can even bind a function as a value.
This helps us avoid repetition or perform pre-processing.

{% gist 9938351 %}

{% highlight clojure %}
user=> (question "Mary" "John")
"Hey Mary, are Mary's and John's the same?"
{% endhighlight %}
<br/>

Let's look at one more example.
This example tests if the three numbers given will create a [right triangle](http://www.webmath.com/rtri.html).
When a (adjacent), b (opposite), and c (hypotenuse) are given,
the function tests a * a + b * b = c * c .
The function assumes three values will be given as a vector, [a b c].

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

The *right-triangle?* function above uses the *nth* function to get the adjacent, opposite and hypotenuse values.
The *nth* function works, but Clojure has a smart way of assigning values.
It is [`destructuring`]({{ site.baseurl}}/docs/clojure/destructuring).
The function *right-triangle2?* below uses destructuring in function arguments.
Without any additional functions or preprocessing, we can assign three values at the same time.

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