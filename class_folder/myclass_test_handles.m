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

%% dispatch calls using function handles

% hmvo, hmvo->m2, hmvo->m2->s, hmvo->m2->so, hmvo->m2->s2, hmvo->m2->s2o,
% hmvo->m2->p, hmvo->m2->p->s, hmvo->m2->p->s2
% hmvo->s, hmvo->so, hmvo->s2, hmvo->s2o
hmvo = obj.call(myclass.hmvo);
assert(isequal(hmvo(), myclass.m));
assert(isequal(hmvo(myclass.m2), myclass.m2));
assert(isequal(hmvo(myclass.m2, myclass.s), myclass.s));
assert(isequal(hmvo(myclass.m2, myclass.so), myclass.s));
assert(isequal(hmvo(myclass.m2, myclass.s2), myclass.s2));
assert(isequal(hmvo(myclass.m2, myclass.s2o), myclass.s2));
assert(isequal(hmvo(myclass.m2, myclass.p), myclass.p));
assert(isequal(hmvo(myclass.m2, myclass.p, myclass.s), myclass.s));
assert(isequal(hmvo(myclass.m2, myclass.p, myclass.s2), myclass.s2));
assert(isequal(hmvo(myclass.s), myclass.s));
assert(isequal(hmvo(myclass.so), myclass.s));
assert(isequal(hmvo(myclass.s2), myclass.s2));
assert(isequal(hmvo(myclass.s2o), myclass.s2));

% hm2, hm2->m, hm2->m->s, hm2->m->so, hm2->m->s2, hm2->m->s2o,
% hm2->s, hm2->so, hm2->s2, hm2->s2o,
% hm2->p, hm2->p->s, hm2->p->s2
hm2 = obj.call(myclass.hm2);
assert(isequal(hm2(obj), myclass.m2));
assert(isequal(hm2(obj, myclass.m), myclass.m));
assert(isequal(hm2(obj, myclass.m, myclass.s), myclass.s));
assert(isequal(hm2(obj, myclass.m, myclass.so), myclass.s));
assert(isequal(hm2(obj, myclass.m, myclass.s2), myclass.s2));
assert(isequal(hm2(obj, myclass.m, myclass.s2o), myclass.s2));
assert(isequal(hm2(obj, myclass.s), myclass.s));
assert(isequal(hm2(obj, myclass.so), myclass.s));
assert(isequal(hm2(obj, myclass.s2), myclass.s2));
assert(isequal(hm2(obj, myclass.s2o), myclass.s2));
assert(isequal(hm2(obj, myclass.p), myclass.p));
assert(isequal(hm2(obj, myclass.p, myclass.s), myclass.s));
assert(isequal(hm2(obj, myclass.p, myclass.s2), myclass.s2));

% hm2vo, hm2vo->m, hm2vo->m->s, hm2vo->m->so, hm2vo->m->s2, hm2vo->m->s2o,
% hm2vo->s, hm2vo->so, hm2vo->s2, hm2vo->s2o,
% hm2vo->p, hm2vo->p->s, hm2vo->p->s2
hm2vo = obj.call(myclass.hm2vo);
assert(isequal(hm2vo(), myclass.m2));
assert(isequal(hm2vo(myclass.m), myclass.m));
assert(isequal(hm2vo(myclass.m, myclass.s), myclass.s));
assert(isequal(hm2vo(myclass.m, myclass.so), myclass.s));
assert(isequal(hm2vo(myclass.m, myclass.s2), myclass.s2));
assert(isequal(hm2vo(myclass.m, myclass.s2o), myclass.s2));
assert(isequal(hm2vo(myclass.s), myclass.s));
assert(isequal(hm2vo(myclass.so), myclass.s));
assert(isequal(hm2vo(myclass.s2), myclass.s2));
assert(isequal(hm2vo(myclass.s2o), myclass.s2));
assert(isequal(hm2vo(myclass.p), myclass.p));
assert(isequal(hm2vo(myclass.p, myclass.s), myclass.s));
assert(isequal(hm2vo(myclass.p, myclass.s2), myclass.s2));

% hsv, hsv->s2
hsv = obj.call(myclass.hsv);
assert(isequal(hsv(), myclass.s));
assert(isequal(hsv(myclass.s2), myclass.s2));

% hsvo, hsvo->s2
hsvo = obj.call(myclass.hsvo);
assert(isequal(hsvo(), myclass.s));
assert(isequal(hsvo(myclass.s2), myclass.s2));

% hs2v, hs2v->s, hs2v->p, hs2v->p->s, hs2v->p->s2
hs2v = obj.call(myclass.hs2v);
assert(isequal(hs2v(), myclass.s2));
assert(isequal(hs2v(myclass.s), myclass.s));
assert(isequal(hs2v(myclass.p), myclass.p));
assert(isequal(hs2v(myclass.p, myclass.s), myclass.s));
assert(isequal(hs2v(myclass.p, myclass.s2), myclass.s2));

% hs2vo, hs2vo->s, hs2vo->p, hs2vo->p->s, hs2vo->p->s2
hs2vo = obj.call(myclass.hs2vo);
assert(isequal(hs2vo(), myclass.s2));
assert(isequal(hs2vo(myclass.s), myclass.s));
assert(isequal(hs2vo(myclass.p), myclass.p));
assert(isequal(hs2vo(myclass.p, myclass.s), myclass.s));
assert(isequal(hs2vo(myclass.p, myclass.s2), myclass.s2));

%% inspect function handles

if true
    fhandles = {hmvo, hm2vo, hsv, hsvo, hs2v, hs2vo};
    names = {'hmvo', 'hm2vo', 'hsv', 'hsvo', 'hs2v', 'hs2vo'};
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
