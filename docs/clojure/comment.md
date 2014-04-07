---
layout: docs
title: Comment
permalink: /docs/clojure/comment/
level: easy
author: yokolet
---

Programmers often add comments for various reasons, such as explaining code or temporarily disabling code.

Clojure has three ways to add comments or comment out a section.

  - `comment` macro
  - `;` reader macro
  - `#_` reader macro
<br/><br/>

#### `comment` macro

The syntax is like a function: `(comment & body)`.

With this comment style, we can write multi-line comments
or comment out multi-line code blocks.

{% gist 9301920 %}
<br/>

#### `;` (semicolon) reader macro

This is used to comment out a single line.
Clojure ignores everything from the `;` (semicolon) to the end of the line.

{% highlight clojure %}
user> (+ 1 2) ; the answer is 3
3

user> (def my-number
           ;; this is used later
           123)
#'user/my-number
user> my-number
123
{% endhighlight %}
<br/>

#### `#_` reader macro

This is used to comment out a form.
For example, a corresponding pair of `(` and `)`, or `[` and `]`.
The form can be nested.

{% highlight clojure %}
user> (def my-vec #_[1 2 3] [3 4 5])
#'user/my-vec
user> my-vec
[3 4 5]
user> ; [1 2 3] was ignored

user> (take 5 #_(iterate inc 0) (range))
(0 1 2 3 4)
user> ; (iterate inc 0) was ignored

user> (defn reverse-word
        [five-letter-word]
        #_(let [[a b c d e] five-letter-word]
          (str e d c b a))
        (clojure.string/reverse five-letter-word))
#'user/reverse-word
user> (reverse-word "hello")
"olleh"
user> ; let form  was ignored
{% endhighlight %}
<br/>

### References

- ClojureDocs

    [http://clojuredocs.org/clojure_core/clojure.core/comment](http://clojuredocs.org/clojure_core/clojure.core/comment)

- The Reader "Macro characters" section,  "Comment" and "Dispatch"

    [http://clojure.org/reader](http://clojure.org/reader)


- Clojure Style Guide

    [https://github.com/bbatsov/clojure-style-guide#comments](https://github.com/bbatsov/clojure-style-guide#comments)


- GetClojure

    <a href="http://getclojure.com/search?q=comment&num=0" target="_blank">http://getclojure.com/search?q=comment&num=0</a>