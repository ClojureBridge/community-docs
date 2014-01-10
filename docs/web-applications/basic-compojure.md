---
layout: docs
title: Easy web application by Compojure
permalink: /docs/web-applications/easy-compojure/
level: easy
author: yokolet
---

In constrast to the lab, [Basic web application by Ring]({{ site.baseurl }}/docs/web-applications/basic-ring/), 
this lab gets one step closer to the real web application.
We will use Compojure[https://github.com/weavejester/compojure](https://github.com/weavejester/compojure) in this lab. Compojure is a kind of web application framework, which works on top of Ring.
Compojure does a lot of jobs necessary to create a web application.
Using Compojure, we can focus more to create web pages.


### The first example

As always we do, the first thing is to create a Clojure project.
BUT!, it's not `lein new` here. We will type `lein new compojure` command.

- Advice to coaches

    The command `lein new compojure` works on Leiningen 2.0.0 and later.
    If attendees are using Leiningen 1, install compojure-template
    following the instruction, [https://github.com/weavejester/compojure-template](https://github.com/weavejester/compojure-template).
    Or, upgrade Leiningen to the latest.

<br/>
{% highlight bash %}
$ lein new compojure hello-compojure
{% endhighlight %}

We don't need to edit `project.clj` since the command above does basic setups.
We even don't need write code. A simple web application is already there.
For this reason, the next step is to start the server.
{% highlight bash %}
$ cd hello-compojure
$ lein ring server
{% endhighlight %}

Once a web server starts running, a web page pops up and shows "Hello World".

Glance at what files have been created by lein command.

    .
    ├── README.md
    ├── project.clj
    ├── resources
    │   └── public
    ├── src
    │   └── hello_compojure
    │       └── handler.clj
    ├── target
    │   ├── classes
    │   └── stale
    │       └── extract-native.dependencies
    └── test
        └── hello_compojure
            └── test
                └── handler.clj

Look at `src/hello_compojure/handler.clj`. The file should be the one below.

Change the words of line 7 and reload the web page on the browser.
You'll see the updated words.
{% gist 8346095 %}


### The second example - static html

Our web application already has the setup to serve static pages.
Let's add a static page.

The place to put the static page is `resources/public` and its subdirectories.
Create a file `helloworld.html`.

    resources
    └── public
       └── helloworld.html


{% gist 8346491 %}


On the browser, request the URL `http://localhost:3000/helloworld.html`.
You'll see the contents you just created.
Again, edit the html file and reload the same page on the browser.


### The third example - stylesheet

In most cases, web pages have a stylesheet and javascript.
This this example, we will add a simple stylesheet to helloworld.html.

- Advice to coaches

    Make sure what attendees know about html, stylesheet and javascript.
    If they don't know those, please explain what are those, what the difference, or other.

The stylesheet is a static contents,
so we will add `style.css` under `resources/public` directory.
Usually, web application developers/designers create a directory just for css.
Following this, create `css` directory.

    resources
    └── public
        ├── css
        │   └── style.css
        └── helloworld.html

The file, `style.css`, looks like below:

{% gist 8346990 %}

We need to do one more thing. Out html file should know the css file exists.
To include `style.css`, add line 6 to `helloworl.html`.

{% gist 8347010 %}

Go to the browser and request `http://localhost:3000/helloworld.html`.
You'll see style has been added.


### References

- HTML tutorial
    [http://www.w3schools.com/html/default.asp](http://www.w3schools.com/html/default.asp)

- CSS tutorial
    [http://www.w3schools.com/css/default.asp](http://www.w3schools.com/css/default.asp)