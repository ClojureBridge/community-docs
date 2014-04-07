---
layout: docs
title: Loop <code>trampoline</code>
permalink: /docs/clojure/trampoline/
level: intermediate
author: yokolet
---

The `trampoline` function is used to optimize a mutually recursive function relation.
This function is effective when a recursive call does not use explicit tail recursion.

The syntax is: `(trampoline f) (trampoline f & args)`

- Advice to coaches

  The example below prints out to standard output.
  If the attendees are using LightTable, they need to open the console to see the result.
  Be careful. After trying this example on Instarepl, a response of the Instarepl may become very slow.

If we don't use trampoline, the example below will raise "java.lang.StackOverflowError: null".

  - declare: [http://clojuredocs.org/clojure_core/clojure.core/declare](http://clojuredocs.org/clojure_core/clojure.core/declare)
  - rand-int: [http://clojuredocs.org/clojure_core/clojure.core/rand-int](http://clojuredocs.org/clojure_core/clojure.core/rand-int)

{% gist 9866070 %}

{% highlight clojure %}
user=> (incrementor 500)
500, 591, 518, 566, 505, .... (bunch of numbers) ....
-1191,
StackOverflowError   java.lang.ReflectiveOperationException.<init> (ReflectiveOperationException.java:89)
{% endhighlight %}

The *incrementor* and *decrementor* functions call each other.
`declare` is used to define this sort of mutual call functions.
Since Clojure interprets from top to bottom, the *decrementor* function in *incrementor* function can't be found without `declare`.
<br/>

To avoid StackOverflowError, we can use the `trampoline` function.
This function takes a function and the given function's argument(s).
While the given function returns a function, `trampoline` keeps calling the given function without an argument.

To use `trampoline`, we need to change *incrementor* and *decrementor* so that those will return a function. Changing it to [`anonymous function`]({{ site.baseurl}}/docs/clojure/anonymous-function) does the job.
Below is a trampoline-able functions.

{% gist 9866286  %}

{% highlight clojure %}
user=> (incrementor2 500)
500, #<user$incrementor2$fn__664 user$incrementor2$fn__664@2f5731c7>
user=> ; incrementor2 function returns function
user=> ; incrementor2 is a higher-order function since it returns function

user=> (trampoline incrementor2 500)
500, 535, 523, 539, 523, ... (bunch of numbers) ....
9995, 9955, 9970, 9959, 10048, nil
{% endhighlight %}

In the first example, we wrote functions to call each other.
We can use Clojure's core functions or macros wrapped in an anonymous function.
Let's look at the second example below.
Both the *right-and-left* and *right-and-left* functions move a cursor right and left.
For example:

  size 3: right, right, left, done

  size 4: right, right, right, left, left, right, done

  size 5: right, right, right, right, left, left, left, right, right, left, done

As we saw in the first example, *right-and-left* function raises StackOverflowError when the size gets bigger. The *right-and-left2* function that uses trampoline doesn't.
In addition, the second example doesn't use `declare`.
Instead, it defines a local function within the `letfn` scope.

  - letfn: [http://clojuredocs.org/clojure_core/clojure.core/letfn](http://clojuredocs.org/clojure_core/clojure.core/letfn)


{% gist 9867528 %}

{% highlight clojure %}
user=> (right-and-left 1000)

StackOverflowError   clojure.lang.PersistentVector.nth (PersistentVector.java:111)

user=> (right-and-left2 1000)
done
nil
{% endhighlight %}

### References

- ClojureDocs

    [http://clojuredocs.org/clojure_core/clojure.core/trampoline](http://clojuredocs.org/clojure_core/clojure.core/trampoline)

- GetClojure

    <a href="http://getclojure.com/search?q=trampoline&num=0" target="_blank">http://getclojure.com/search?q=trampoline&num=0</a>
