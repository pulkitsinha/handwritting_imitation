a = randi(10,[1,20]);
[b,m1,n1] = unique(a,'first');
[c1,d1] =sort(m1);
b = b(d1);