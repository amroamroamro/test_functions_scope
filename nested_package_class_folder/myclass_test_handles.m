%% create object

obj = mypkg.mysubpkg.myclass();

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

%% dispatch calls using function handles

% hmvo, hmvo->m2, hmvo->m2->s, hmvo->m2->so, hmvo->m2->s2, hmvo->m2->s2o,
% hmvo->s, hmvo->so, hmvo->s2, hmvo->s2o
hmvo = obj.call(mypkg.mysubpkg.myclass.hmvo);
assert(isequal(hmvo(), mypkg.mysubpkg.myclass.m));
assert(isequal(hmvo(mypkg.mysubpkg.myclass.m2), mypkg.mysubpkg.myclass.m2));
assert(isequal(hmvo(mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hmvo(mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.so), mypkg.mysubpkg.myclass.s));
assert(isequal(hmvo(mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(hmvo(mypkg.mysubpkg.myclass.m2, mypkg.mysubpkg.myclass.s2o), mypkg.mysubpkg.myclass.s2));
assert(isequal(hmvo(mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hmvo(mypkg.mysubpkg.myclass.so), mypkg.mysubpkg.myclass.s));
assert(isequal(hmvo(mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(hmvo(mypkg.mysubpkg.myclass.s2o), mypkg.mysubpkg.myclass.s2));

% hm2, hm2->m, hm2->m->s, hm2->m->so, hm2->m->s2, hm2->m->s2o,
% hm2->s, hm2->so, hm2->s2, hm2->s2o
hm2 = obj.call(mypkg.mysubpkg.myclass.hm2);
assert(isequal(hm2(obj), mypkg.mysubpkg.myclass.m2));
assert(isequal(hm2(obj, mypkg.mysubpkg.myclass.m), mypkg.mysubpkg.myclass.m));
assert(isequal(hm2(obj, mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hm2(obj, mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.so), mypkg.mysubpkg.myclass.s));
assert(isequal(hm2(obj, mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(hm2(obj, mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.s2o), mypkg.mysubpkg.myclass.s2));
assert(isequal(hm2(obj, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hm2(obj, mypkg.mysubpkg.myclass.so), mypkg.mysubpkg.myclass.s));
assert(isequal(hm2(obj, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(hm2(obj, mypkg.mysubpkg.myclass.s2o), mypkg.mysubpkg.myclass.s2));

% hm2vo, hm2vo->m, hm2vo->m->s, hm2vo->m->so, hm2vo->m->s2, hm2vo->m->s2o,
% hm2vo->s, hm2vo->so, hm2vo->s2, hm2vo->s2o
hm2vo = obj.call(mypkg.mysubpkg.myclass.hm2vo);
assert(isequal(hm2vo(), mypkg.mysubpkg.myclass.m2));
assert(isequal(hm2vo(mypkg.mysubpkg.myclass.m), mypkg.mysubpkg.myclass.m));
assert(isequal(hm2vo(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hm2vo(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.so), mypkg.mysubpkg.myclass.s));
assert(isequal(hm2vo(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(hm2vo(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.s2o), mypkg.mysubpkg.myclass.s2));
assert(isequal(hm2vo(mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hm2vo(mypkg.mysubpkg.myclass.so), mypkg.mysubpkg.myclass.s));
assert(isequal(hm2vo(mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));
assert(isequal(hm2vo(mypkg.mysubpkg.myclass.s2o), mypkg.mysubpkg.myclass.s2));

% hsv, hsv->s2
hsv = obj.call(mypkg.mysubpkg.myclass.hsv);
assert(isequal(hsv(), mypkg.mysubpkg.myclass.s));
assert(isequal(hsv(mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));

% hsvo, hsvo->s2
hsvo = obj.call(mypkg.mysubpkg.myclass.hsvo);
assert(isequal(hsvo(), mypkg.mysubpkg.myclass.s));
assert(isequal(hsvo(mypkg.mysubpkg.myclass.s2), mypkg.mysubpkg.myclass.s2));

% hs2v, hs2v->s
hs2v = obj.call(mypkg.mysubpkg.myclass.hs2v);
assert(isequal(hs2v(), mypkg.mysubpkg.myclass.s2));
assert(isequal(hs2v(mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));

% hs2vo, hs2vo->s
hs2vo = obj.call(mypkg.mysubpkg.myclass.hs2vo);
assert(isequal(hs2vo(), mypkg.mysubpkg.myclass.s2));
assert(isequal(hs2vo(mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));

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
