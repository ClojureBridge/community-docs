---
layout: docs
title: How to Contribute
permalink: /docs/contribute/
author: yokolet
---

The Community Docs site is powered by [Github Pages](http://pages.github.com/).
After pull requests are merged, the contents are updated automatically. Handy!

Please follow the steps below to start contributing to ClojureBridge:

Steps:

- Fork the repository
  - All documents are in the `gh-pages` branch of [ClojureBridge/community-docs](https://github.com/ClojureBridge/community-docs) repository.<br/><br/>
  
- File the issue
  - If it is a new document, let other people know you have started working on the document.
  Go to [CommunityDocs issues](https://github.com/ClojureBridge/community-docs/issues?page=1&state=open),
  and create a new issue. Write what document you are working on. Don't forget to close the issue
  when you finish writing up.<br/><br/>

- Edit existing or create new contents
  - Since we are using Github pages, our contents are provided by [Jekyll](http://jekyllrb.com/docs/home/). Currently, Github pages support HTML and Markdown formats (and textile, probably). Each document should have [Front-matter](http://jekyllrb.com/docs/frontmatter/) on the top. This is very important. Don't forget to add that. For example, this document has the front-matter below.
  
  {% highlight yaml linenos %}
  ---
  layout: docs
  title: How to Contribute
  permalink: /docs/contribute/
  level: 
  author: yokolet
  --- {% endhighlight %}
	
  - When you update existing documents, see the template documents under `docs/clojure` or `docs/clojure-script` directory. Those templates are written in Markdown format. If you prefer HTML, change the file extension from md to html. In the front-matter, set the `author:` attribute to your GitHub alias.

  - When you will create a new document, create a file under `docs/clojure` or `docs/clojure-script` directory. However, you may create a new subdirectory if appropriate. Currently, contents lists are created manually. Go to the `_data` directory and add a title and permalink. If you created a new subdirectory, add a new file under `_data`. Also, edit `_includes/content_list.html`<br/><br/>

    - `layout: docs`. The `docs` layout is for all documents. Don't change this.
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

    Add the difficulty level of the lab work: easy, intermediate, difficult. This will help attendees and coaches choose a good exercise considering their programming background. It might be fun to add "most difficult" labs for the coaches.

  - Syntax highlighter

    For HTML, and Markdown, the site is setup to use [Pygments](http://pygments.org/docs/) for syntax highlighter. Please look at the jekyll document, [Writing posts](http://jekyllrb.com/docs/posts/), for details. Alternatively, you can embed gist by gist tag. See "Gist" section of [Templates](http://jekyllrb.com/docs/templates/).

  - Running the Community Docs site locally

    1. Checkout the `gh-pages` branch in your `community-docs` directory
    2. Run `gem install bundler`
    3. Run `bundle install` <br/><br/>

  - Start the server
  
    - Run `jekyll serve --incremental --watch`. This will start the server running on port 4444. `--incremental` Enable incremental build making it very fast. `--watch` option reflects the changes immediately.
    - Open your browser and go to `http://localhost:4444/community-docs/`. <br/><br/>

  - Document examples

    * Markdown: `/docs/getting-started/helloworld.md` (Hello World of Getting Started)
    * HTML: `/index.html` ("Home" page)<br/><br/>

  - Send us a Pull Request

    - Nothing new to most of you guys. :) (but just in case - [Sending The Pull Request](https://help.github.com/articles/using-pull-requests#sending-the-pull-request))

## What Contributions are welcome?

- Documents

  - The current directory structure reflects our wishlist. If you can help with one of those, that's fantastic.
  - You may also add a document not on the list, even of in a new category that you feel would benefit our students or coaches.
  - We believe many ClojureBridge workshops will be organized all over the world for years to come, and we welcome new documents at anytime.<br/><br/>

- Suggestions

  - We appreciate your suggestions about lab topics, document structure, or even about using Github pages.
  - You will probably notice many gaps after attending ClojureBridge workshop.
  - Please help us improve by opening a new issue.<br/><br/>

- Corrections

  - Absolutely welcome. We welcome your pull requests.
  - Even small changes (correcting errors, clearing up confusing explanations, etc.) are important.<br/><br/>

- Design Love
  - LOVE! We would really appreciate contributions in this area.

## When you want to say something about a document...

File an issue and mention the github alias of an author of the document,
so that the author(s) know a discussion has started about their document.
Also, don't forget to close the issue when the discussion ends. Thanks!
