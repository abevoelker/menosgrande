What is menosgrande?
--------------------

menosgrande is a URL shortener. It uses some tricks such as IDN domains and 
Unicode paths to exploit the way that
[Twitter counts characters](http://dev.twitter.com/pages/counting_characters)
(spoiler: by normalized Unicode code points) in order to make extremely short
URLs.

Why use menosgrande?
--------------------

Use menosgrande when space is at a premium and you need to make the shortest
URL possible.  Alternatively, you could use menosgrande when you are bored
with those tired old base-62 ASCII URL shorteners and want to spice up
your life with some fun Unicode characters.

Why did you bother with this?
-----------------------------

This was more of a learning experience for me as this is my first Ruby on 
Rails application.  I am basically using it as a proof-of-concept for
employers that I have the competency to code Ruby on Rails, not that this
application is some amazing feat of engineering (I'm well aware it's a 
pretty simple application).

In addition, I agree with the
[common sentiment](http://www.joelonsoftware.com/articles/Unicode.html)
that programmers need to move beyond thinking of characters as raw bytes of
ASCII.  I'm hoping that this application can push that idea forward, in its
own, very small way, by making Unicode usage more public.

Why not use / Caveats
---------------------

Some applications still do not play nicely with Unicode, unfortunately. In the
worst case, the application might simply refuse to work with a menosgrande 
link, possibly by crashing or behaving strangely. A more mild annoyance is the
fact that Twitter will sometimes not make the full URL path (after the /)
hyperlinked, even though it is a valid
[IRI](http://www.ietf.org/rfc/rfc3987.txt).

Also, there is no guarantee users seeing the shortened link will see a pretty
grapheme like the [Unicode code chart](http://www.unicode.org/charts/) shows
for that codepoint.  This is dependent on what fonts are
installed on the end-user's PC.  This doesn't affect the actual shortening
process, as the user will simply see a rectangular box with the hex code value
of the Unicode code point if they don't have a font for it.  menosgrande
doesn't mind this, as the raw bytes are still passed to it correctly for
decoding. Twitter doesn't mind either, and will still treat it as a single
character, for the same reason.

Where can I learn more?
-----------------------

I did a
[short writeup](http://abevoelker.com/blog/2011/06/20/menosgrande-my-first-ruby-on-rails-app/)
on my blog about how I wrote this application, if you want to know more about
it.

