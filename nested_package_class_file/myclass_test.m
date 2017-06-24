%% create object

obj = mypkg.mysubpkg.myclass();

% valid calls graph:
% ------------------
% n,hn                 ==> [m, s, so, l, p; hm, hmo, hmvo, hs, hsv, hso, hsvo, hl, hp]
% m,hm,hmo,hmvo        ==> [s, so, l, p; hs, hsv, hso, hsvo, hl, hp]
% s,so,hs,hsv,hso,hsvo ==> [l, p; hl, hp]
% l,hl                 ==> [s, p; hs, hsv, hp]
% p,hp                 ==> [s; hs, hsv]
%
% note: to avoid repetition, we skip cycles e.g: ...->{s,so}->*

%% direct calls

% m, s, so
% [assert throws]: l, p
assert(isequal(obj.method_function(), mypkg.mysubpkg.myclass.m));
assert(isequal(mypkg.mysubpkg.myclass.static_function(), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.static_function(), mypkg.mysubpkg.myclass.s));
err = false; try local_function(); catch, err = true; end, assert(err);
err = false; try private_function(); catch, err = true; end, assert(err);

%% dispatch calls

% n, n->m, n->m->s, n->m->so,
% n->m->l, n->m->l->s, n->m->l->p, n->m->l->p->s,
% n->m->p, n->m->p->s,
% n->s, n->so,
% n->l, n->l->s, n->l->p, n->l->p->s,
% n->p, n->p->s
assert(isequal(obj.call(mypkg.mysubpkg.myclass.n), mypkg.mysubpkg.myclass.n));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.n, mypkg.mysubpkg.myclass.m), mypkg.mysubpkg.myclass.m));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.n, mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.n, mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.so), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.n, mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.l), mypkg.mysubpkg.myclass.l));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.n, mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.n, mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.n, mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.n, mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.n, mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.n, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.n, mypkg.mysubpkg.myclass.so), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.n, mypkg.mysubpkg.myclass.l), mypkg.mysubpkg.myclass.l));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.n, mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.n, mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.n, mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.n, mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.n, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));

% m,
% m->s, m->so,
% m->l, m->l->s, m->l->p, m->l->p->s,
% m->p, m->p->s,
assert(isequal(obj.call(mypkg.mysubpkg.myclass.m), mypkg.mysubpkg.myclass.m));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.so), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.l), mypkg.mysubpkg.myclass.l));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));

% s,
% s->l, s->l->s, s->l->p, s->l->p->s,
% s->p, s->p->s
assert(isequal(obj.call(mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.s, mypkg.mysubpkg.myclass.l), mypkg.mysubpkg.myclass.l));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.s, mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.s, mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.s, mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.s, mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.s, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));

% so,
% so->l, so->l->s, so->l->p, so->l->p->s,
% so->p, so->p->s
assert(isequal(obj.call(mypkg.mysubpkg.myclass.so), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.so, mypkg.mysubpkg.myclass.l), mypkg.mysubpkg.myclass.l));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.so, mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.so, mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.so, mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.so, mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.so, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));

% l, l->s, l->p, l->p->s
assert(isequal(obj.call(mypkg.mysubpkg.myclass.l), mypkg.mysubpkg.myclass.l));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));

% p, p->s, p->s->l
% [assert throws]: p->l
assert(isequal(obj.call(mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
err = false; try obj.call(mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.l); catch, err = true; end, assert(err);
assert(isequal(obj.call(mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s, mypkg.mysubpkg.myclass.l), mypkg.mysubpkg.myclass.l));
