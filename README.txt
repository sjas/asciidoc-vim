= Improved AsciiDoc syntax highlighting in VIM

Tweaked syntax file for AsciiDoc highlighting.

Code, colors and inspiration taken from Steve Losh's uber awesome badwolf theme.
Original AsciiDoc syntax file by Dag Wieers <dag@wieers.com>.
Which was further tweaked by Steve Francia, who gave it a proper vim directory
structure.

== Difference with upstream syntax file
While this syntax file was independently developed, it was later merged
with improved regular expressions taken from the upstream syntax file.

 - Bold is *bold*, Emphasize is _italic_
 - Document title stands out (in bold)
 - Titles are underlined
 - Better and more colors facilitate reading and editing
 - Links and email addresses are underlined
 - Admonitions look nicer

The reason why this syntax file looks better is because it does not stick
to the provided styles (that mostly maps to programming languages and
therefor is pretty limited).


== Installing the asciidoc.vim file
Use Vundle, the best plugin manager for vim. Seriously.


== Auto enabling syntax highlighting
1. Use modelines at the end of your file:

----
// vim: set syntax=asciidoc:
----

2. Use '.asc'  as file extension, instead of '.txt'.

3. Use '~/.vim/plugin/asciidoc_filetype.vim'.


== Testing VIM syntax files
This syntax file was made on a Mac. I am using ITERM2 with 256 colors as well
as MacVim. It does fine in both environments.

 1. Terminal
 2. Color terminal
 3. GUI

Each of these have different capabilities and therefore can have different
definitions. To test each of these on a capable terminal, try:

// this gives me just white on black:
 $ TERM=vt100 vim README.txt
// this is giving me many blinky-blink, it's unusable:
// it is also what happens if i use regular Terminal.app. ;)
 $ TERM=ansi vim README.txt
// this should be the equivalent to MacVim, which is fine here:
 $ gvim README.txt


== Known shortcomings
What does not work??
ANSI Terminal encoding currently not working. Will look into that if I ever
need it, see section before. 

Further there are a few quirks in the syntax files. Here is an overview:

Underlining titles does not work consistently??

There is no way that we can match the length of a title with the length of
the line under it. Because of that every line preceded by text could
ambigously be interpreted as either a title or the start of a block. 

 1. `= this will work'`

 2. `this will not be colored as expected`
    `~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`

The 'underline' in the second example will not be colored properly.
Use the first example style instead.

Some asciidoc syntax is not implemented??

Yes, certain newer syntax rules have not been implemented yet, as is the case
with the upstream version.

== Feedback
If you have fixes or improvements to the syntax file, fork the project and
send me a pull request.

// vim: set syntax=asciidoc:
