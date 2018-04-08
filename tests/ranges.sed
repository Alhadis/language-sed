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
