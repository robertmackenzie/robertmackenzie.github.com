---
layout: post 
title: Diagonal corners in CSS and SCSS
strapline: Because reasons
section: posts
published: true
---

Why on the 'tubes would you want diagonal corners? For me, they are a bit different; quirky, even. I like them. They remind me of shows like Battlestar Galactica, where the corners of all the documents are cut off to form diagonals (search for Battlestar Galactica paper on Google). They can also help with creating other, more complex CSS shapes. Anyway, I'll explain the fundamental technique, then demonstrate how to do a tab and then a box, before finally tidying the latter example into a SCSS mixin for easy reuse and maintainability. 

***

The fundamental bit: border crossings
-------------------------------------

The basis of the whole technique comes from what is rendered in the browser when two large borders meet in CSS.

<style>
  .border-crossing {
    margin: auto;
    background-color: blue;
    height: 200px; width: 250px;
    border-right: 28px solid red;
    border-bottom: 28px solid yellow;
  }
</style>

<div class='border-crossing'>
  This is some content.
</div>

See in the bottom right corner how the two borders meet to form a diagonal line? It is that line we will be using by setting the div to have a height of 0px, setting the right-hand border to be transparent, and playing with the text using line-height or padding until it sits right.

Here is the CSS so far (the element is a div with class `border-crossing`):

{% highlight css %}
  .border-crossing {
    margin: auto;
    background-color: blue;
    height: 200px; width: 250px;
    border-right: 28px solid red;
    border-bottom: 28px solid yellow;
  }
{% endhighlight %}

If I now 'hide' the right hand border by setting it to `transparent`, remove the background color, and set the div to have no height, like so:

{% highlight css %}
  .border-crossing {
    margin: auto;
    height: 0px; width: 250px;
    border-right: 28px solid transparent;
    border-bottom: 28px solid yellow;
  }
{% endhighlight %}

You end up with this.

<style>
  .border-crossing-2 {
    margin: auto;
    height: 0px; width: 250px;
    border-right: 28px solid transparent;
    border-bottom: 28px solid yellow;
  }
</style>

<div class='border-crossing-2'>
  This is some content.
</div>

If you do plan to fill the div with content like I've been doing here, you'll want to remove the width. However, watch what happens when I do.

<style>
  .border-crossing-3 {
    margin: auto;
    height: 0px;
    border-right: 28px solid transparent;
    border-bottom: 28px solid yellow;
  }
</style>

<div class='border-crossing-3'>
  This is some content.
</div>

As a `block` element, it fills the space it is given. Try using `display: inline-block` instead, like so:

{% highlight css %}
  .border-crossing-4 {
    margin: auto;
    height: 0px;
    border-right: 28px solid transparent;
    border-bottom: 28px solid yellow;
    display: inline-block;
  }
{% endhighlight %}

<style>
  .border-crossing-4 {
    margin: auto;
    height: 0px;
    border-right: 28px solid transparent;
    border-bottom: 28px solid yellow;
    display: inline-block;
  }
</style>

<div class='border-crossing-4'>
  This is some content.
</div>

This technique can be applied in many ways. I'll demonstrate another version of the tab I've done here, and then a box with all the corners cut away to diagonals.

***

Tabs
----

What if you want a tab with some content and both the top-right and top-left corners cut away. Try this:

<style>
  .diagonal-corners-tab {
    height: 0px;
    border-right: 28px solid transparent;
    border-left: 28px solid transparent;
    border-bottom: 28px solid #073642;
    padding: 0 5px 5px 5px;
    font-style: normal;
    display: inline-block;
  }
</style>

<div class='diagonal-corners-tab'>
This is some content
</div>

{% highlight css %}
  .diagonal-corners-tab {
    height: 0px;
    border-right: 28px solid transparent;
    border-left: 28px solid transparent;
    border-bottom: 28px solid #073642;
    padding: 0 5px 5px 5px;
    font-style: normal;
    display: inline-block;
  }
{% endhighlight %}

{% highlight html %}
<div class='diagonal-corners-tab'>
  This is some content
</div>
{% endhighlight %}

***

Boxes
-----

That's all well and good if you want a tab, but what about a box with existing content? Without adding additional markup to the page, or using images, the easiest way I could find is to use CSS `:before` and `:after` pseudo selectors.

