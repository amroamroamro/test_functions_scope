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

%% dispatch calls using function handles

% hn, hn->m, hn->m->s, hn->m->so,
% hn->m->l, hn->m->l->s, hn->m->l->p, hn->m->l->p->s,
% hn->m->p, hn->m->p->s,
% hn->s, hn->so,
% hn->l, hn->l->s, hn->l->p, hn->l->p->s,
% hn->p, hn->p->s
hn = obj.call(myclass.hn);
assert(isequal(hn(), myclass.n));
assert(isequal(hn(myclass.m), myclass.m));
assert(isequal(hn(myclass.m, myclass.s), myclass.s));
assert(isequal(hn(myclass.m, myclass.so), myclass.s));
assert(isequal(hn(myclass.m, myclass.l), myclass.l));
assert(isequal(hn(myclass.m, myclass.l, myclass.s), myclass.s));
assert(isequal(hn(myclass.m, myclass.l, myclass.p), myclass.p));
assert(isequal(hn(myclass.m, myclass.l, myclass.p, myclass.s), myclass.s));
assert(isequal(hn(myclass.m, myclass.p), myclass.p));
assert(isequal(hn(myclass.m, myclass.p, myclass.s), myclass.s));
assert(isequal(hn(myclass.s), myclass.s));
assert(isequal(hn(myclass.so), myclass.s));
assert(isequal(hn(myclass.l), myclass.l));
assert(isequal(hn(myclass.l, myclass.s), myclass.s));
assert(isequal(hn(myclass.l, myclass.p), myclass.p));
assert(isequal(hn(myclass.l, myclass.p, myclass.s), myclass.s));
assert(isequal(hn(myclass.p), myclass.p));
assert(isequal(hn(myclass.p, myclass.s), myclass.s));

% hm,
% hm->s, hm->so,
% hm->l, hm->l->s,hm->l->p, hm->l->p->s,
% hm->p, hm->p->s,
hm = obj.call(myclass.hm);
assert(isequal(hm(obj), myclass.m));
assert(isequal(hm(obj, myclass.s), myclass.s));
assert(isequal(hm(obj, myclass.so), myclass.s));
assert(isequal(hm(obj, myclass.l), myclass.l));
assert(isequal(hm(obj, myclass.l, myclass.s), myclass.s));
assert(isequal(hm(obj, myclass.l, myclass.p), myclass.p));
assert(isequal(hm(obj, myclass.l, myclass.p, myclass.s), myclass.s));
assert(isequal(hm(obj, myclass.p), myclass.p));
assert(isequal(hm(obj, myclass.p, myclass.s), myclass.s));

% hmo,
% hmo->s, hmo->so,
% hmo->l, hmo->l->s, hmo->l->p, hmo->l->p->s,
% hmo->p, hmo->p->s
hmo = obj.call(myclass.hmo);
assert(isequal(hmo(), myclass.m));
assert(isequal(hmo(myclass.s), myclass.s));
assert(isequal(hmo(myclass.so), myclass.s));
assert(isequal(hmo(myclass.l), myclass.l));
assert(isequal(hmo(myclass.l, myclass.s), myclass.s));
assert(isequal(hmo(myclass.l, myclass.p), myclass.p));
assert(isequal(hmo(myclass.l, myclass.p, myclass.s), myclass.s));
assert(isequal(hmo(myclass.p), myclass.p));
assert(isequal(hmo(myclass.p, myclass.s), myclass.s));

% hmvo,
% hmvo->s, hmvo->so,
% hmvo->l, hmvo->l->s, hmvo->l->p, hmvo->l->p->s,
% hmvo->p, hmvo->p->s
hmvo = obj.call(myclass.hmvo);
assert(isequal(hmvo(), myclass.m));
assert(isequal(hmvo(myclass.s), myclass.s));
assert(isequal(hmvo(myclass.so), myclass.s));
assert(isequal(hmvo(myclass.l), myclass.l));
assert(isequal(hmvo(myclass.l, myclass.s), myclass.s));
assert(isequal(hmvo(myclass.l, myclass.p), myclass.p));
assert(isequal(hmvo(myclass.l, myclass.p, myclass.s), myclass.s));
assert(isequal(hmvo(myclass.p), myclass.p));
assert(isequal(hmvo(myclass.p, myclass.s), myclass.s));

% hs,
% hs->l, hs->l->s, hs->l->p, hs->l->p->s,
% hs->p, hs->p->s
hs = obj.call(myclass.hs);
assert(isequal(hs(), myclass.s));
assert(isequal(hs(myclass.l), myclass.l));
assert(isequal(hs(myclass.l, myclass.s), myclass.s));
assert(isequal(hs(myclass.l, myclass.p), myclass.p));
assert(isequal(hs(myclass.l, myclass.p, myclass.s), myclass.s));
assert(isequal(hs(myclass.p), myclass.p));
assert(isequal(hs(myclass.p, myclass.s), myclass.s));

% hsv,
% hsv->l, hsv->l->s,, hsv->l->p, hsv->l->p->s,
% hsv->p, hsv->p->s,
hsv = obj.call(myclass.hsv);
assert(isequal(hsv(), myclass.s));
assert(isequal(hsv(myclass.l), myclass.l));
assert(isequal(hsv(myclass.l, myclass.s), myclass.s));
assert(isequal(hsv(myclass.l, myclass.p), myclass.p));
assert(isequal(hsv(myclass.l, myclass.p, myclass.s), myclass.s));
assert(isequal(hsv(myclass.p), myclass.p));
assert(isequal(hsv(myclass.p, myclass.s), myclass.s));

% hso,
% hso->l, hso->l->s, hso->l->p, hso->l->p->s,
% hso->p, hso->p->s,
hso = obj.call(myclass.hso);
assert(isequal(hso(), myclass.s));
assert(isequal(hso(myclass.l), myclass.l));
assert(isequal(hso(myclass.l, myclass.s), myclass.s));
assert(isequal(hso(myclass.l, myclass.p), myclass.p));
assert(isequal(hso(myclass.l, myclass.p, myclass.s), myclass.s));
assert(isequal(hso(myclass.p), myclass.p));
assert(isequal(hso(myclass.p, myclass.s), myclass.s));

% hsvo,
% hsvo->l, hsvo->l->s,, hsvo->l->p, hsvo->l->p->s,
% hsvo->p, hsvo->p->s,
hsvo = obj.call(myclass.hsvo);
assert(isequal(hsvo(), myclass.s));
assert(isequal(hsvo(myclass.l), myclass.l));
assert(isequal(hsvo(myclass.l, myclass.s), myclass.s));
assert(isequal(hsvo(myclass.l, myclass.p), myclass.p));
assert(isequal(hsvo(myclass.l, myclass.p, myclass.s), myclass.s));
assert(isequal(hsvo(myclass.p), myclass.p));
assert(isequal(hsvo(myclass.p, myclass.s), myclass.s));

% hl, hl->s, hl->p, hl->p->s
hl = obj.call(myclass.hl);
assert(isequal(hl(), myclass.l));
assert(isequal(hl(myclass.s), myclass.s));
assert(isequal(hl(myclass.p), myclass.p));
assert(isequal(hl(myclass.p, myclass.s), myclass.s));

% hp, hp->s, hp->s->l
% [assert throws]: hp->l
hp = obj.call(myclass.hp);
assert(isequal(hp(), myclass.p));
assert(isequal(hp(myclass.s), myclass.s));
err = false; try hp(myclass.l); catch, err = true; end, assert(err);
assert(isequal(hp(myclass.s, myclass.l), myclass.l));

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
