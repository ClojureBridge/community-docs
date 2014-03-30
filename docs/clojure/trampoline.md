---
layout: docs
title: Loop <code>trampoline</code>
permalink: /docs/clojure/trampoline/
level: intermediate
author: yokolet
---

The `trampoline` function is used to optimize a mutually recursive function relations.
This function is effective when recursive call is not an explicit tail recursive.

The syntax is: `(trampoline f) (trampoline f & args)`

- Advice to coaches

  The example blow prints out to standard output.
  If the attendees are using LightTable, they need to open console to see the result.
  Also, be careful.
  After trying this example on Instarepl, a response of the Instarepl may become very slow.

If we don't use trampline, the example below will raise "java.lang.StackOverflowError: null".

  - declare: [http://clojuredocs.org/clojure_core/clojure.core/declare](http://clojuredocs.org/clojure_core/clojure.core/declare)
  - rand-int: [http://clojuredocs.org/clojure_core/clojure.core/rand-int](http://clojuredocs.org/clojure_core/clojure.core/rand-int)

{% gist 9866070 %}

{% highlight clojure %}
user=> (incrementor 500)
500, 591, 518, 566, 505, .... (bunch of numbers) ....
-1191,
StackOverflowError   java.lang.ReflectiveOperationException.<init> (ReflectiveOperationException.java:89)
{% endhighlight %}

The two functions, *incrementor* and *descrementor*, call each other.
The `declare` is used to define this sort of mutual call functions.
Since Clojure interprets from to to bottom, *decrementor* function in *incrementor* function can't be found without `declare`.
<br/>

To avoid StackOverFlowError, we can use `trampoline` function.
This function takes function and a given function's argument(s).
While the given function returns a function, `trampoline` keeps calling the give function without an argument.

To use `trampoline`, we need to change *incrementor* and *decrementor* so that those will return a function. Changing it to anonymous functions does the job.
Below is a trampline-able functions.

{% gist 9866286  %}

{% highlight clojure %}
user=> (incrementor2 500)
500, #<user$incrementor2$fn__664 user$incrementor2$fn__664@2f5731c7>
user=> ; incrementor2 function returns function

user=> (trampoline incrementor2 500)
500, 535, 523, 539, 523, ... (bunch of numbers) ....
9995, 9955, 9970, 9959, 10048, nil
{% endhighlight %}


In the first example, we wrote functions to call each other.
However, we can use Clojure's core functions or macros wrapped in an anonymous function.
Let's look at the second example below.
Both *right-and-left* and *right-and-left* functions moves a cursor right and left.
For example,

  size 3: right, right, left, done

  size 4: right, right, right, left, left, right, done

  size 5: right, right, right, right, left, left, left, right, right, left, done

As we looked at the first example, *right-and-left* function raises StackOverFlowError when the size gets bigger while trampoline-ed *right-and-left2* function doesn't.
Additionally, the second example doesn't use `declare`.
Instead, it defines local function within `letfn` scope.

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
