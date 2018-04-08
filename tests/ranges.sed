#!/usr/bin/env gsed -f
3~4p
2{s/2/X/ ; p}

s/a[[:blank:]]*c/xyz/ g ;p

s aaa bbb g # Comment
s	aaa	bbb	g	# Comment
s/aaaa/bbbb/g    # Comment
s/aaaa/bbbb/g ;p # Comment
s/aaaa/bbbb/g;p# Comment

s# a[^a]a\#a\
aaa # b&b\#b\
bbb ##p Comment

s# a[^a]a\#a\
aaa # b&b\#b\
bbb #; p # Comment

s; a[^a]a\;a\
aaa ; b&b\;b\
bbb ;; p # Comment

{s} a[^a]a\}a\
aaa } b&b\}bb\
bbb }} p # Comment

s# a[^a]a\#a\
aaa # b&b\#b\
bbb # g # Comment

s; a[^a]a\;a\
aaa ; b&b\;b\
bbb ; g ; p # Comment

{s} a[^a]a\}a\
aaa } b&b\}bb\
bbb } g ; p } # Comment

y/a-z/x-y/
y/-bc/-yz/
y-abc-123-

y abc xyz ;p
y	abc	xyz	;p
y|abc\|123|aaa|
y/abc\/xyz/123/-

2a\
hello\
world

e echo foo\
bar; printf

Q 42

R/filename/

v 2.0.0

12 , 34 ! p

623 , /regexp/
/start/,/stop/ s/#.*//

6 , ~ 2 ! p

6,~2!p
6,

s/aaa/bbb/w filename
s/a|b|new \n li\[n\*e/xyz/
s/(aaa)\1(bbb)\{2,1\}/b\1bb/e echo;

# BRE examples
/abcdef/
/a*b/
/a\?b/
/a\+b\+/
/.*/
/.\+/
/^main.*(.*)/
/^#/
/\\$/
/\$/
/[a-zA-Z0-9]/
/[^ 	]\+/
/^\(.*\)\n\1$/
/.\{9\}A$/
/^.\{15\}A/

# ERE examples
/abc\?/
/c+/
/a{3,}/
/(abc){2,3}/
/(abc*)\1/
/a|b/
/[\*]/

# Extensions
s/\w/X/g
s/\W/X/g
s/\b/X/g
s/\B/x/g
s/\s//g
s/\t//
