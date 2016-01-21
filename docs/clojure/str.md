---
layout: docs
title: Core Function <code>str</code>
permalink: /docs/clojure/str/
level: easy
author: Arne Brasseur
---

`str` is a function that turns its arguments into [strings](/community-docs/docs/clojure/string/).

{% highlight clojure %}
user=> (str 123)
"123"
user=> (str :a-keyword)
":a-keyword"
user=> (str false)
"false"
user=> (map str (range 10))
("0" "1" "2" "3" "4" "5" "6" "7" "8" "9")
{% endhighlight %}

When `str` is given multiple arguments, then it will concatenate them all into one big string.

{% highlight clojure %}
user=> (str "I need " 5 " of these")
"I need 5 of these"
user=> (str "In "
#_=>        (rand-nth ["summer" "winter"])
#_=>        " I like to go "
#_=>        (rand-nth ["swimming" "running"]))
"In summer I like to go swimming"
{% endhighlight %}

### References

- [`str` on ClojureDocs](http://clojuredocs.org/clojure.core/str)
