---
layout: docs
title: Caesar Cipher
permalink: /docs/exercises/caesar-cipher/
level: easy
author: msszczep
---

A Caesar cipher is a very simple kind of encoding of alphabetic text (like English)
in which each letter in the text is replaced by another letter some fixed number of
positions down the alphabet.  For example, the string 
 
"hello"
 
can be replaced by a Caesar cipher one letter down the alphabet to the following:
 
"ifmmp"
 
One can write a function in Clojure to carry out a substitution, as in:

{% highlight clojure %} 
(defn caesar-cipher [words offset]
  "Assumes offset >=0, words entirely lowercase English characters or spaces"
  (let [alphabet-chars (map char "abcdefghijklmnopqrstuvwxyz")
        alphabet-shifted (->> (cycle alphabet-chars) (take 100) (drop offset))
        shifted-map (-> (zipmap alphabet-chars alphabet-shifted)
                        (assoc \space \space))]
    (apply str (map shifted-map (map char words)))))
 
(caesar-cipher "hello" 1)
; => "ifmmp"
{% endhighlight %}
 
Working out a Caesar cipher could make for a useful introductory Clojurebridge exercise.  
It would provide a way to interact with the core functions of the Clojure language, and one
can add in a bit of motivation with the encrypted message itself (if, say, the encrypted 
message describes the location of a small prize). 
 
An example of building a Caesar cipher might proceed as follows:

{% highlight clojure %}  
; start with a basic string 
(def mystring "hello")
; => "hello"
 
; you need the alphabet, of course
(def alphabet "abcdefghijklmnopqrstuvwxyz")
; => "abcdefghijklmnopqrstuvwxyz"
 
; break the alphabet string down into its constituent characters
(def alphabet-chars (map char alphabet))
; => (\a \b \c \d \e \f \g \h \i \j \k \l \m \n \o \p \q \r \s \t \u \v \w \x \y \z)
 
; shift the alphabet some number of characters 
(def alphabet-shifted (drop 5 (take 100 (cycle alphabet-chars))))
; => (\b \c \d \e \f \g \h \i \j \k \l \m \n \o \p \q \r \s \t \u \v \w \x \y \z \a \b \c \d \e \f \g \h \i \j \k \l \m \n \o \p \q \r \s \t \u \v \w \x \y \z \a \b \c \d \e \f \g \h \i \j \k \l \m \n \o \p \q \r \s \t \u \v \w \x \y \z \a \b \c \d \e \f \g \h \i \j \k \l \m \n \o \p \q \r \s \t \u \v)
 
; make a key-value relation between the alphabet and its shifted equivalent
(def shifted-map (zipmap alphabet-chars alphabet-shifted))
; => {\a \b, \b \c, \c \d, \d \e, \e \f, \f \g, \g \h, \h \i, \i \j, \j \k, \k \l, \l \m, \m \n, \n \o, \o \p, \p \q, \q \r, \r \s, \s \t, \t \u, \u \v, \v \w, \w \x, \x \y, \y \z, \z \a}
 
; account for spaces
(def shifted-map2 (assoc shifted-map \space \space))
; => {\space \space, \a \b, \b \c, \c \d, \d \e, \e \f, \f \g, \g \h, \h \i, \i \j, \j \k, \k \l, \l \m, \m \n, \n \o, \o \p, \p \q, \q \r, \r \s, \s \t, \t \u, \u \v, \v \w, \w \x, \x \y, \y \z, \z \a}
 
; convert the plaintext to its ciphertext equivalent
(apply str (map shifted-map2 (map char mystring)))
; => "ifmmp"
{% endhighlight %}