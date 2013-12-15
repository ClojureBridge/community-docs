---
layout: docs
title: Types
permalink: /docs/clojure/types/
level: easy
author: yokolet
---

Which one is bigger, `nil` or `0`?<br/>
Yes, it is a weird question since nil and 0 are completely different type of things.

{% highlight clojure %}
user=> (< nil 0)

NullPointerException   clojure.lang.Numbers.ops (Numbers.java:942)
user=> ; cant' compare since those are different things

user=> ; but we know those are different

user=> (not= nil 0)
true
{% endhighlight %}

Computer languages have idea of *types* to express different things, so does Clojure.

Clojure has three big type groups, basic types, data structures, and other miscellaneous types.

####  basic types

{% highlight clojure %}
user=> (type nil)
nil
user=> (type true)
java.lang.Boolean
user=> (type false)
java.lang.Boolean

user=> ; numbers

user=> (type 0)
java.lang.Long
user=> (type 0N)
clojure.lang.BigInt
user=> (type 0xffffffffffffffff) ; big hexadecimal number
clojure.lang.BigInt
user=> (type 3.14)
java.lang.Double
user=> (type 3.14M)
java.math.BigDecimal
user=> (type 4/3)
clojure.lang.Ratio

user=> (type :foo) ; keyword
clojure.lang.Keyword
user=> (type 'foo) ; symbol
clojure.lang.Symbol
user=> (type "foo") ; string
java.lang.String
user=> (type \f)  ; character
java.lang.Character
{% endhighlight %}

####  data structures

{% highlight clojure %}
user=> (type []) ; vector
clojure.lang.PersistentVector
user=> (type '()) ; empty list
clojure.lang.PersistentList$EmptyList
user=> (type '(1)) ; list
clojure.lang.PersistentList
user=> (type {}) ; map (or hash, table)
clojure.lang.PersistentArrayMap
user=> (type #{}) ; set
clojure.lang.PersistentHashSet
{% endhighlight %}

#### other types
{% highlight clojure %}
user=> (type Boolean) ; Java's Boolean class
java.lang.Class
user=> (type +) ; + operator
clojure.core$_PLUS_
user=> (type +) ; / operator
clojure.core$_PLUS_
user=> (type (fn [] ())) ; function
user$eval1158$fn__1159
user=> (type #"[a-z]*") ; regular expression
java.util.regex.Pattern
user=> ; and more

{% endhighlight %}


- Advice to coaches

    Please focus on basic types here. There are other labs for data structures.
    However, if the attendees don't know what is data structure, it will be nice to explain a little.
    Other types are optional. Probably, we don't need to care much about examples in other types.


#### Comparison and Equalities

Now, we know more about types. Let's try some comparisons. Below are few examples, try your own comparison or equalities.

{% highlight clojure %}
user=> ; number types are comparable even though types are different

user=> (< 0.9M 1)
true
user=> (< 1N 4/3)
true

user=> (< "a" "b") ; Clojure compares numbers only

ClassCastException java.lang.String cannot be cast to java.lang.Number  clojure.lang.Numbers.lt (Numbers.java:219)

user=> (= 4/3 28/21) ; Both are the Ratio type whose values are the same
true

user=> (= 1 1.0) ; looks the same values, but types are different
false

user=> (= (fn [] ()) (fn [] ())) ; also, these look the same, but not
false
{% endhighlight %}