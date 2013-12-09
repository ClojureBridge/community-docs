---
layout: docs
title: Command Line
permalink: /docs/getting-started/command-line/
level: easy
author: yokolet
---

This lab is to get familiar with *command*s. Editor may support the feature to run Clojure code; however, people intesively use various commands while programming. Learning commands is also a part of learning a programming language.


Open Terminal on OSX or Linux (may BSD), Command Prompt on Windows.
Type command `java -version`:

{% highlight bash %}
bash-3.2$ java -version
java version "1.8.0-ea"
Java(TM) SE Runtime Environment (build 1.8.0-ea-b118)
Java HotSpot(TM) 64-Bit Server VM (build 25.0-b60, mixed mode)
{% endhighlight %}

The result may vary, but `java` command should work and reports it's version.


- Advice to coaches

    Please check every attedees have Java installed and it's version. Leiningen works on JDK 6 and later.


Try some more commands. These commands are used to explore directories:

{% highlight bash %}
bash-3.2$ pwd
/Users/yoko
bash-3.2$ mkdir my-lovely-dir
bash-3.2$ cd my-lovely-dir
bash-3.2$ pwd
/Users/yoko/my-lovely-dir
bash-3.2$ ls -la
total 0
drwxr-xr-x   2 yoko  staff    68 Dec  8 19:23 .
drwxr-xr-x+ 94 yoko  staff  3196 Dec  8 19:23 ..
bash-3.2$ cd ~
bash-3.2$ pwd
/Users/yoko
{% endhighlight %}


- Advice to coaches

    Explain what commnds do what, berifly. Introduce more commands if necessary. However, this lab should not take long.
