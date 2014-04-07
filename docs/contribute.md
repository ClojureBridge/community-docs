---
layout: docs
title: How to Contribute
permalink: /docs/contribute/
author: yokolet
---

This web site is [Github Pages](http://pages.github.com/).
Right after your pull request is merged, the contents will be updated. Handy!
But we need to follow some manners of Github pages to make that happen.
Below are simplified explanations of Github pages and our specific rules.
Please read before you start working. It won't take long. The rules are simple.

Steps:

- Fork the repository

    The pages are in `gh-pages` branch of [ClojureBridge/community-docs](https://github.com/ClojureBridge/community-docs) repository. The branch name expresses it is Github pages.

- File the issue

    If it is a new document, let other people know you have started working on some document.
    Go to [CommunityDocs issues](https://github.com/ClojureBridge/community-docs/issues?page=1&state=open), and create a new issue. Write what document you are working on.
    Don't forget to close the issue when you finish writing up.

- Edit existing or create new contents

    Since we are using Github pages, our contents are provided by [Jekyll](http://jekyllrb.com/docs/home/). Currently, Github pages support HTML and Markdown formats (and textile, probably). Each document should have [Front-matter](http://jekyllrb.com/docs/frontmatter/) on the top. This is very important. Don't forget to add that. For example, this document has the front-matter below.

    When you write contents listed on the right, see the template documents under docs/clojure or docs/clojure-script directory. Those templates are written in Markdown format. If you prefer HTML, change the file extension from md to html. In the front-matter, write your github id on the right of `author:`.

    When you will create a new document, create a file under `docs/clojure` or `docs/clojure-script` directory. However, you may create a new subdirectory if you think the document is not of those. Currently, contents lists are manually created. Go to _data directory and add title and permalink. If you created a new subdirectory, add a new file under _data. Also, edit _includes/content_list.html<br/><br/>


    - `layout: docs`. The `docs` layout is for all documents. Don't change.
    - `title: something` The document title.
    - `permalink: somelink` This document's relative URL
    - `level: easy` The easiness of the lab work. One of easy, intermediate, difficult.
    - `author: github-id` Write your github id (don't write @, which causes a rendering error)


    {% highlight yaml linenos %}
    ---
    layout: docs
    title: How to Contribute
    permalink: /docs/contribute/
    level: 
    author: yokolet
    --- {% endhighlight %}

- Additional Info

  - What to write

    These documents provide lab exercises or labwork for ClojureBridge attendees. They will have coaches who can help, so write more examples rather than explaining it for attendees. Then, write advice for coaches on what they can teach about the examples.

    Add the difficulty level of the lab work: easy, intermediate, difficult. This will help attendees and coaches choose a good exercise considering their programming background. It might be fun to add "most difficult" lab works mainly for coaches.

  - Syntax highlighter

    For HTML, and Markdown, the site is setup to use [Pygments](http://pygments.org/docs/) for syntax highlighter. Please look at jekyll document, [Writing posts](http://jekyllrb.com/docs/posts/), for details. Alternatively, you can embed gist by gist tag. See "Gist" section of [Templates](http://jekyllrb.com/docs/templates/).

  - Setup test environment on your computer

    1. Install Ruby and Python
    2. Install Pygments (http://pygments.org/docs/installation/)
    3. Install bundler gem to your Ruby by `gem install bundler`
    4. Install some gems by `bundle install` at this project top directory<br/><br/>

  - Run test server

    On the project top directory, type `jekyll serve --watch`. The test server start running at port 4444. Go to `http://localhost:4444/community-docs/`. `--watch` option reflects the changes immediately.

  - Document examples

    * Markdown: `/docs/getting-started/helloworld.md` (Hello World of Getting Started)
    * HTML: `/index.html` ("Home" page)<br/><br/>

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
it's awesome we can get 20+ documents before the first chapter in Durham (at the end of February, 2014).

    If you can't make by that time, don't worry.
We believe many ClojureBridge workshops will be organized all over the world for years.
Your document will be used in upcoming workshops.
We welcome new documents anytime.


- Suggestions

    We appreciate your suggestions about lab topics, document structure,
or even about using Github pages.
You will probably notice many gaps after a ClojureBridge workshop.
We think much of your input from the experience of the workshop.
For suggestions, please open a new issue.


- Corrections

    Absolutely welcome. Give us pull requests.
Even small changes (correcting errors, clearing up confusing explanations, etc.) are important.


- Design Love

    LOVE! <3, <3, from your contributions in this area.
Sadly, a main author of this web site (@yokolet) is bad at it. sigh...
Somehow, she could set up the web site like this, even if it's just the basics.


## When you want to say something about that document...

File an issue and mention the github id of an author of the document,
so that the author knows a discussion has started about his/her document.
Also, don't forget to close the issue when the discussion ends.
