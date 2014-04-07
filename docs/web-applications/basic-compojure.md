---
layout: docs
title: Easy web application by Compojure
permalink: /docs/web-applications/easy-compojure/
level: easy
author: yokolet
---

In contrast to the lab "[Basic web application by Ring]({{ site.baseurl }}/docs/web-applications/basic-ring/)", 
this lab gets one step closer to a real web application.
We will use Compojure[https://github.com/weavejester/compojure](https://github.com/weavejester/compojure) in this lab. Compojure is a web application framework that works on top of Ring.
Compojure does a lot of jobs necessary to create a web application.
Using Compojure, we can focus more on creating web pages.


### The first example

As always, the first thing we do is create a Clojure project.
BUT it's not `lein new` here. We will type in `lein new compojure` instead.

- Advice to coaches

    The command `lein new compojure` works on Leiningen 2.0.0 and later.
    If attendees are using Leiningen 1, install compojure-template
    following the instructions at [https://github.com/weavejester/compojure-template](https://github.com/weavejester/compojure-template).
    Alternatively, upgrade Leiningen to the latest version.

<br/>
{% highlight bash %}
$ lein new compojure hello-compojure
{% endhighlight %}

We don't need to edit `project.clj` since the command above does basic setup.
We don't even need to write code. A simple web application is already there.
So the next step is to start the server.
{% highlight bash %}
$ cd hello-compojure
$ lein ring server
{% endhighlight %}

Once the web server starts, a web page pops up with the message "Hello World".

Glance at the files that have been created by the lein command.

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

Look at `src/hello_compojure/handler.clj`. The file should be the same as the example below.

Change the words of line 7 and reload the web page on the browser.
You'll see the updated words.
{% gist 8346095 %}


### The second example - static HTML

Our web application is already set up to serve static pages.
Let's add a static page.

You can put static pages in `resources/public` or its subdirectories.
Create a file `helloworld.html`.

    resources
    └── public
       └── helloworld.html


{% gist 8346491 %}


On the browser, go to the URL `http://localhost:3000/helloworld.html`.
You'll see the page that you just created.
Again, edit the HTML file and reload the same page on the browser.

### The third example - stylesheet

In most cases, web pages have stylesheets and JavaScript.
In this example, we will add a simple stylesheet to helloworld.html.

- Advice to coaches

    Make sure attendees know about HTML, stylesheets and javascript.
    If they don't know those, please explain what those are and what the differences are.

The stylesheet is static, so we will add `style.css` under the `resources/public` directory.
Web developers/designers usually create a directory just for CSS. Following this practice, create a `css` directory.

    resources
    └── public
        ├── css
        │   └── style.css
        └── helloworld.html

The file `style.css` should look like this:

{% gist 8346990 %}

We need to do one more thing. Out HTML file should know that the CSS file exists.
To include `style.css`, add line 6 to `helloworld.html`.

{% gist 8347010 %}

Go to the browser and request `http://localhost:3000/helloworld.html`.
You'll see that the appearance has changed because of the stylesheet.


### References

- HTML tutorial
    [http://www.w3schools.com/html/default.asp](http://www.w3schools.com/html/default.asp)

- CSS tutorial
    [http://www.w3schools.com/css/default.asp](http://www.w3schools.com/css/default.asp)