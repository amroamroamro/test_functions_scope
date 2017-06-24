%% create object

obj = mypkg.myclass();

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
hn = obj.call(mypkg.myclass.hn);
assert(isequal(hn(), mypkg.myclass.n));
assert(isequal(hn(mypkg.myclass.m), mypkg.myclass.m));
assert(isequal(hn(mypkg.myclass.m, mypkg.myclass.s), mypkg.myclass.s));
assert(isequal(hn(mypkg.myclass.m, mypkg.myclass.so), mypkg.myclass.s));
assert(isequal(hn(mypkg.myclass.m, mypkg.myclass.l), mypkg.myclass.l));
assert(isequal(hn(mypkg.myclass.m, mypkg.myclass.l, mypkg.myclass.s), mypkg.myclass.s));
assert(isequal(hn(mypkg.myclass.m, mypkg.myclass.l, mypkg.myclass.p), mypkg.myclass.p));
assert(isequal(hn(mypkg.myclass.m, mypkg.myclass.l, mypkg.myclass.p, mypkg.myclass.s), mypkg.myclass.s));
assert(isequal(hn(mypkg.myclass.m, mypkg.myclass.p), mypkg.myclass.p));
assert(isequal(hn(mypkg.myclass.m, mypkg.myclass.p, mypkg.myclass.s), mypkg.myclass.s));
assert(isequal(hn(mypkg.myclass.s), mypkg.myclass.s));
assert(isequal(hn(mypkg.myclass.so), mypkg.myclass.s));
assert(isequal(hn(mypkg.myclass.l), mypkg.myclass.l));
assert(isequal(hn(mypkg.myclass.l, mypkg.myclass.s), mypkg.myclass.s));
assert(isequal(hn(mypkg.myclass.l, mypkg.myclass.p), mypkg.myclass.p));
assert(isequal(hn(mypkg.myclass.l, mypkg.myclass.p, mypkg.myclass.s), mypkg.myclass.s));
assert(isequal(hn(mypkg.myclass.p), mypkg.myclass.p));
assert(isequal(hn(mypkg.myclass.p, mypkg.myclass.s), mypkg.myclass.s));

% hm,
% hm->s, hm->so,
% hm->l, hm->l->s,hm->l->p, hm->l->p->s,
% hm->p, hm->p->s,
hm = obj.call(mypkg.myclass.hm);
assert(isequal(hm(obj), mypkg.myclass.m));
assert(isequal(hm(obj, mypkg.myclass.s), mypkg.myclass.s));
assert(isequal(hm(obj, mypkg.myclass.so), mypkg.myclass.s));
assert(isequal(hm(obj, mypkg.myclass.l), mypkg.myclass.l));
assert(isequal(hm(obj, mypkg.myclass.l, mypkg.myclass.s), mypkg.myclass.s));
assert(isequal(hm(obj, mypkg.myclass.l, mypkg.myclass.p), mypkg.myclass.p));
assert(isequal(hm(obj, mypkg.myclass.l, mypkg.myclass.p, mypkg.myclass.s), mypkg.myclass.s));
assert(isequal(hm(obj, mypkg.myclass.p), mypkg.myclass.p));
assert(isequal(hm(obj, mypkg.myclass.p, mypkg.myclass.s), mypkg.myclass.s));

% hmo,
% hmo->s, hmo->so,
% hmo->l, hmo->l->s, hmo->l->p, hmo->l->p->s,
% hmo->p, hmo->p->s
hmo = obj.call(mypkg.myclass.hmo);
assert(isequal(hmo(), mypkg.myclass.m));
assert(isequal(hmo(mypkg.myclass.s), mypkg.myclass.s));
assert(isequal(hmo(mypkg.myclass.so), mypkg.myclass.s));
assert(isequal(hmo(mypkg.myclass.l), mypkg.myclass.l));
assert(isequal(hmo(mypkg.myclass.l, mypkg.myclass.s), mypkg.myclass.s));
assert(isequal(hmo(mypkg.myclass.l, mypkg.myclass.p), mypkg.myclass.p));
assert(isequal(hmo(mypkg.myclass.l, mypkg.myclass.p, mypkg.myclass.s), mypkg.myclass.s));
assert(isequal(hmo(mypkg.myclass.p), mypkg.myclass.p));
assert(isequal(hmo(mypkg.myclass.p, mypkg.myclass.s), mypkg.myclass.s));

% hmvo,
% hmvo->s, hmvo->so,
% hmvo->l, hmvo->l->s, hmvo->l->p, hmvo->l->p->s,
% hmvo->p, hmvo->p->s
hmvo = obj.call(mypkg.myclass.hmvo);
assert(isequal(hmvo(), mypkg.myclass.m));
assert(isequal(hmvo(mypkg.myclass.s), mypkg.myclass.s));
assert(isequal(hmvo(mypkg.myclass.so), mypkg.myclass.s));
assert(isequal(hmvo(mypkg.myclass.l), mypkg.myclass.l));
assert(isequal(hmvo(mypkg.myclass.l, mypkg.myclass.s), mypkg.myclass.s));
assert(isequal(hmvo(mypkg.myclass.l, mypkg.myclass.p), mypkg.myclass.p));
assert(isequal(hmvo(mypkg.myclass.l, mypkg.myclass.p, mypkg.myclass.s), mypkg.myclass.s));
assert(isequal(hmvo(mypkg.myclass.p), mypkg.myclass.p));
assert(isequal(hmvo(mypkg.myclass.p, mypkg.myclass.s), mypkg.myclass.s));

