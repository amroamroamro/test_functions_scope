%% create object

obj = mypkg.myclass();

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
assert(isequal(obj.method_function(), mypkg.myclass.m));
assert(isequal(obj.method2_function(), mypkg.myclass.m2));
assert(isequal(mypkg.myclass.static_function(), mypkg.myclass.s));
assert(isequal(obj.static_function(), mypkg.myclass.s));
assert(isequal(mypkg.myclass.static2_function(), mypkg.myclass.s2));
assert(isequal(obj.static2_function(), mypkg.myclass.s2));
err = false; try private_function(); catch, err = true; end, assert(err);

%% dispatch calls

% n, n->m, n->m->m2, n->m->s, n->m->so, n->m->s2, n->m->s2o,
% n->m2, n->m2->m, n->m2->s, n->m2->so, n->m2->s2, n->m2->s2o,
% n->s, n->so, n->s2, n->s2o
assert(isequal(obj.call(mypkg.myclass.n), mypkg.myclass.n));
assert(isequal(obj.call(mypkg.myclass.n, mypkg.myclass.m), mypkg.myclass.m));
assert(isequal(obj.call(mypkg.myclass.n, mypkg.myclass.m, mypkg.myclass.m2), mypkg.myclass.m2));
assert(isequal(obj.call(mypkg.myclass.n, mypkg.myclass.m, mypkg.myclass.s), mypkg.myclass.s));
assert(isequal(obj.call(mypkg.myclass.n, mypkg.myclass.m, mypkg.myclass.so), mypkg.myclass.s));
assert(isequal(obj.call(mypkg.myclass.n, mypkg.myclass.m, mypkg.myclass.s2), mypkg.myclass.s2));
assert(isequal(obj.call(mypkg.myclass.n, mypkg.myclass.m, mypkg.myclass.s2o), mypkg.myclass.s2));
assert(isequal(obj.call(mypkg.myclass.n, mypkg.myclass.m2), mypkg.myclass.m2));
assert(isequal(obj.call(mypkg.myclass.n, mypkg.myclass.m2, mypkg.myclass.m), mypkg.myclass.m));
assert(isequal(obj.call(mypkg.myclass.n, mypkg.myclass.m2, mypkg.myclass.s), mypkg.myclass.s));
assert(isequal(obj.call(mypkg.myclass.n, mypkg.myclass.m2, mypkg.myclass.so), mypkg.myclass.s));
assert(isequal(obj.call(mypkg.myclass.n, mypkg.myclass.m2, mypkg.myclass.s2), mypkg.myclass.s2));
assert(isequal(obj.call(mypkg.myclass.n, mypkg.myclass.m2, mypkg.myclass.s2o), mypkg.myclass.s2));
assert(isequal(obj.call(mypkg.myclass.n, mypkg.myclass.s), mypkg.myclass.s));
assert(isequal(obj.call(mypkg.myclass.n, mypkg.myclass.so), mypkg.myclass.s));
assert(isequal(obj.call(mypkg.myclass.n, mypkg.myclass.s2), mypkg.myclass.s2));
assert(isequal(obj.call(mypkg.myclass.n, mypkg.myclass.s2o), mypkg.myclass.s2));

% m, m->m2, m->m2->s, m->m2->so, m->m2->s2, m->m2->s2o,
% m->s, m->so, m->s2, m->s2o
assert(isequal(obj.call(mypkg.myclass.m), mypkg.myclass.m));
assert(isequal(obj.call(mypkg.myclass.m, mypkg.myclass.m2), mypkg.myclass.m2));
assert(isequal(obj.call(mypkg.myclass.m, mypkg.myclass.m2, mypkg.myclass.s), mypkg.myclass.s));
assert(isequal(obj.call(mypkg.myclass.m, mypkg.myclass.m2, mypkg.myclass.so), mypkg.myclass.s));
assert(isequal(obj.call(mypkg.myclass.m, mypkg.myclass.m2, mypkg.myclass.s2), mypkg.myclass.s2));
assert(isequal(obj.call(mypkg.myclass.m, mypkg.myclass.m2, mypkg.myclass.s2o), mypkg.myclass.s2));
assert(isequal(obj.call(mypkg.myclass.m, mypkg.myclass.s), mypkg.myclass.s));
assert(isequal(obj.call(mypkg.myclass.m, mypkg.myclass.so), mypkg.myclass.s));
assert(isequal(obj.call(mypkg.myclass.m, mypkg.myclass.s2), mypkg.myclass.s2));
assert(isequal(obj.call(mypkg.myclass.m, mypkg.myclass.s2o), mypkg.myclass.s2));

% m2, m2->m, m2->m->s, m2->m->so, m2->m->s2, m2->m->s2o,
% m2->s, m2->so, m2->s2, m2->s2o
assert(isequal(obj.call(mypkg.myclass.m2), mypkg.myclass.m2));
assert(isequal(obj.call(mypkg.myclass.m2, mypkg.myclass.m), mypkg.myclass.m));
assert(isequal(obj.call(mypkg.myclass.m2, mypkg.myclass.m, mypkg.myclass.s), mypkg.myclass.s));
assert(isequal(obj.call(mypkg.myclass.m2, mypkg.myclass.m, mypkg.myclass.so), mypkg.myclass.s));
assert(isequal(obj.call(mypkg.myclass.m2, mypkg.myclass.m, mypkg.myclass.s2), mypkg.myclass.s2));
assert(isequal(obj.call(mypkg.myclass.m2, mypkg.myclass.m, mypkg.myclass.s2o), mypkg.myclass.s2));
assert(isequal(obj.call(mypkg.myclass.m2, mypkg.myclass.s), mypkg.myclass.s));
assert(isequal(obj.call(mypkg.myclass.m2, mypkg.myclass.so), mypkg.myclass.s));
assert(isequal(obj.call(mypkg.myclass.m2, mypkg.myclass.s2), mypkg.myclass.s2));
assert(isequal(obj.call(mypkg.myclass.m2, mypkg.myclass.s2o), mypkg.myclass.s2));

% s, s->s2
assert(isequal(obj.call(mypkg.myclass.s), mypkg.myclass.s));
assert(isequal(obj.call(mypkg.myclass.s, mypkg.myclass.s2), mypkg.myclass.s2));

% so, so->s2
assert(isequal(obj.call(mypkg.myclass.so), mypkg.myclass.s));
assert(isequal(obj.call(mypkg.myclass.so, mypkg.myclass.s2), mypkg.myclass.s2));

% s2, s2->ss
assert(isequal(obj.call(mypkg.myclass.s2), mypkg.myclass.s2));
assert(isequal(obj.call(mypkg.myclass.s2, mypkg.myclass.s), mypkg.myclass.s));

% s2o, s2o->s
assert(isequal(obj.call(mypkg.myclass.s2o), mypkg.myclass.s2));
assert(isequal(obj.call(mypkg.myclass.s2o, mypkg.myclass.s), mypkg.myclass.s));
