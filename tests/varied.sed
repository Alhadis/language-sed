#!/usr/bin/env gsed -f
3~4p
2{s/2/X/ ; p}

y/a;c/x;z/; # Comment
y/a-z/x-y/

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

/^.*%%b/ {
  # Decimal to binary via analog form
  s/^\([^\n]*\)/-&;9876543210aaaaaaaaa/
  :d2bloop1
  s/\(a*\)-\(.\)\([^;]*;[0-9]*\2.\{9\}\(a*\)\)/\1\1\1\1\1\1\1\1\1\1\4-\3/
  t d2bloop1
  s/-;9876543210aaaaaaaaa/;a01!/
  :d2bloop2
  s/\(a*\)\1\(a\{0,1\}\)\(;\2.\(.\)[^!]*!\)/\1\3\4/
  /^a/b d2bloop2
  s/[^!]*!//
}

/^.*%%d/ {
  # Binary to decimal via analog form
  s/^\([^\n]*\)/-&;10a/
  :b2dloop1
  s/\(a*\)-\(.\)\([^;]*;[0-9]*\2.\(a*\)\)/\1\1\4-\3/
  t b2dloop1
  s/-;10a/;aaaaaaaaa0123456789!/
  :b2dloop2
  s/\(a*\)\1\1\1\1\1\1\1\1\1\(a\{0,9\}\)\(;\2.\{9\}\(.\)[^!]*!\)/\1\3\4/
  /^a/b b2dloop2
  s/[^!]*!//
}

/^.*%%&/ {
  # Binary AND
  s/\([^\n]*\)\n\([^\n]*\)/-\1-\2-111 01000/
  :andloop
  s/\([^-]*\)-\([^-]*\)\([^-]\)-\([^-]*\)\([^-]\)-\([01 ]*\3\5\([01]\)\)/\7\1-\2-\4-\6/
  t andloop
  s/^0*\([^-]*\)-[^\n]*/\1/
  s/^\n/0&/
}

/^.*%%^/ {
  # Binary XOR
  s/\([^\n]*\)\n\([^\n]*\)/-\1-\2-000 01101/
  b orloop
}

/^.*%%|/ {
  # Binary OR
  s/\([^\n]*\)\n\([^\n]*\)/-\1-\2-000 10111/
  :orloop
  s/\([^-]*\)-\([^-]*\)\([^-]\)-\([^-]*\)\([^-]\)-\([01 ]*\3\5\([01]\)\)/\7\1-\2-\4-\6/
  t orloop
  s/\([^-]*\)-\([^-]*\)-\([^-]*\)-[^\n]*/\2\3\1/
}

/^.*%%~/ {
  # Binary NOT
  s/^\(.\)\([^\n]*\n\)/\1-010-\2/
  :notloop
  s/\(.\)-0\{0,1\}\1\(.\)0\{0,1\}-\([01\n]\)/\2\3-010-/
  t notloop

  # If result is 00001..., \3 does not match (it looks for -10) and we just
  # remove the table and leading zeros.  If result is 0000...0, \3 matches
  # (it looks for -0), \4 is a zero and we leave a lone zero as top of the
  # stack.

  s/0*\(1\{0,1\}\)\([^-]*\)-\(\1\(0\)\)\{0,1\}[^-]*-/\4\1\2/
}

/^.*%%</ {
  # Left shift, convert to analog and add a binary digit for each analog digit
  s/^\([^\n]*\)/-&;9876543210aaaaaaaaa/
  :lshloop1
  s/\(a*\)-\(.\)\([^;]*;[0-9]*\2.\{9\}\(a*\)\)/\1\1\1\1\1\1\1\1\1\1\4-\3/
  t lshloop1
  s/^\(a*\)-;9876543210aaaaaaaaa\n\([^\n]*\)/\2\1/
  s/a/0/g
}

/^.*%%>/ {
  # Right shift, convert to analog and remove a binary digit for each analog digit
  s/^\([^\n]*\)/-&;9876543210aaaaaaaaa/
  :rshloop1
  s/\(a*\)-\(.\)\([^;]*;[0-9]*\2.\{9\}\(a*\)\)/\1\1\1\1\1\1\1\1\1\1\4-\3/
  t rshloop1
  s/^\(a*\)-;9876543210aaaaaaaaa\n\([^\n]*\)/\2\1/
  :rshloop2
  s/.a//
  s/^aa*/0/
  /a\n/b rshloop2
}


s/%%./%%/
tcmd
