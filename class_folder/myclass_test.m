%% create object

obj = myclass();

% valid calls graph:
% ------------------
% n                 ==> [m, m2, s, so, s2, s2o; hmvo, hm2, hm2vo, hsv, hsvo, hs2v, hs2vo]
% m,hmvo            ==> [m2, s, so, s2, s2o; hm2, hm2vo, hsv, hsvo, hs2v, hs2vo]
% m2,hm2,hm2vo      ==> [m, s, so, s2, s2o, p; hmvo, hsv, hsvo, hs2v, hs2vo, hp]
% s,so,hsv,hsvo     ==> [s2; hs2v]
% s2,s2o,hs2v,hs2vo ==> [s, p; hsv, hp]
% p,hp              ==> [s, s2; hsv, hs2v]
%
% note: to avoid repetition, we skip cycles e.g: ...->{s,so,s2,s2o}->*

%% direct calls

% m, m2, s, so, s2, s2o
% [assert throws]: p
assert(isequal(obj.method_function(), myclass.m));
assert(isequal(obj.method2_function(), myclass.m2));
assert(isequal(myclass.static_function(), myclass.s));
assert(isequal(obj.static_function(), myclass.s));
assert(isequal(myclass.static2_function(), myclass.s2));
assert(isequal(obj.static2_function(), myclass.s2));
err = false; try private_function(); catch, err = true; end, assert(err);

%% dispatch calls

% n, n->m, n->m->m2, n->m->s, n->m->so, n->m->s2, n->m->s2o,
% n->m2, n->m2->m, n->m2->s, n->m2->so, n->m2->s2, n->m2->s2o,
% n->m2->p, n->m2->p->s, n->m2->p->s2,
% n->s, n->so, n->s2, n->s2o
assert(isequal(obj.call(myclass.n), myclass.n));
assert(isequal(obj.call(myclass.n, myclass.m), myclass.m));
assert(isequal(obj.call(myclass.n, myclass.m, myclass.m2), myclass.m2));
assert(isequal(obj.call(myclass.n, myclass.m, myclass.s), myclass.s));
assert(isequal(obj.call(myclass.n, myclass.m, myclass.so), myclass.s));
assert(isequal(obj.call(myclass.n, myclass.m, myclass.s2), myclass.s2));
assert(isequal(obj.call(myclass.n, myclass.m, myclass.s2o), myclass.s2));
assert(isequal(obj.call(myclass.n, myclass.m2), myclass.m2));
assert(isequal(obj.call(myclass.n, myclass.m2, myclass.m), myclass.m));
assert(isequal(obj.call(myclass.n, myclass.m2, myclass.s), myclass.s));
assert(isequal(obj.call(myclass.n, myclass.m2, myclass.so), myclass.s));
assert(isequal(obj.call(myclass.n, myclass.m2, myclass.s2), myclass.s2));
assert(isequal(obj.call(myclass.n, myclass.m2, myclass.s2o), myclass.s2));
assert(isequal(obj.call(myclass.n, myclass.m2, myclass.p), myclass.p));
assert(isequal(obj.call(myclass.n, myclass.m2, myclass.p, myclass.s), myclass.s));
assert(isequal(obj.call(myclass.n, myclass.m2, myclass.p, myclass.s2), myclass.s2));
assert(isequal(obj.call(myclass.n, myclass.s), myclass.s));
assert(isequal(obj.call(myclass.n, myclass.so), myclass.s));
assert(isequal(obj.call(myclass.n, myclass.s2), myclass.s2));
assert(isequal(obj.call(myclass.n, myclass.s2o), myclass.s2));

% m, m->m2, m->m2->s, m->m2->so, m->m2->s2, m->m2->s2o,
% m->m2->p, m->m2->p->s, m->m2->p->s2
% m->s, m->so, m->s2, m->s2o
assert(isequal(obj.call(myclass.m), myclass.m));
assert(isequal(obj.call(myclass.m, myclass.m2), myclass.m2));
assert(isequal(obj.call(myclass.m, myclass.m2, myclass.s), myclass.s));
assert(isequal(obj.call(myclass.m, myclass.m2, myclass.so), myclass.s));
assert(isequal(obj.call(myclass.m, myclass.m2, myclass.s2), myclass.s2));
assert(isequal(obj.call(myclass.m, myclass.m2, myclass.s2o), myclass.s2));
assert(isequal(obj.call(myclass.m, myclass.m2, myclass.p), myclass.p));
assert(isequal(obj.call(myclass.m, myclass.m2, myclass.p, myclass.s), myclass.s));
assert(isequal(obj.call(myclass.m, myclass.m2, myclass.p, myclass.s2), myclass.s2));
assert(isequal(obj.call(myclass.m, myclass.s), myclass.s));
assert(isequal(obj.call(myclass.m, myclass.so), myclass.s));
assert(isequal(obj.call(myclass.m, myclass.s2), myclass.s2));
assert(isequal(obj.call(myclass.m, myclass.s2o), myclass.s2));

% m2, m2->m, m2->m->s, m2->m->so, m2->m->s2, m2->m->s2o,
% m2->s, m2->so, m2->s2, m2->s2o,
% m2->p, m2->p->s, m2->p->s2
assert(isequal(obj.call(myclass.m2), myclass.m2));
assert(isequal(obj.call(myclass.m2, myclass.m), myclass.m));
assert(isequal(obj.call(myclass.m2, myclass.m, myclass.s), myclass.s));
assert(isequal(obj.call(myclass.m2, myclass.m, myclass.so), myclass.s));
assert(isequal(obj.call(myclass.m2, myclass.m, myclass.s2), myclass.s2));
assert(isequal(obj.call(myclass.m2, myclass.m, myclass.s2o), myclass.s2));
assert(isequal(obj.call(myclass.m2, myclass.s), myclass.s));
assert(isequal(obj.call(myclass.m2, myclass.so), myclass.s));
assert(isequal(obj.call(myclass.m2, myclass.s2), myclass.s2));
assert(isequal(obj.call(myclass.m2, myclass.s2o), myclass.s2));
assert(isequal(obj.call(myclass.m2, myclass.p), myclass.p));
assert(isequal(obj.call(myclass.m2, myclass.p, myclass.s), myclass.s));
assert(isequal(obj.call(myclass.m2, myclass.p, myclass.s2), myclass.s2));

% s, s->s2
assert(isequal(obj.call(myclass.s), myclass.s));
assert(isequal(obj.call(myclass.s, myclass.s2), myclass.s2));

% so, so->s2
assert(isequal(obj.call(myclass.so), myclass.s));
assert(isequal(obj.call(myclass.so, myclass.s2), myclass.s2));

% s2, s2->s, s2->p, s2->p->s, s2->p->s2
assert(isequal(obj.call(myclass.s2), myclass.s2));
assert(isequal(obj.call(myclass.s2, myclass.s), myclass.s));
assert(isequal(obj.call(myclass.s2, myclass.p), myclass.p));
assert(isequal(obj.call(myclass.s2, myclass.p, myclass.s), myclass.s));
assert(isequal(obj.call(myclass.s2, myclass.p, myclass.s2), myclass.s2));

% s2o, s2o->s, s2o->p, s2o->p->s, s2o->p->s2
assert(isequal(obj.call(myclass.s2o), myclass.s2));
assert(isequal(obj.call(myclass.s2o, myclass.s), myclass.s));
assert(isequal(obj.call(myclass.s2o, myclass.p), myclass.p));
assert(isequal(obj.call(myclass.s2o, myclass.p, myclass.s), myclass.s));
assert(isequal(obj.call(myclass.s2o, myclass.p, myclass.s2), myclass.s2));
