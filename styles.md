---
title: Styles
layout: basic
description: >
    Development style guide for the Cristina and Zachary's wedding website.
---

Overview of the colors, fonts, and other styling properties used on the site.
{: .lead}

The site is built off of the [Bootstrap 3](http://getbootstrap.com/css/)
front-end library, which defines the basic
[typographic styles](http://getbootstrap.com/css/#type).

### Page contents

1.  [Colors](#colors)
2.  [Fonts](#fonts)

---

### Colors

Describes the color pallet for the site. Use
[Adobe Color CC](https://color.adobe.com/create/color-wheel/)
to build a new color pallet.

#### Pallet

Used as accent colors on the site.

<div class="row">
    <div class="col-sm-2">
        <div class="bg-color-1 fill-box"></div>
        <pre>color-1</pre>
    </div>
    <div class="col-sm-2">
        <div class="bg-color-2 fill-box"></div>
        <pre>color-2</pre>
    </div>
    <div class="col-sm-2">
        <div class="bg-color-3 fill-box"></div>
        <pre>color-3</pre>
    </div>
</div>

#### Grays

Used for basic background colors, and text colors.

<div class="row">
    <div class="col-sm-2">
        <div class="bg-gray-darkest fill-box"></div>
        <pre>gray-darkest</pre>
    </div>
    <div class="col-sm-2">
        <div class="bg-gray-darker fill-box"></div>
        <pre>gray-darker</pre>
    </div>
    <div class="col-sm-2">
        <div class="bg-gray-normal fill-box"></div>
        <pre>gray-normal</pre>
    </div>
    <div class="col-sm-2">
        <div class="bg-gray-light fill-box"></div>
        <pre>gray-light</pre>
    </div>
    <div class="col-sm-2">
        <div class="bg-gray-lighter fill-box"></div>
        <pre>gray-lighter</pre>
    </div>
    <div class="col-sm-2">
        <div class="bg-gray-lightest fill-box"></div>
        <pre>gray-lightest</pre>
    </div>
</div>

---

### Fonts

The site uses three font styles:

  * A _header font_, used for page headings.
  * Default _body font_, used for normal page text.
  * _Accent font_, used for stylistic text.

Use [Google Fonts](https://www.google.com/fonts) to find alternative fonts.
Headings should be _sans-serif_, whereas body should be _serif_.

#### Headers

Automatically set on heading tags, or by using the `text-header` class.
Currently uses the **[Lato](https://www.google.com/fonts/specimen/Lato)** font.

> The quick brown fox jumps over the lazy dog.
{: .text-header .text-large}

#### Body

Default font for the site, or set using the `text-body` class. Currently uses
the **[Roboto Slab](https://www.google.com/fonts/specimen/Roboto+Slab)** font.

> The quick brown fox jumps over the lazy dog.
{: .text-body .text-large}

#### Accent

Set explicitly using the `text-script` class. Currently uses the
**[Parisienne](https://www.google.com/fonts/specimen/Parisienne)** font.

> The quick brown fox jumps over the lazy dog.
{: .text-script .text-large}
