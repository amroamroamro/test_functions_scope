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

%% dispatch calls using function handles

% hn, hn->m, hn->m->s, hn->m->so,
% hn->m->l, hn->m->l->s, hn->m->l->p, hn->m->l->p->s,
% hn->m->p, hn->m->p->s,
% hn->s, hn->so,
% hn->l, hn->l->s, hn->l->p, hn->l->p->s,
% hn->p, hn->p->s
hn = obj.call(mypkg.mysubpkg.myclass.hn);
assert(isequal(hn(), mypkg.mysubpkg.myclass.n));
assert(isequal(hn(mypkg.mysubpkg.myclass.m), mypkg.mysubpkg.myclass.m));
assert(isequal(hn(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hn(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.so), mypkg.mysubpkg.myclass.s));
assert(isequal(hn(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.l), mypkg.mysubpkg.myclass.l));
assert(isequal(hn(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hn(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(hn(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hn(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(hn(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hn(mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hn(mypkg.mysubpkg.myclass.so), mypkg.mysubpkg.myclass.s));
assert(isequal(hn(mypkg.mysubpkg.myclass.l), mypkg.mysubpkg.myclass.l));
assert(isequal(hn(mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hn(mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(hn(mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hn(mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(hn(mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));

% hm,
% hm->s, hm->so,
% hm->l, hm->l->s,hm->l->p, hm->l->p->s,
% hm->p, hm->p->s,
hm = obj.call(mypkg.mysubpkg.myclass.hm);
assert(isequal(hm(obj), mypkg.mysubpkg.myclass.m));
assert(isequal(hm(obj, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hm(obj, mypkg.mysubpkg.myclass.so), mypkg.mysubpkg.myclass.s));
assert(isequal(hm(obj, mypkg.mysubpkg.myclass.l), mypkg.mysubpkg.myclass.l));
assert(isequal(hm(obj, mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hm(obj, mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(hm(obj, mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hm(obj, mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(hm(obj, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));

% hmo,
% hmo->s, hmo->so,
% hmo->l, hmo->l->s, hmo->l->p, hmo->l->p->s,
% hmo->p, hmo->p->s
hmo = obj.call(mypkg.mysubpkg.myclass.hmo);
assert(isequal(hmo(), mypkg.mysubpkg.myclass.m));
assert(isequal(hmo(mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hmo(mypkg.mysubpkg.myclass.so), mypkg.mysubpkg.myclass.s));
assert(isequal(hmo(mypkg.mysubpkg.myclass.l), mypkg.mysubpkg.myclass.l));
assert(isequal(hmo(mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hmo(mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(hmo(mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hmo(mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(hmo(mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));

% hmvo,
% hmvo->s, hmvo->so,
% hmvo->l, hmvo->l->s, hmvo->l->p, hmvo->l->p->s,
% hmvo->p, hmvo->p->s
hmvo = obj.call(mypkg.mysubpkg.myclass.hmvo);
assert(isequal(hmvo(), mypkg.mysubpkg.myclass.m));
assert(isequal(hmvo(mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hmvo(mypkg.mysubpkg.myclass.so), mypkg.mysubpkg.myclass.s));
assert(isequal(hmvo(mypkg.mysubpkg.myclass.l), mypkg.mysubpkg.myclass.l));
assert(isequal(hmvo(mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hmvo(mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(hmvo(mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hmvo(mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(hmvo(mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));

% hs,
% hs->l, hs->l->s, hs->l->p, hs->l->p->s,
% hs->p, hs->p->s
hs = obj.call(mypkg.mysubpkg.myclass.hs);
assert(isequal(hs(), mypkg.mysubpkg.myclass.s));
assert(isequal(hs(mypkg.mysubpkg.myclass.l), mypkg.mysubpkg.myclass.l));
assert(isequal(hs(mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hs(mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(hs(mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hs(mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(hs(mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));

% hsv,
% hsv->l, hsv->l->s,, hsv->l->p, hsv->l->p->s,
% hsv->p, hsv->p->s,
hsv = obj.call(mypkg.mysubpkg.myclass.hsv);
assert(isequal(hsv(), mypkg.mysubpkg.myclass.s));
assert(isequal(hsv(mypkg.mysubpkg.myclass.l), mypkg.mysubpkg.myclass.l));
assert(isequal(hsv(mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hsv(mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(hsv(mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hsv(mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(hsv(mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));

% hso,
% hso->l, hso->l->s, hso->l->p, hso->l->p->s,
% hso->p, hso->p->s,
hso = obj.call(mypkg.mysubpkg.myclass.hso);
assert(isequal(hso(), mypkg.mysubpkg.myclass.s));
assert(isequal(hso(mypkg.mysubpkg.myclass.l), mypkg.mysubpkg.myclass.l));
assert(isequal(hso(mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hso(mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(hso(mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hso(mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(hso(mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));

% hsvo,
% hsvo->l, hsvo->l->s,, hsvo->l->p, hsvo->l->p->s,
% hsvo->p, hsvo->p->s,
hsvo = obj.call(mypkg.mysubpkg.myclass.hsvo);
assert(isequal(hsvo(), mypkg.mysubpkg.myclass.s));
assert(isequal(hsvo(mypkg.mysubpkg.myclass.l), mypkg.mysubpkg.myclass.l));
assert(isequal(hsvo(mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hsvo(mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(hsvo(mypkg.mysubpkg.myclass.l, mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hsvo(mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(hsvo(mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));

% hl, hl->s, hl->p, hl->p->s
hl = obj.call(mypkg.mysubpkg.myclass.hl);
assert(isequal(hl(), mypkg.mysubpkg.myclass.l));
assert(isequal(hl(mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hl(mypkg.mysubpkg.myclass.p), mypkg.mysubpkg.myclass.p));
assert(isequal(hl(mypkg.mysubpkg.myclass.p, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));

% hp, hp->s, hp->s->l
% [assert throws]: hp->l
hp = obj.call(mypkg.mysubpkg.myclass.hp);
assert(isequal(hp(), mypkg.mysubpkg.myclass.p));
assert(isequal(hp(mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
err = false; try hp(mypkg.mysubpkg.myclass.l); catch, err = true; end, assert(err);
assert(isequal(hp(mypkg.mysubpkg.myclass.s, mypkg.mysubpkg.myclass.l), mypkg.mysubpkg.myclass.l));

%% inspect function handles

if true
    fhandles = {hn, hm, hmo, hmvo, hs, hsv, hso, hsvo, hl, hp};
    names = {'hn', 'hm', 'hmo', 'hmvo', 'hs', 'hsv', 'hso', 'hsvo', 'hl', 'hp'};
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
