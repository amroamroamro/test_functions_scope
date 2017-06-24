%% create object

obj = mypkg.mysubpkg.myclass();

% valid calls graph:
% ------------------
% n                 ==> [m, m2, s, so, s2, s2o; hmvo, hm2, hm2vo, hsv, hsvo, hs2v, hs2vo]
% m,hmvo            ==> [m2, s, so, s2, s2o; hm2, hm2vo, hsv, hsvo, hs2v, hs2vo]
% m2,hm2,hm2vo      ==> [m, s, so, s2, s2o; hmvo, hsv, hsvo, hs2v, hs2vo]
% s,so,hsv,hsvo     ==> [s2; hs2v]
% s2,s2o,hs2v,hs2vo ==> [s; hsv]
% p,hp              ==> [s, s2; hsv, hs2v]
%
% note: to avoid repetition, we skip cycles e.g: ...->{s,so,s2,s2o}->*

%% direct calls

% m, m2, s, so, s2, s2o
% [assert throws]: p
assert(isequal(obj.method_function(), mypkg.mysubpkg.myclass.m));
assert(isequal(obj.method2_function(), mypkg.mysubpkg.myclass.m2));
assert(isequal(mypkg.mysubpkg.myclass.static_function(), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.static_function(), mypkg.mysubpkg.myclass.s));
assert(isequal(mypkg.mysubpkg.myclass.static2_function(), mypkg.mysubpkg.myclass.s2));
assert(isequal(obj.static2_function(), mypkg.mysubpkg.myclass.s2));
err = false; try private_function(); catch, err = true; end, assert(err);

%% dispatch calls

% n, n->m, n->m->m2, n->m->s, n->m->so, n->m->s2, n->m->s2o,
% n->m2, n->m2->m, n->m2->s, n->m2->so, n->m2->s2, n->m2->s2o,
% n->s, n->so, n->s2, n->s2o
assert(isequal(obj.call(mypkg.mysubpkg.myclass.n), mypkg.mysubpkg.myclass.n));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.n, mypkg.mysubpkg.myclass.m), mypkg.mysubpkg.myclass.m));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.n, mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.m2), mypkg.mysubpkg.myclass.m2));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.n, mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.n, mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.so), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.n, mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.n, mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.s2o), mypkg.mysubpkg.myclass.s2));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.n, mypkg.mysubpkg.myclass.m2), mypkg.mysubpkg.myclass.m2));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.n, mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.m), mypkg.mysubpkg.myclass.m));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.n, mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.n, mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.so), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.n, mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.n, mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.s2o), mypkg.mysubpkg.myclass.s2));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.n, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.n, mypkg.mysubpkg.myclass.so), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.n, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.n, mypkg.mysubpkg.myclass.s2o), mypkg.mysubpkg.myclass.s2));

% m, m->m2, m->m2->s, m->m2->so, m->m2->s2, m->m2->s2o,
% m->s, m->so, m->s2, m->s2o
assert(isequal(obj.call(mypkg.mysubpkg.myclass.m), mypkg.mysubpkg.myclass.m));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.m2), mypkg.mysubpkg.myclass.m2));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.so), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.s2o), mypkg.mysubpkg.myclass.s2));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.so), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.s2o), mypkg.mysubpkg.myclass.s2));

% m2, m2->m, m2->m->s, m2->m->so, m2->m->s2, m2->m->s2o,
% m2->s, m2->so, m2->s2, m2->s2o
assert(isequal(obj.call(mypkg.mysubpkg.myclass.m2), mypkg.mysubpkg.myclass.m2));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.m), mypkg.mysubpkg.myclass.m));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.so), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.s2o), mypkg.mysubpkg.myclass.s2));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.so), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.s2o), mypkg.mysubpkg.myclass.s2));

% s, s->s2
assert(isequal(obj.call(mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.s, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));

% so, so->s2
assert(isequal(obj.call(mypkg.mysubpkg.myclass.so), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.so, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));

% s2, s2->s
assert(isequal(obj.call(mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.s2, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));

% s2o, s2o->s
assert(isequal(obj.call(mypkg.mysubpkg.myclass.s2o), mypkg.mysubpkg.myclass.s2));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.s2o, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
