---
layout: docs
title: Hello World
permalink: /docs/getting-started/helloworld/
level: easy
author: yokolet
---

This is always the first tiny baby step when learning a programming language.
Let's try "Hello, World!" in Clojure.

#### On repl

Start repl. When you use Leiningen, type `lein repl` on Terminal (Command Prompt):
{% highlight bash %}
bash-3.2$ lein repl
nREPL server started on port 59553 on host 127.0.0.1
REPL-y 0.2.1
Clojure 1.5.1
    Docs: (doc function-name-here)
          (find-doc "part-of-name-here")
  Source: (source function-name-here)
 Javadoc: (javadoc java-object-or-class-here)
    Exit: Control+D or (exit) or (quit)
 Results: Stored in vars *1, *2, *3, an exception in *e

user=>
{% endhighlight %}

Type below on repl:

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

    If this is the first Clojure code, please explain Clojure's syntax: parenthesis, function, argument, etc.
    Explain the different functions above, if necessary. For example, `prn` is for `reader`, while `println` is for human consumption. <br/><br/>


#### Hello World by runnable program
Create a brand new Clojure project:
{% highlight bash %}
bash-3.2$ lein new helloworld
{% endhighlight %}

Add `main` to `project.clj` (line 7):
{% gist 7867336 %}

Edit `src/helloworld/core.clj` to look like below: {% gist 7867298 %} 

Run the program:
{% highlight bash %}
bash-3.2$ lein run
Hello, World!
{% endhighlight %}

- Advice to coaches

    This is an optional lab work. After it is tried, explain the moving parts of a Clojure project, such as `project.clj` and namespaces. You don't have to explain it in detail, because other labs will cover those topics. This lab is to get familiar with Clojure programming.