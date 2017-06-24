%% create object

obj = mypkg.mysubpkg.myclass();

% valid calls graph:
% ------------------
% n,hn                       ==> [m, m2, s, so, s2, s2o, l, p; hm, hmo, hmvo, hm2, hm2o, hm2vo, hs, hsv, hso, hsvo, hs2, hs2v, hs2o, hs2vo, hl, hp]
% m,hm,hmo,hmvo              ==> [m2, s, so, s2, s2o, l, p; hm2, hm2o, hm2vo, hs, hsv, hso, hsvo, hs2, hs2v, hs2o, hs2vo, hl, hp]
% m2,hm2,hm2o,hm2vo          ==> [m, s, so, s2, s2o, p; hmo, hmvo, hs, hsv, hso, hsvo, hs2, hs2v, hs2o, hs2vo, hp]
% s,so,hs,hsv,hso,hsvo       ==> [s2, l, p; hs2, hs2v, hl, hp]
% s2,s2o,hs2,hs2v,hs2o,hs2vo ==> [s, p; hs, hsv, hp]
% l,hl                       ==> [s, s2, p; hs, hsv, hs2, hs2v, hp]
% p,hp                       ==> [s, s2; hs, hsv, hs2, hs2v]
%
% note: to avoid repetition, we skip cycles e.g: ...->{s,so,s2,s2o}->*

%% direct calls

% m, m2, s, so, s2, s2o
% [assert throws]: l, p
assert(isequal(obj.method_function(), mypkg.mysubpkg.myclass.m));
assert(isequal(obj.method2_function(), mypkg.mysubpkg.myclass.m2));
assert(isequal(mypkg.mysubpkg.myclass.static_function(), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.static_function(), mypkg.mysubpkg.myclass.s));
assert(isequal(mypkg.mysubpkg.myclass.static2_function(), mypkg.mysubpkg.myclass.s2));
assert(isequal(obj.static2_function(), mypkg.mysubpkg.myclass.s2));
err = false; try local_function(); catch, err = true; end, assert(err);
err = false; try private_function(); catch, err = true; end, assert(err);

%% dispatch calls

% n, n->m, n->m->m2, n->m->s, n->m->so, n->m->s2, n->m->s2o,
% n->m->l, n->m->l->s, n->m->l->s2, n->m->l->p, n->m->l->p->s, n->m->l->p->s2,
% n->m->p, n->m->p->s, n->m->p->s2,
% n->m2, n->m2->m, n->m2->s, n->m2->so, n->m2->s2, n->m2->s2o,
% n->m2->p, n->m2->p->s, n->m2->p->s2,
% n->s, n->so, n->s2, n->s2o,
% n->l, n->l->s, n->l->s2, n->l->p, n->l->p->s, n->l->p->s2,
% n->p, n->p->s, n->p->s2
assert(isequal(obj.call(mypkg.mysubpkg.myclass.n), mypkg.mysubpkg.myclass.n));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.n, mypkg.mysubpkg.myclass.m), mypkg.mysubpkg.myclass.m));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.n, mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.m2), mypkg.mysubpkg.myclass.m2));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.n, mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.n, mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.so), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.n, mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.n, mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.s2o), mypkg.mysubpkg.myclass.s2));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.n, mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.l), mypkg.mysubpkg.myclass.l));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.n, mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.n, mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.n, mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.n, mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.n, mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.n, mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.n, mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.n, mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.n, mypkg.mysubpkg.myclass.m2), mypkg.mysubpkg.myclass.m2));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.n, mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.m), mypkg.mysubpkg.myclass.m));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.n, mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.n, mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.so), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.n, mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.n, mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.s2o), mypkg.mysubpkg.myclass.s2));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.n, mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.n, mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.n, mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.n, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.n, mypkg.mysubpkg.myclass.so), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.n, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.n, mypkg.mysubpkg.myclass.s2o), mypkg.mysubpkg.myclass.s2));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.n, mypkg.mysubpkg.myclass.l), mypkg.mysubpkg.myclass.l));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.n, mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.n, mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.n, mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.n, mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.n, mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.n, mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.n, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.n, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));

% m, m->m2, m->m2->s, m->m2->so, m->m2->s2, m->m2->s2o,
% m->m2->p, m->m2->p->s, m->m2->p->s2
% m->s, m->so, m->s2, m->s2o,
% m->l, m->l->s, m->l->s2, m->l->p, m->l->p->s, m->l->p->s2,
% m->p, m->p->s, m->p->s2
assert(isequal(obj.call(mypkg.mysubpkg.myclass.m), mypkg.mysubpkg.myclass.m));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.m2), mypkg.mysubpkg.myclass.m2));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.so), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.s2o), mypkg.mysubpkg.myclass.s2));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.so), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.s2o), mypkg.mysubpkg.myclass.s2));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.l), mypkg.mysubpkg.myclass.l));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));

% m2, m2->m, m2->m->s, m2->m->so, m2->m->s2, m2->m->s2o,
% m2->m->l, m2->m->l->s, m2->m->l->s2,
% m2->m->l->p, m2->m->l->p->s, m2->m->l->p->s2
% m2->m->p, m2->m->p->s, m2->m->p->s2
% m2->s, m2->so, m2->s2, m2->s2o,
% m2->p, m2->p->s, m2->p->s2
assert(isequal(obj.call(mypkg.mysubpkg.myclass.m2), mypkg.mysubpkg.myclass.m2));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.m), mypkg.mysubpkg.myclass.m));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.so), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.s2o), mypkg.mysubpkg.myclass.s2));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.l), mypkg.mysubpkg.myclass.l));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.so), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.s2o), mypkg.mysubpkg.myclass.s2));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));

% s, s->s2,
% s->l, s->l->s, s->l->s2, s->l->p, s->l->p->s, s->l->p->s2,
% s->p, s->p->s, s->p->s2
assert(isequal(obj.call(mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.s, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.s, mypkg.mysubpkg.myclass.l), mypkg.mysubpkg.myclass.l));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.s, mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.s, mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.s, mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.s, mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.s, mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.s, mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.s, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.s, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));

% so, so->s2,
% so->l, so->l->s, so->l->s2, so->l->p, so->l->p->s, so->l->p->s2,
% so->p, so->p->s, so->p->s2
assert(isequal(obj.call(mypkg.mysubpkg.myclass.so), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.so, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.so, mypkg.mysubpkg.myclass.l), mypkg.mysubpkg.myclass.l));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.so, mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.so, mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.so, mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.so, mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.so, mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.so, mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.so, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.so, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));

% s2, s2->s, s2->p, s2->p->s, s2->p->s2
assert(isequal(obj.call(mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.s2, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.s2, mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.s2, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.s2, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));

% s2o, s2o->s, s2o->p, s2o->p->s, s2o->p->s2
assert(isequal(obj.call(mypkg.mysubpkg.myclass.s2o), mypkg.mysubpkg.myclass.s2));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.s2o, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.s2o, mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.s2o, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.s2o, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));

% l, l->s, l->s2, l->p, l->p->s, l->p->s2
assert(isequal(obj.call(mypkg.mysubpkg.myclass.l), mypkg.mysubpkg.myclass.l));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));

% p, p->s, p->s->l, p->s2
% [assert throws]: p->l
assert(isequal(obj.call(mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
err = false; try obj.call(mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.l); catch, err = true; end, assert(err);
assert(isequal(obj.call(mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s, mypkg.mysubpkg.myclass.l), mypkg.mysubpkg.myclass.l));
