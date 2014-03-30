---
layout: docs
title: Conditional <code>if</code>
permalink: /docs/clojure/if/
level: easy
author: yokolet
---

"If it is a good weather, I will go to a park; otherwise, I'll go to a cafe."
This is called a "if-branching" in a programming world.
Since the if-branching is simple conditionals, it is frequently used to devided into two states, true or false.

In Clojure, `if` is a special form and the syntax is:

`(if test then else?)` or `(if test then)`

At first, [`Truthiness`]({{ site.baseurl}}/docs/clojure/truthiness/) of the *test* is checked.
When the *test* turns out to be true, *then* gets run; otherwise, *else?* gets run if exists.
The *else?* is optional.

{% highlight clojure %}
user> (defn my-plan
        [weather]
        (if (= :good weather) "I'll go to a park." "I'll go to a cafe."))
#'user/my-plan
user> (my-plan :good)
"I'll go to a park."
user> (my-plan :bad)  ; anythigns else :good falls to else?
"I'll go to a cafe."

user> ; when else? is not given
user> (defn my-plan2
        [weather]
        (if (= :good weather) "I'll go to a park."))
#'user/my-plan2
user> (my-plan2 :good)
"I'll go to a park."
user> (my-plan2 :bad)  ; anything else :good returns nil
nil
{% endhighlight %}

As the `if` syntax shows, Clojure doesn't have *else if*.
In the case, *else if* flow control is needed,
we may use [`cond`]({{ site.baseurl}}/docs/clojure/cond/), [`case`]({{ site.baseurl}}/docs/clojure/case/), and some more conditionals.
<br/><br/>

In addition to `if`, some languages have an *unless* conditional.
Clojure has `if-not` macro for unless conditional.

The syntax is:

`(if-not test then else?)` or `(if-not test then)`

{% highlight clojure %}
user> (defn my-plan3
        [weather]
        (if-not (= :good weather) "I'll go to a cafe." "I'll go to a park."))
#'user/my-plan3
user> (my-plan3 :bad)
"I'll go to a cafe."
user> (my-plan3 :good)
"I'll go to a park."
{% endhighlight %}

- Advice to coaches

    Please mention about there's one more unless conditional. (if (not (= ....)))

    This would be one example that Clojure has many ways to do the same thing.
<br/><br/>

Moreover, Clojure has an unique way of using `if` conditional with [`let`]({{ site.baseurl}}/docs/clojure/let/) binding.
It is `if-let` macro, which is useful when we want to use the result of *test*.

The syntax is:

`(if-let bindings then)` or `(if-let bindings then else & oldform)`

{% highlight clojure %}
user> (defn weather-is-good?
        [weather]
        (if-let [actual (= :good weather)]
                (str "The weather is good? " actual)
                "The weather is at least not good."))
#'user/weather-is-good?
user> (weather-is-good? :good)
"The weather is good? true"
user> (weather-is-good? :bad)
"The weather is at least not good."
user> ; actual is availabe only in *then* clause

user> ; if actual is referred in *else* clause
user> (defn weather-is-good?
        [weather]
        (if-let [actual (= :good weather)]
                (str "The weather is good? " actual)
                actual))
CompilerException java.lang.RuntimeException: Unable to resolve symbol: actual in this context, compiling:(/private/var/folders/4b/c9gsjvv12tq9n4mph065qs480000gn/T/form-init7461059366215401347.clj:3:9)
{% endhighlight %}
<br/>

### References

- ClojureDocs

  - `if`
    [http://clojuredocs.org/clojure_core/clojure.core/if](http://clojuredocs.org/clojure_core/clojure.core/if)

  - `if-not`
    [http://clojuredocs.org/clojure_core/clojure.core/if-not](http://clojuredocs.org/clojure_core/clojure.core/if-not)

  - `if-let`
    [http://clojuredocs.org/clojure_core/clojure.core/if-let](http://clojuredocs.org/clojure_core/clojure.core/if-let)

- Special Froms, if

    [http://clojure.org/special_forms#Special Forms--(if test then else?)](http://clojure.org/special_forms#Special Forms--(if test then else?))

- Introduction to Clojure

    [http://clojure-doc.org/articles/tutorials/introduction.html#control-structures](http://clojure-doc.org/articles/tutorials/introduction.html#control-structures)

- Clojure for the Brave and True, Control Flow, if

    [http://www.braveclojure.com/do-things/#1_2__Control_Flow](http://www.braveclojure.com/do-things/#1_2__Control_Flow)

-  GetClojure

    <a href="http://getclojure.com/search?q=if&num=0" target="_blank">http://getclojure.com/search?q=if&num=0</a>