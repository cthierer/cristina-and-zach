Cristina & Zach's wedding website
=================================

A custom, [Jekyll](http://jekyllrb.com/)-based wedding website.


Site overview
-------------

The site design and functionality is built using custom styles and scripts on
top of the [Bootstrap 3](https://getbootstrap.com) front-end library.

Content on the site is bilingual, supporting both English and Spanish content;
English content is served out of the root directory (`/`), and Spanish content
is served from the `/es/` directory. By default, content is assumed to be in
English, but can be overridden by setting the `lang` attribute in a page's
frontmatter. Generic content (labels, metadata, etc.) and the associated
translations are defined in the `_data/contents.yml` file.

Site navigation is defined in the `_data/navigation.yml` file.

### Layouts  

* `default.html`: defines the HTML document, and wraps the page content in the
  site header and footer.
* `basic.html`: lays out a simple page, rendering the title of the page and its
  content.
* `article.html`: extends the basic page template, adding additional navigation
  such as breadcrumbs.
* `section.html`: a section landing page, which renders multiple documents from
  a collection onto a single page.
* `section-index.html`: a simpler section landing page, which renders links to
  one or more documents from a collection on a single page.
* `landing.html`: a landing page, featuring a large banner that stretches to
  cover the full screen.

### Collections

* "our-story": background content.
* "people": people involved with the wedding.
* "registries": links to store gift registries.
* "wedding": wedding day specifics.


Deployment
----------

Once built, the `_site` directory can be uploaded to any web server and stored
as static assets.

The site is also designed to be served from
[Netlify](https://www.netlify.com/).


Configuration
-------------

Set the `JEKYLL_ENV` environment variable to the appropriate environment:
  - "production"
  - "development"

The default configuration file, `_config.yml` includes production-safe
configurations. There are environment-specific configurations (listed below),
which are intended to be used in conjunction with the production configuration.

For example, on the development environment:

```
JEKYLL_ENV=development jekyll build --config=_config.yml,_.config-dev.yml
```

File                | Environment   | Notes
--------------------|---------------|------------------------------------------
`_config-dev.yml`   | Development   | Publishes unpublished content.
`_config-local.yml` | Local/Vagrant | Publishes unpublished content.


Development environment
-----------------------

The package includes a Vagrant configuration, which stands up an Ubuntu
instance and provisions it with the necessary tools to build Jekyll sites.
This is necessary on environments that do not support Jekyll natively, such as
Windows.

The `Vagrantfile` file defines the box configuration, and the `_provision`
directory includes the provisioning script.

### Dependencies

* [VirtualBox](https://www.virtualbox.org/)
* [Vagrant](https://www.vagrantup.com/)

### Installation

1.  Initialize the Vagrant machine: `vagrant up`
2.  SSH into the guest machine: `vagrant ssh`
3.  Install bundler: `gem install bundler`
4.  Navigate to the project directory: `cd /vagrant`
5.  Install dependencies: `bundle install`


License
-------

Source code and styles are licensed under the MIT license (see LICENSE file
in project root). The developer retains exclusive ownership over the content
and images included on the site.