<style>
  .diagonal-corners {
    height: 200px; width: 200px;
    background-color: #073642;
    padding: 12px;
    position:relative;
    display: inline-block;
    margin: 28px 0;
  } 

  .diagonal-corners:after {
    content: "";
    position:absolute; 
    z-index: -1;
    border-right: 28px solid transparent;
    border-left: 28px solid transparent;
    border-top: 28px solid #073642;
    left:-28px;
    right:-28px;
    bottom:-28px;
    margin-left: 28px;
    margin-right: 28px;
  }

  .diagonal-corners:before {
    content: "";
    position:absolute; 
    z-index: -1;
    border-right: 28px solid transparent;
    border-left: 28px solid transparent;
    border-bottom: 28px solid #073642;
    top:-28px;
    left:-28px;
    right:-28px;
    margin-left: 28px;
    margin-right: 28px;
  }
</style>

<div class='diagonal-corners'>
  This is some content.
</div>

{% highlight css linenos %}
  .diagonal-corners {
    height: 200px; width: 200px;
    background-color: #073642;
    padding: 12px;
    position:relative;
    display: inline-block;
    margin: 28px 0;
  } 

  .diagonal-corners:after {
    content: "";
    position:absolute; 
    z-index: -1;
    border-right: 28px solid transparent;
    border-left: 28px solid transparent;
    border-top: 28px solid #073642;
    left:-28px;
    right:-28px;
    bottom:-28px;
    margin-left: 28px;
    margin-right: 28px;
  }

  .diagonal-corners:before {
    content: "";
    position:absolute; 
    z-index: -1;
    border-right: 28px solid transparent;
    border-left: 28px solid transparent;
    border-bottom: 28px solid #073642;
    top:-28px;
    left:-28px;
    right:-28px;
    margin-left: 28px;
    margin-right: 28px;
  }
{% endhighlight %}

{% highlight html %}
<div class='diagonal-corners'>
  This is some content.
</div>
{% endhighlight %}

I attempted to just use one pseudo selector, but was unable to achieve the effect without both. Unfortunately, this means the CSS is starting to get a bit verbose. Worse, to make adjustments to the size of the border, you are looking at changing 17 values! There might be a cleaner way of doing this in just CSS, but for something like this I turn to SCSS mixins.

***

Taking advantage of SCSS Mixins
-------------------------------

SCSS or SASS (Syntactically Awesome StyleSheets) is a fantastic abstraction for CSS which allows you to use things like variables and functions (called mixins) which are then compiled into optimised CSS for rendering by the browser.

A mixin for the last technique I demonstrated would look a bit like this:

> Note: I'm having to use \[AT\] instead of @ in the following example. Looks like Pygments (my syntax highlighter) doesn't always like @ characters, even if escaped.

{% highlight scss %}
  [AT]mixin diagonals($size: 28px, $border-color: #073642) {
    position:relative;
    display: inline-block;
    margin: $size 0;

    &:after {
      content: "";
      position:absolute; 
      z-index: -1;
      border-right: $size solid transparent;
      border-left: $size solid transparent;
      border-top: $size solid $border-color;
      left:-$size;
      right:-$size;
      bottom:-$size;
      margin-left: $size;
      margin-right: $size;
    }

    &:before {
      content: "";
      position:absolute; 
      z-index: -1;
      border-right: $size solid transparent;
      border-left: $size solid transparent;
      border-bottom: $size solid $border-color;
      top:-$size;
      left:-$size;
      right:-$size;
      margin-left: $size;
      margin-right: $size;
    }

  }
{% endhighlight %}

To apply the technique, you then only need the one tiny snippet of SCSS!

{% highlight scss %}
  .sass-diagonals {
    @include diagonals();
  }
{% endhighlight %}

Add a bit of padding and a background color to the div (which for convenience I've just put inline) and voila.

<div class='sass-diagonals' style='padding: 12px; background-color: #073642'>
  This is some content.
</div>

***

Now you can be cool too!
------------------------

Like I said, there isn't any real reason for diagonal corners, but if you do want to use them, now you know how. If there is a more elegant way to do any of this, please email me: robertmackenzie\[ at \]gmail.com.
