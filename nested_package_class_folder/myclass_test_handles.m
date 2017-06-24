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

%% dispatch calls using function handles

% hn, hn->m, hn->m->m2, hn->m->s, hn->m->so, hn->m->s2, hn->m->s2o,
% hn->m->l, hn->m->l->s, hn->m->l->s2, hn->m->l->p, hn->m->l->p->s, hn->m->l->p->s2,
% hn->m->p, hn->m->p->s, hn->m->p->s2,
% hn->m2, hn->m2->m, hn->m2->s, hn->m2->so, hn->m2->s2, hn->m2->s2o,
% hn->m2->p, hn->m2->p->s, hn->m2->p->s2,
% hn->s, hn->so, hn->s2, hn->s2o,
% hn->l, hn->l->s, hn->l->s2, hn->l->p, hn->l->p->s, hn->l->p->s2,
% hn->p, hn->p->s, hn->p->s2
hn = obj.call(mypkg.mysubpkg.myclass.hn);
assert(isequal(hn(), mypkg.mysubpkg.myclass.n));
assert(isequal(hn(mypkg.mysubpkg.myclass.m), mypkg.mysubpkg.myclass.m));
assert(isequal(hn(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.m2), mypkg.mysubpkg.myclass.m2));
assert(isequal(hn(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hn(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.so), mypkg.mysubpkg.myclass.s));
assert(isequal(hn(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(hn(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.s2o), mypkg.mysubpkg.myclass.s2));
assert(isequal(hn(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.l), mypkg.mysubpkg.myclass.l));
assert(isequal(hn(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hn(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(hn(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(hn(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hn(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(hn(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(hn(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hn(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(hn(mypkg.mysubpkg.myclass.m2), mypkg.mysubpkg.myclass.m2));
assert(isequal(hn(mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.m), mypkg.mysubpkg.myclass.m));
assert(isequal(hn(mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hn(mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.so), mypkg.mysubpkg.myclass.s));
assert(isequal(hn(mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(hn(mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.s2o), mypkg.mysubpkg.myclass.s2));
assert(isequal(hn(mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(hn(mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hn(mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(hn(mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hn(mypkg.mysubpkg.myclass.so), mypkg.mysubpkg.myclass.s));
assert(isequal(hn(mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(hn(mypkg.mysubpkg.myclass.s2o), mypkg.mysubpkg.myclass.s2));
assert(isequal(hn(mypkg.mysubpkg.myclass.l), mypkg.mysubpkg.myclass.l));
assert(isequal(hn(mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hn(mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(hn(mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(hn(mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hn(mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(hn(mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(hn(mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hn(mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));

% hm, hm->m2, hm->m2->s, hm->m2->so, hm->m2->s2, hm->m2->s2o,
% hm->m2->p, hm->m2->p->s, hm->m2->p->s2
% hm->s, hm->so, hm->s2, hm->s2o,
% hm->l, hm->l->s, hm->l->s2, hm->l->p, hm->l->p->s, hm->l->p->s2,
% hm->p, hm->p->s, hm->p->s2
hm = obj.call(mypkg.mysubpkg.myclass.hm);
assert(isequal(hm(obj), mypkg.mysubpkg.myclass.m));
assert(isequal(hm(obj, mypkg.mysubpkg.myclass.m2), mypkg.mysubpkg.myclass.m2));
assert(isequal(hm(obj, mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hm(obj, mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.so), mypkg.mysubpkg.myclass.s));
assert(isequal(hm(obj, mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(hm(obj, mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.s2o), mypkg.mysubpkg.myclass.s2));
assert(isequal(hm(obj, mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(hm(obj, mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hm(obj, mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(hm(obj, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hm(obj, mypkg.mysubpkg.myclass.so), mypkg.mysubpkg.myclass.s));
assert(isequal(hm(obj, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(hm(obj, mypkg.mysubpkg.myclass.s2o), mypkg.mysubpkg.myclass.s2));
assert(isequal(hm(obj, mypkg.mysubpkg.myclass.l), mypkg.mysubpkg.myclass.l));
assert(isequal(hm(obj, mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hm(obj, mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(hm(obj, mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(hm(obj, mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hm(obj, mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(hm(obj, mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(hm(obj, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hm(obj, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));

% hmo, hmo->m2, hmo->m2->s, hmo->m2->so, hmo->m2->s2, hmo->m2->s2o,
% hmo->m2->p, hmo->m2->p->s, hmo->m2->p->s2
% hmo->s, hmo->so, hmo->s2, hmo->s2o,
% hmo->l, hmo->l->s, hmo->l->s2, hmo->l->p, hmo->l->p->s, hmo->l->p->s2,
% hmo->p, hmo->p->s, hmo->p->s2
hmo = obj.call(mypkg.mysubpkg.myclass.hmo);
assert(isequal(hmo(), mypkg.mysubpkg.myclass.m));
assert(isequal(hmo(mypkg.mysubpkg.myclass.m2), mypkg.mysubpkg.myclass.m2));
assert(isequal(hmo(mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hmo(mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.so), mypkg.mysubpkg.myclass.s));
assert(isequal(hmo(mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(hmo(mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.s2o), mypkg.mysubpkg.myclass.s2));
assert(isequal(hmo(mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(hmo(mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hmo(mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(hmo(mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hmo(mypkg.mysubpkg.myclass.so), mypkg.mysubpkg.myclass.s));
assert(isequal(hmo(mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(hmo(mypkg.mysubpkg.myclass.s2o), mypkg.mysubpkg.myclass.s2));
assert(isequal(hmo(mypkg.mysubpkg.myclass.l), mypkg.mysubpkg.myclass.l));
assert(isequal(hmo(mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hmo(mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(hmo(mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(hmo(mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hmo(mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(hmo(mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(hmo(mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hmo(mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));

% hmvo, hmvo->m2, hmvo->m2->s, hmvo->m2->so, hmvo->m2->s2, hmvo->m2->s2o,
% hmvo->m2->p, hmvo->m2->p->s, hmvo->m2->p->s2
% hmvo->s, hmvo->so, hmvo->s2, hmvo->s2o,
% hmvo->l, hmvo->l->s, hmvo->l->s2, hmvo->l->p, hmvo->l->p->s, hmvo->l->p->s2,
% hmvo->p, hmvo->p->s, hmvo->p->s2
hmvo = obj.call(mypkg.mysubpkg.myclass.hmvo);
assert(isequal(hmvo(), mypkg.mysubpkg.myclass.m));
assert(isequal(hmvo(mypkg.mysubpkg.myclass.m2), mypkg.mysubpkg.myclass.m2));
assert(isequal(hmvo(mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hmvo(mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.so), mypkg.mysubpkg.myclass.s));
assert(isequal(hmvo(mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(hmvo(mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.s2o), mypkg.mysubpkg.myclass.s2));
assert(isequal(hmvo(mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(hmvo(mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hmvo(mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(hmvo(mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hmvo(mypkg.mysubpkg.myclass.so), mypkg.mysubpkg.myclass.s));
assert(isequal(hmvo(mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(hmvo(mypkg.mysubpkg.myclass.s2o), mypkg.mysubpkg.myclass.s2));
assert(isequal(hmvo(mypkg.mysubpkg.myclass.l), mypkg.mysubpkg.myclass.l));
assert(isequal(hmvo(mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hmvo(mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(hmvo(mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(hmvo(mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hmvo(mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(hmvo(mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(hmvo(mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hmvo(mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));

% hm2, hm2->m, hm2->m->s, hm2->m->so, hm2->m->s2, hm2->m->s2o,
% hm2->m->l, hm2->m->l->s, hm2->m->l->s2,
% hm2->m->l->p, hm2->m->l->p->s, hm2->m->l->p->s2
% hm2->m->p, hm2->m->p->s, hm2->m->p->s2
% hm2->s, hm2->so, hm2->s2, hm2->s2o,
% hm2->p, hm2->p->s, hm2->p->s2
hm2 = obj.call(mypkg.mysubpkg.myclass.hm2);
assert(isequal(hm2(obj), mypkg.mysubpkg.myclass.m2));
assert(isequal(hm2(obj, mypkg.mysubpkg.myclass.m), mypkg.mysubpkg.myclass.m));
assert(isequal(hm2(obj, mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hm2(obj, mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.so), mypkg.mysubpkg.myclass.s));
assert(isequal(hm2(obj, mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(hm2(obj, mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.s2o), mypkg.mysubpkg.myclass.s2));
assert(isequal(hm2(obj, mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.l), mypkg.mysubpkg.myclass.l));
assert(isequal(hm2(obj, mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hm2(obj, mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(hm2(obj, mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(hm2(obj, mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hm2(obj, mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(hm2(obj, mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(hm2(obj, mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hm2(obj, mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(hm2(obj, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hm2(obj, mypkg.mysubpkg.myclass.so), mypkg.mysubpkg.myclass.s));
assert(isequal(hm2(obj, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(hm2(obj, mypkg.mysubpkg.myclass.s2o), mypkg.mysubpkg.myclass.s2));
assert(isequal(hm2(obj, mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(hm2(obj, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hm2(obj, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));

% hm2o, hm2o->m, hm2o->m->s, hm2o->m->so, hm2o->m->s2, hm2o->m->s2o,
% hm2o->m->l, hm2o->m->l->s, hm2o->m->l->s2,
% hm2o->m->l->p, hm2o->m->l->p->s, hm2o->m->l->p->s2
% hm2o->m->p, hm2o->m->p->s, hm2o->m->p->s2
% hm2o->s, hm2o->so, hm2o->s2, hm2o->s2o,
% hm2o->p, hm2o->p->s, hm2o->p->s2
hm2o = obj.call(mypkg.mysubpkg.myclass.hm2o);
assert(isequal(hm2o(), mypkg.mysubpkg.myclass.m2));
assert(isequal(hm2o(mypkg.mysubpkg.myclass.m), mypkg.mysubpkg.myclass.m));
assert(isequal(hm2o(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hm2o(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.so), mypkg.mysubpkg.myclass.s));
assert(isequal(hm2o(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(hm2o(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.s2o), mypkg.mysubpkg.myclass.s2));
assert(isequal(hm2o(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.l), mypkg.mysubpkg.myclass.l));
assert(isequal(hm2o(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hm2o(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(hm2o(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(hm2o(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hm2o(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(hm2o(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(hm2o(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hm2o(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(hm2o(mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hm2o(mypkg.mysubpkg.myclass.so), mypkg.mysubpkg.myclass.s));
assert(isequal(hm2o(mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(hm2o(mypkg.mysubpkg.myclass.s2o), mypkg.mysubpkg.myclass.s2));
assert(isequal(hm2o(mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(hm2o(mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hm2o(mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));

% hm2vo, hm2vo->m, hm2vo->m->s, hm2vo->m->so, hm2vo->m->s2, hm2vo->m->s2o,
% hm2vo->m->l, hm2vo->m->l->s, hm2vo->m->l->s2,
% hm2vo->m->l->p, hm2vo->m->l->p->s, hm2vo->m->l->p->s2
% hm2vo->m->p, hm2vo->m->p->s, hm2vo->m->p->s2
% hm2vo->s, hm2vo->so, hm2vo->s2, hm2vo->s2o,
% hm2vo->p, hm2vo->p->s, hm2vo->p->s2
hm2vo = obj.call(mypkg.mysubpkg.myclass.hm2vo);
assert(isequal(hm2vo(), mypkg.mysubpkg.myclass.m2));
assert(isequal(hm2vo(mypkg.mysubpkg.myclass.m), mypkg.mysubpkg.myclass.m));
assert(isequal(hm2vo(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hm2vo(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.so), mypkg.mysubpkg.myclass.s));
assert(isequal(hm2vo(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(hm2vo(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.s2o), mypkg.mysubpkg.myclass.s2));
assert(isequal(hm2vo(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.l), mypkg.mysubpkg.myclass.l));
assert(isequal(hm2vo(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hm2vo(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(hm2vo(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(hm2vo(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hm2vo(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(hm2vo(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(hm2vo(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hm2vo(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(hm2vo(mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hm2vo(mypkg.mysubpkg.myclass.so), mypkg.mysubpkg.myclass.s));
assert(isequal(hm2vo(mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(hm2vo(mypkg.mysubpkg.myclass.s2o), mypkg.mysubpkg.myclass.s2));
assert(isequal(hm2vo(mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(hm2vo(mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hm2vo(mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));

% hs, hs->s2,
% hs->l, hs->l->s, hs->l->s2, hs->l->p, hs->l->p->s, hs->l->p->s2,
% hs->p, hs->p->s, hs->p->s2
hs = obj.call(mypkg.mysubpkg.myclass.hs);
assert(isequal(hs(), mypkg.mysubpkg.myclass.s));
assert(isequal(hs(mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(hs(mypkg.mysubpkg.myclass.l), mypkg.mysubpkg.myclass.l));
assert(isequal(hs(mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hs(mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(hs(mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(hs(mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hs(mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(hs(mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(hs(mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hs(mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));

% hsv, hsv->s2,
% hsv->l, hsv->l->s, hsv->l->s2, hsv->l->p, hsv->l->p->s, hsv->l->p->s2,
% hsv->p, hsv->p->s, hsv->p->s2
hsv = obj.call(mypkg.mysubpkg.myclass.hsv);
assert(isequal(hsv(), mypkg.mysubpkg.myclass.s));
assert(isequal(hsv(mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(hsv(mypkg.mysubpkg.myclass.l), mypkg.mysubpkg.myclass.l));
assert(isequal(hsv(mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hsv(mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(hsv(mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(hsv(mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hsv(mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(hsv(mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(hsv(mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hsv(mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));

% hso, hso->s2,
% hso->l, hso->l->s, hso->l->s2, hso->l->p, hso->l->p->s, hso->l->p->s2,
% hso->p, hso->p->s, hso->p->s2
hso = obj.call(mypkg.mysubpkg.myclass.hso);
assert(isequal(hso(), mypkg.mysubpkg.myclass.s));
assert(isequal(hso(mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(hso(mypkg.mysubpkg.myclass.l), mypkg.mysubpkg.myclass.l));
assert(isequal(hso(mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hso(mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(hso(mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(hso(mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hso(mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(hso(mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(hso(mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hso(mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));

% hsvo, hsvo->s2,
% hsvo->l, hsvo->l->s, hsvo->l->s2, hsvo->l->p, hsvo->l->p->s, hsvo->l->p->s2,
% hsvo->p, hsvo->p->s, hsvo->p->s2
hsvo = obj.call(mypkg.mysubpkg.myclass.hsvo);
assert(isequal(hsvo(), mypkg.mysubpkg.myclass.s));
assert(isequal(hsvo(mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(hsvo(mypkg.mysubpkg.myclass.l), mypkg.mysubpkg.myclass.l));
assert(isequal(hsvo(mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hsvo(mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(hsvo(mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(hsvo(mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hsvo(mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(hsvo(mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(hsvo(mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hsvo(mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));

% hs2, hs2->s, hs2->p, hs2->p->s, hs2->p->s2
hs2 = obj.call(mypkg.mysubpkg.myclass.hs2);
assert(isequal(hs2(), mypkg.mysubpkg.myclass.s2));
assert(isequal(hs2(mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hs2(mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(hs2(mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hs2(mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));

% hs2v, hs2v->s, hs2v->p, hs2v->p->s, hs2v->p->s2
hs2v = obj.call(mypkg.mysubpkg.myclass.hs2v);
assert(isequal(hs2v(), mypkg.mysubpkg.myclass.s2));
assert(isequal(hs2v(mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hs2v(mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(hs2v(mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hs2v(mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));

% hs2o, hs2o->s, hs2o->p, hs2o->p->s, hs2o->p->s2
hs2o = obj.call(mypkg.mysubpkg.myclass.hs2o);
assert(isequal(hs2o(), mypkg.mysubpkg.myclass.s2));
assert(isequal(hs2o(mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hs2o(mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(hs2o(mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hs2o(mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));

% hs2vo, hs2vo->s, hs2vo->p, hs2vo->p->s, hs2vo->p->s2
hs2vo = obj.call(mypkg.mysubpkg.myclass.hs2vo);
assert(isequal(hs2vo(), mypkg.mysubpkg.myclass.s2));
assert(isequal(hs2vo(mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hs2vo(mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(hs2vo(mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hs2vo(mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));

% hl, hl->s, hl->s2, hl->p, hl->p->s, hl->p->s2
hl = obj.call(mypkg.mysubpkg.myclass.hl);
assert(isequal(hl(), mypkg.mysubpkg.myclass.l));
assert(isequal(hl(mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hl(mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(hl(mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(hl(mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hl(mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));

% hp, hp->s, hp->s->l, hp->s2
% [assert throws]: hp->l
hp = obj.call(mypkg.mysubpkg.myclass.hp);
assert(isequal(hp(), mypkg.mysubpkg.myclass.p));
assert(isequal(hp(mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hp(mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
err = false; try hp(mypkg.mysubpkg.myclass.l); catch, err = true; end, assert(err);
assert(isequal(hp(mypkg.mysubpkg.myclass.s, mypkg.mysubpkg.myclass.l), mypkg.mysubpkg.myclass.l));

%% inspect function handles

if true
    fhandles = {hn, hm, hmo, hmvo, hm2, hm2o, hm2vo, ...
        hs, hsv, hso, hsvo, hs2, hs2v, hs2o, hs2vo, hl, hp};
    names = {'hn', 'hm', 'hmo', 'hmvo', 'hm2', 'hm2o', 'hm2vo', ...
        'hs', 'hsv', 'hso', 'hsvo', 'hs2', 'hs2v', 'hs2o', 'hs2vo', 'hl', 'hp'};
    for i=1:numel(fhandles)
        disp(['--- ' names{i} ' ---'])
        f = functions(fhandles{i});
        display(f)
        if isfield(f, 'workspace') && iscell(f.workspace)
            for j=1:numel(f.workspace)
                wrkspc = f.workspace{j};
                display(wrkspc)
            end
        end
    end
end
