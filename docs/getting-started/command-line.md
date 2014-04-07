---
layout: docs
title: Command Line
permalink: /docs/getting-started/command-line/
level: easy
author: yokolet
---

This lab is to get familiar with *command*s. Your editor may have a command to run Clojure code. People may use different commands while programming. Learning commands is also a part of learning a programming language.

Open Terminal on OS X, Linux, or BSD, or open the Command Prompt on Windows (Start - Run - cmd).
Type command `java -version`:

{% highlight bash %}
bash-3.2$ java -version
java version "1.8.0-ea"
Java(TM) SE Runtime Environment (build 1.8.0-ea-b118)
Java HotSpot(TM) 64-Bit Server VM (build 25.0-b60, mixed mode)
{% endhighlight %}

The results may vary, but the `java` command should work and it should report its version.

- Advice to coaches

    Please check every attendee has Java installed, and check the Java version. Leiningen works on JDK 6 and later.

Try some more commands. These commands are used to explore directories on OS X, Linux, or BSD:

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

On Windows:
{% highlight bash %}
mkdir my-lovely-dir
cd my-lovely-dir
dir
{% endhighlight %}

- Advice to coaches

    Briefly explain which commnds do what. Introduce more commands if necessary. However, this lab should not take long.
