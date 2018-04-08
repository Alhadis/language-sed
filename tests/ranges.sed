#!/usr/bin/env gsed -f
3~4p
2{s/2/X/ ; p}
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
