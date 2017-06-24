%% create object

obj = myclass();

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

% m, s, so, p
% [assert throws]: l
assert(isequal(obj.method_function(), myclass.m));
assert(isequal(myclass.static_function(), myclass.s));
assert(isequal(obj.static_function(), myclass.s));
err = false; try local_function(); catch, err = true; end, assert(err);
if false
    %TODO: in R2017a, private/ is accessible for this test script (as it should)
    %TODO: in R2014a, it is not (bug ??)
    assert(isequal(private_function(), myclass.p));
end

%% dispatch calls

% n, n->m, n->m->s, n->m->so,
% n->m->l, n->m->l->s, n->m->l->p, n->m->l->p->s,
% n->m->p, n->m->p->s,
% n->s, n->so,
% n->l, n->l->s, n->l->p, n->l->p->s,
% n->p, n->p->s
assert(isequal(obj.call(myclass.n), myclass.n));
assert(isequal(obj.call(myclass.n, myclass.m), myclass.m));
assert(isequal(obj.call(myclass.n, myclass.m, myclass.s), myclass.s));
assert(isequal(obj.call(myclass.n, myclass.m, myclass.so), myclass.s));
assert(isequal(obj.call(myclass.n, myclass.m, myclass.l), myclass.l));
assert(isequal(obj.call(myclass.n, myclass.m, myclass.l, myclass.s), myclass.s));
assert(isequal(obj.call(myclass.n, myclass.m, myclass.l, myclass.p), myclass.p));
assert(isequal(obj.call(myclass.n, myclass.m, myclass.l, myclass.p, myclass.s), myclass.s));
assert(isequal(obj.call(myclass.n, myclass.m, myclass.p), myclass.p));
assert(isequal(obj.call(myclass.n, myclass.m, myclass.p, myclass.s), myclass.s));
assert(isequal(obj.call(myclass.n, myclass.s), myclass.s));
assert(isequal(obj.call(myclass.n, myclass.so), myclass.s));
assert(isequal(obj.call(myclass.n, myclass.l), myclass.l));
assert(isequal(obj.call(myclass.n, myclass.l, myclass.s), myclass.s));
assert(isequal(obj.call(myclass.n, myclass.l, myclass.p), myclass.p));
assert(isequal(obj.call(myclass.n, myclass.l, myclass.p, myclass.s), myclass.s));
assert(isequal(obj.call(myclass.n, myclass.p), myclass.p));
assert(isequal(obj.call(myclass.n, myclass.p, myclass.s), myclass.s));

% m,
% m->s, m->so,
% m->l, m->l->s, m->l->p, m->l->p->s,
% m->p, m->p->s,
assert(isequal(obj.call(myclass.m), myclass.m));
assert(isequal(obj.call(myclass.m, myclass.s), myclass.s));
assert(isequal(obj.call(myclass.m, myclass.so), myclass.s));
assert(isequal(obj.call(myclass.m, myclass.l), myclass.l));
assert(isequal(obj.call(myclass.m, myclass.l, myclass.s), myclass.s));
assert(isequal(obj.call(myclass.m, myclass.l, myclass.p), myclass.p));
assert(isequal(obj.call(myclass.m, myclass.l, myclass.p, myclass.s), myclass.s));
assert(isequal(obj.call(myclass.m, myclass.p), myclass.p));
assert(isequal(obj.call(myclass.m, myclass.p, myclass.s), myclass.s));

% s,
% s->l, s->l->s, s->l->p, s->l->p->s,
% s->p, s->p->s
assert(isequal(obj.call(myclass.s), myclass.s));
assert(isequal(obj.call(myclass.s, myclass.l), myclass.l));
assert(isequal(obj.call(myclass.s, myclass.l, myclass.s), myclass.s));
assert(isequal(obj.call(myclass.s, myclass.l, myclass.p), myclass.p));
assert(isequal(obj.call(myclass.s, myclass.l, myclass.p, myclass.s), myclass.s));
assert(isequal(obj.call(myclass.s, myclass.p), myclass.p));
assert(isequal(obj.call(myclass.s, myclass.p, myclass.s), myclass.s));

% so,
% so->l, so->l->s, so->l->p, so->l->p->s,
% so->p, so->p->s
assert(isequal(obj.call(myclass.so), myclass.s));
assert(isequal(obj.call(myclass.so, myclass.l), myclass.l));
assert(isequal(obj.call(myclass.so, myclass.l, myclass.s), myclass.s));
assert(isequal(obj.call(myclass.so, myclass.l, myclass.p), myclass.p));
assert(isequal(obj.call(myclass.so, myclass.l, myclass.p, myclass.s), myclass.s));
assert(isequal(obj.call(myclass.so, myclass.p), myclass.p));
assert(isequal(obj.call(myclass.so, myclass.p, myclass.s), myclass.s));

% l, l->s, l->p, l->p->s
assert(isequal(obj.call(myclass.l), myclass.l));
assert(isequal(obj.call(myclass.l, myclass.s), myclass.s));
assert(isequal(obj.call(myclass.l, myclass.p), myclass.p));
assert(isequal(obj.call(myclass.l, myclass.p, myclass.s), myclass.s));

% p, p->s, p->s->l
% [assert throws]: p->l
assert(isequal(obj.call(myclass.p), myclass.p));
assert(isequal(obj.call(myclass.p, myclass.s), myclass.s));
err = false; try obj.call(myclass.p, myclass.l); catch, err = true; end, assert(err);
assert(isequal(obj.call(myclass.p, myclass.s, myclass.l), myclass.l));