% hs,
% hs->l, hs->l->s, hs->l->p, hs->l->p->s,
% hs->p, hs->p->s
hs = obj.call(mypkg.myclass.hs);
assert(isequal(hs(), mypkg.myclass.s));
assert(isequal(hs(mypkg.myclass.l), mypkg.myclass.l));
assert(isequal(hs(mypkg.myclass.l, mypkg.myclass.s), mypkg.myclass.s));
assert(isequal(hs(mypkg.myclass.l, mypkg.myclass.p), mypkg.myclass.p));
assert(isequal(hs(mypkg.myclass.l, mypkg.myclass.p, mypkg.myclass.s), mypkg.myclass.s));
assert(isequal(hs(mypkg.myclass.p), mypkg.myclass.p));
assert(isequal(hs(mypkg.myclass.p, mypkg.myclass.s), mypkg.myclass.s));

% hsv,
% hsv->l, hsv->l->s,, hsv->l->p, hsv->l->p->s,
% hsv->p, hsv->p->s,
hsv = obj.call(mypkg.myclass.hsv);
assert(isequal(hsv(), mypkg.myclass.s));
assert(isequal(hsv(mypkg.myclass.l), mypkg.myclass.l));
assert(isequal(hsv(mypkg.myclass.l, mypkg.myclass.s), mypkg.myclass.s));
assert(isequal(hsv(mypkg.myclass.l, mypkg.myclass.p), mypkg.myclass.p));
assert(isequal(hsv(mypkg.myclass.l, mypkg.myclass.p, mypkg.myclass.s), mypkg.myclass.s));
assert(isequal(hsv(mypkg.myclass.p), mypkg.myclass.p));
assert(isequal(hsv(mypkg.myclass.p, mypkg.myclass.s), mypkg.myclass.s));

% hso,
% hso->l, hso->l->s, hso->l->p, hso->l->p->s,
% hso->p, hso->p->s,
hso = obj.call(mypkg.myclass.hso);
assert(isequal(hso(), mypkg.myclass.s));
assert(isequal(hso(mypkg.myclass.l), mypkg.myclass.l));
assert(isequal(hso(mypkg.myclass.l, mypkg.myclass.s), mypkg.myclass.s));
assert(isequal(hso(mypkg.myclass.l, mypkg.myclass.p), mypkg.myclass.p));
assert(isequal(hso(mypkg.myclass.l, mypkg.myclass.p, mypkg.myclass.s), mypkg.myclass.s));
assert(isequal(hso(mypkg.myclass.p), mypkg.myclass.p));
assert(isequal(hso(mypkg.myclass.p, mypkg.myclass.s), mypkg.myclass.s));

% hsvo,
% hsvo->l, hsvo->l->s,, hsvo->l->p, hsvo->l->p->s,
% hsvo->p, hsvo->p->s,
hsvo = obj.call(mypkg.myclass.hsvo);
assert(isequal(hsvo(), mypkg.myclass.s));
assert(isequal(hsvo(mypkg.myclass.l), mypkg.myclass.l));
assert(isequal(hsvo(mypkg.myclass.l, mypkg.myclass.s), mypkg.myclass.s));
assert(isequal(hsvo(mypkg.myclass.l, mypkg.myclass.p), mypkg.myclass.p));
assert(isequal(hsvo(mypkg.myclass.l, mypkg.myclass.p, mypkg.myclass.s), mypkg.myclass.s));
assert(isequal(hsvo(mypkg.myclass.p), mypkg.myclass.p));
assert(isequal(hsvo(mypkg.myclass.p, mypkg.myclass.s), mypkg.myclass.s));

% hl, hl->s, hl->p, hl->p->s
hl = obj.call(mypkg.myclass.hl);
assert(isequal(hl(), mypkg.myclass.l));
assert(isequal(hl(mypkg.myclass.s), mypkg.myclass.s));
assert(isequal(hl(mypkg.myclass.p), mypkg.myclass.p));
assert(isequal(hl(mypkg.myclass.p, mypkg.myclass.s), mypkg.myclass.s));

% hp, hp->s, hp->s->l
% [assert throws]: hp->l
hp = obj.call(mypkg.myclass.hp);
assert(isequal(hp(), mypkg.myclass.p));
assert(isequal(hp(mypkg.myclass.s), mypkg.myclass.s));
err = false; try hp(mypkg.myclass.l); catch, err = true; end, assert(err);
assert(isequal(hp(mypkg.myclass.s, mypkg.myclass.l), mypkg.myclass.l));

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
