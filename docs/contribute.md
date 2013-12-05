---
layout: docs
title: How to Contribute
permalink: /docs/contribute/
author: yokolet
---

## How to Contribute

This web site is [Github Pages](http://pages.github.com/).
Right after your pull request is merged, the contents will be updated. Handy!
But, we need to follow some manners of Github pages to make that happen.
Below are simplified explanation of Github pages and our specific rules.
Please read before your pull request gets rejected. Don't worry, rules are simple.

Below are steps to contribute.

- Fork the repository

    The pages are in `gh-pages` branch of [ClojureBridge/community-docs](https://github.com/ClojureBridge/community-docs) repository. The branch name expresses it is Github pages.

- Do some cool stuff

    Since we are using Github pages, our contents are provided by [Jekyll](http://jekyllrb.com/docs/home/). Each document is expected to be written in Markdown format. In addition, be aware the document should have [Front-matter](http://jekyllrb.com/docs/frontmatter/) on the top. For example, this document has the front-matter below. When you will add a new documnt,

    - Don't change line 2, `layout: docs`. The docs style is for all documents.
    - Write the document title
    - Write appropriate permalink, which starts with `/docs/`.
    - Write your github id (don't write @, which causes rendering error)

    In the document,     

    {% highlight yaml linenos %}
    ---
    layout: docs
    title: How to Contribute
    permalink: /docs/contribute/
    author: yokolet
    --- {% endhighlight %}


- Make a pull request

    Nothing new to most of you guys. :)

    Docs:
    [Sending The Pull Request](https://help.github.com/articles/using-pull-requests#sending-the-pull-request)


## What Contributions are welcome?

- Documents

    Documents, documents, and documents. Without documents, nothing happens.
We are eagerly awaiting douments from you.
Document list on the right is a sort of wishlist (at this moment).
If you give us one of those, that's fantastic.
Also, you may write a document not on the list, even of a new category.

    Although we don't set any deadline,
it's awesome we can get 20+ documents before the first chapter in Durham (at the end of Feburary, 2014).

    If you can't make by that time, don't worry.
We believe many ClojureBridge workshops will be organized all over the world for years.
Your document will be used at the next, or next of the next workshops.
We welcome new documents anytime.


- Suggestions

    We appreciate your suggestions about lab topics, a document structure,
or even about using Github pages.
Probably, you will notice many after the ClojureBridge workshop.
We think much of your input from the experience of the workshop.
For the suggestions, please open a new issue.


- Corrections

    Absolutely, welcome. Give us pull requests.
Even though it is small, correcting errors, confusing explanation, etc is important.


- Design Love

    Love, love, love! from your contributions in this area.
Sadly, a main author of this web site (@yokolet) is bad at it. sigh...
Somehow, she could set up the web site like this, she knows it just has minimum.


## When you want to say something about that document...

File an issue and mention github id of an author of the document,
so that the author recognizes a discussion has started about his/her document.
Also, don't forget to close the issue when the discussion ends.
