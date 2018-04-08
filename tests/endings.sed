#/usr/bin/env gsed -f
h
h;
h ;
h# foo
h # foo
{h}
{h } 
{ h } 

{h}# foo
{h} # foo
{h};
{h} ;
{;h;} 
{{h}}
{;{h};}

y/1/a/
y/1/a/;d
y/1/a/ ;d
{y/1/a/}
y/1/a/#foo
y/1/a/ #fo

s/1/a/
s/1/a/;d
s/1/a/ ;d
{s/1/a/}
s/1/a/#foo
s/1/a/ #fo

s/1/a/i ;
s/1/a/i #foo
{ s/1/a/i }

bx; :x
bx; :x;
bx; :x ;
bx; :x#foo
bx; :x #foo
{ bx; :x }

l
l;
l ;
l#foo
l #foo
{l}
{l }
l1
l1;
l1 ;
l1#foo
l1 #foo
{l1}
{l1 }
