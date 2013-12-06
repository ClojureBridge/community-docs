---
layout: docs
title: Hello World
permalink: /docs/helloworld/
level: easy
author: yokolet
---

This is always the first tiny baby step to learn programing language.
Let's try "Hello, World!" in Clojure.

#### On repl
{% highlight clojure %}
user=> (prn "Hello World")
"Hello World"
nil
user=> (println "Hello World")
Hello World
nil
user=> (pr-str "Hello World")
"\"Hello World\""
{% endhighlight %}

- Advice to coaches

    Explain the difference above (if necessary). For example, `prn` is for `reader`, while `println` is for human consumption. <br/><br/>


#### Hello World by runnable program
Create a bran new Clojure project:
{% highlight bash %}
lein new helloworld
{% endhighlight %}

Add `main` to `project.clj` (line 7):
{% highlight clojure linenos %}
(defproject helloworld "0.1.0-SNAPSHOT"
  :description "FIXME: write description"
  :url "http://example.com/FIXME"
  :license {:name "Eclipse Public License"
            :url "http://www.eclipse.org/legal/epl-v10.html"}
  :dependencies [[org.clojure/clojure "1.5.1"]]
  :main helloworld.core)
{% endhighlight %}

Edit `src/helloworld/core.clj` to look like below:
{% highlight clojure linenos %}
(ns helloworld.core)

(defn -main []
  "I can say 'Hello World'."
  (println "Hello, World!"))
{% endhighlight %}

Run the program:
{% highlight bash %}
bash-3.2$ lein run
Hello, World!
{% endhighlight %}

- Advice to coaches

    This is an optional lab work. When tried, explain moving parts of Clojure Project. For example, what is `project.clj` or namespace. But, don't need to be in detail. Other labs will cover those topics. This lab is to get familiar with Clojure programming.