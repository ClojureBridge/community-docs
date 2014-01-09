---
layout: docs
title: Basic web application by Ring
permalink: /docs/web-applications/basic-ring/
level: easy
author: yokolet
---

We will create a very basic web application in this lab.
Our web application doesn't have any fancy feature.
It just returns simple words to the web browser, no HTML, no css, no Javascript at all.
This may be a boaring app, but is good to understand how web application works.
Also, how we can build it in a Clojure way.


In this lab, we will use Ring [https://github.com/ring-clojure/ring](https://github.com/ring-clojure/ring).
Ring is like Ruby's Rack or Python's WSGI,
receives HTTP requests and returns HTTP responses.
Ring is not a so-called web application framework.
We won't go further other than very basic examples.

- Advice to coaches

    Other labs use some web application frameworks.
    However, it would be a good idea to explain the difference between Ring and frameworks.
    Also, mention what kind of web application frameworks are out there.


### The first example

Like other labs, we start off by creating a Clojure project.

{% highlight bash %}
$ lein new hello-ring
{% endhighlight %}

Add two dependencies, `ring-core` and `ring-jetty-adapter`, to `project.clj`.
The `ring-core` provides fundametal functions to handle HTTP request/response.
The other one, `ring-jetty-adapter` provides web server feature by Jetty
[http://www.eclipse.org/jetty/](http://www.eclipse.org/jetty/).
Jetty is a Java servlet based web application server.

Also, add a main function, `hello-ring.core`, with `:main` key.
We will write main function later.
Our `project.clj` file will look like below:

{% gist 8329193 %}

Then, go to src/hello_ring directory and edit `core.clj` file.

As explained, our first web application is just returning
a few words. Those are in the HTTP response body part.
You may change the words to what you want to see.

{% gist 8329219 %}

Finally, run the web application.
Go to the hello-ring directory, which holds `project.clj` file.

{% highlight bash %}
$ lein run
2014-01-08 23:03:46.471:INFO:oejs.Server:jetty-7.6.8.v20121106
2014-01-08 23:03:46.502:INFO:oejs.AbstractConnector:Started SelectChannelConnector@0.0.0.0:3000
{% endhighlight %}

Now, the web server has started running. Open your favorit web browser and hit:

`http://localhost:3000`

You'll see the words on the browser.


- Advise to coaches

    Explain moving parts and what `handler` function is doing if necessary.


What if you want to change the words to diplay on the browser?
You may easily think of edit the handler function.
But, how to reload updated one?
Unfortunately, our first example doesn't have a feature to *reload*.
We need to shutdown the web server by control-c, then restart it by lein run.
This is not a good development environment.


### The second example

In the next example, we will try to make it reloadable.
Since we are using Ring and Leiningen, the easiest way is to add lein-ring plugin.
Our `project.clj` file will look like below. 
Look at line 5 and 6.
The line 5 is for lein-ring plugin, while the line 6 is an instruction to
the lein-ring plugin. We tell the plugin what handler should be monitored.

{% gist 8329465 %}


To meet with the instruction to lein-ring, we are going to create a new file.
The file name is `core2.clj`.
The directory is `src/hello_ring`, which is the same as `core.clj`.

    src
    └── hello_ring
        ├── core.clj
        └── core2.clj


The `core2.clj` will look like below:

{% gist 8329528 %}

This is simpler than our first example.
This is because lein-ring takes care of server stuff.


Now, let's start the server again.
But, the startup command is not `lein run` anymore.
Instead, it is `lein ring server`.

{% highlight bash %}
$ lein ring server
Retrieving lein-ring/lein-ring/0.8.10/lein-ring-0.8.10.pom from clojars
Retrieving org/clojure/data.xml/0.0.6/data.xml-0.0.6.pom from central
...
(snip)
...
2014-01-08 23:28:40.135:INFO:oejs.Server:jetty-7.6.8.v20121106
2014-01-08 23:28:40.163:INFO:oejs.AbstractConnector:Started SelectChannelConnector@0.0.0.0:3000
Started server on port 3000
{% endhighlight %}

Once the web server starts up, the web page pops up and shows the words in the `core2.clj`.

Change the words in `core2.clj` and reload the page on the browser.
You'll see the change is reloaded.
