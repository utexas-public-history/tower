## Behind the Tower

_Behind the Tower: New Histories of the UT Tower Shooting_ is a public history of the mass shooting that Charles Whitman carried out at UT Austin on August 1, 1966, the collective work of eleven graduate students and one History professor at The University of Texas at Austin.

It was published in July 2016 to mark the 50th anniversary of the event.

The site was built using the [Jekyll static-site generator][jekyll] with some small customizations and is hosted using [GitHub Pages][gh-pages].

### Getting Started

Before starting to work with the project, you will need to [install Jekyll][jekyll-installation] and [clone][github-clone] the site’s code [repository][repo] from GitHub.

Once you have the source code on your system and Jekyll installed, you should be able to run the command `jekyll serve --no-watch` and visit <http://localhost:4000> in a web browser to see your local copy of the website ready to edit.

There is a list of links at the end of this document that provide additional context and in-depth instruction on the techniques used to create and maintain this site.

### Organization

The source code to be processed by Jekyll in building the site is stored on the `master` branch of the git repository. There is also a `development` branch where new work can be done without disturbing the contents of the `master` branch if desired.

The git repository has a branch called `gh-pages` that was created as an orphan branch to host the generated production code for the website.

The source text for essays is stored in the `_posts` directory. Posts are named according to the naming convention of a `YYYY-mm-dd` formatted date stamp for the date the post was created followed by the number it should receive in the table of contents and some descriptive text identifying the author and title. The order in which posts appear on the site is determined by the way these filenames sort alphabetically, so these naming conventions will need to change in the future if a different approach to ordering the posts becomes necessary.

Images referenced in posts are stored in `images/posts/lastname` where `lastname` is the name of the author of the post in which the image appears. When the same author is responsible for multiple posts, their images are all in the same directory. This organization is only a convention for the sake of organization; image files can be stored anywhere and referenced in the posts with their URL if desired.

### Hosting and Deployment

The production version of the site is hosted at <http://behindthetower.org> using the custom domain option for hosting project pages on GitHub Pages.

To build a new version of the site, run the command `git checkout master` to check out the `master` branch and then run the command `jekyll build`. The current version of the site’s code will now be in the `_site` directory. Then run the command `git checkout gh-pages` to check out the branch that holds the production code and run the command `cp -R _site/* .` to copy all of the contents of the `_site` directory up to the project’s root directory. Finally, commit these changes with `git commit` and use `git push` to publish your update to GitHub pages.

### Editing

The posts are primarily formatted with Markdown with some HTML where necessary for embedded videos and other special content.

Some include files are used to remove repetitive HTML wrappers from the posts themselves. The main body content of a post is preceded by the include `{% include post/post_opening.html %}` and followed by the include `{% include post/post_closing.html %}`. The sources listing at the bottom of posts (when appropriate) is preceded by the include `{% include post/sources_opening.html %}` and followed by the include `{% include post/sources_closing.html %}`.

Some (optional) convenience plugins have been included to cut down on repetition in defining common page elements. Their definitions can be found in `_plugins/tags.rb`. The HTML generated by these plugins can also simply be written directly into the Markdown posts if preferred.

Posts are preceded by some [YAML-formatted frontmatter][yaml] settings following Jekyll’s convention. There are custom options used on this site that are not defined by Jekyll:

- `og_article`: This option should be set to `true` on individual posts so that they will receive the appropriate OpenGraph tags (important meta information Facebook and other services will use when posts are shared) in their headers when output.
- `banner`: This options should be set to the URL for an image to be used as the background in the title banner section at the top of the post layout when appropriate.

### Helpful Links

- [Building a static website with Jekyll and GitHub Pages][proghist-jekyll]: A start-to-finish tutorial from _The Programming Historian_ about setting up a Jekyll site on GitHub Pages
- [Getting Started with Markdown][proghist-markdown]: A short introduction from _The Programming Historian_ to formatting text with Markdown
- [An Introduction to Version Control Using GitHub Desktop][proghist-vc]: An explanation of basic version control concepts from _The Programming Historian_
- [Markdown Syntax][md-syntax]: The official Markdown syntax reference from John Gruber
- [Creating Project Pages manually][gh-pages-docs]: Documentation on from Github for setting up a git repo to support hosting a project page alongside source branches.


[jekyll]: http://jekyllrb.com
[gh-pages]: https://pages.github.com
[jekyll-installation]: https://jekyllrb.com/docs/installation/
[github-clone]: https://help.github.com/articles/cloning-a-repository/
[repo]: https://github.com/utexas-public-history/tower
[yaml]: https://jekyllrb.com/docs/frontmatter/
[proghist-jekyll]: http://programminghistorian.org/lessons/building-static-sites-with-jekyll-github-pages
[proghist-markdown]: http://programminghistorian.org/lessons/getting-started-with-markdown
[proghist-vc]: http://programminghistorian.org/lessons/getting-started-with-github-desktop
[md-syntax]: http://daringfireball.net/projects/markdown/syntax
[gh-pages-docs]: https://help.github.com/articles/creating-project-pages-manually/
