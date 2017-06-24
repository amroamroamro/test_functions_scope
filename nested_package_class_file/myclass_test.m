%% create object

obj = mypkg.mysubpkg.myclass();

% valid calls graph:
% ------------------
% n             ==> [m, s, so; hmvo, hsv, hsvo]
% m,hmvo        ==> [s, so; hsv, hsvo]
% s,so,hsv,hsvo ==> []
% p             ==> [s; hsv]
%
% note: to avoid repetition, we skip cycles e.g: ...->{s,so}->*

%% direct calls

% m, s, so
% [assert throws]: p
assert(isequal(obj.method_function(), mypkg.mysubpkg.myclass.m));
assert(isequal(mypkg.mysubpkg.myclass.static_function(), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.static_function(), mypkg.mysubpkg.myclass.s));
err = false; try private_function(); catch, err = true; end, assert(err);

%% dispatch calls

% n, n->m, n->m->s, n->m->so,
% n->s, n->so
assert(isequal(obj.call(mypkg.mysubpkg.myclass.n), mypkg.mysubpkg.myclass.n));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.n, mypkg.mysubpkg.myclass.m), mypkg.mysubpkg.myclass.m));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.n, mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.n, mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.so), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.n, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.n, mypkg.mysubpkg.myclass.so), mypkg.mysubpkg.myclass.s));

% m,
% m->s, m->so
assert(isequal(obj.call(mypkg.mysubpkg.myclass.m), mypkg.mysubpkg.myclass.m));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(obj.call(mypkg.mysubpkg.myclass.m, mypkg.mysubpkg.myclass.so), mypkg.mysubpkg.myclass.s));

% s
assert(isequal(obj.call(mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));

% so
assert(isequal(obj.call(mypkg.mysubpkg.myclass.so), mypkg.mysubpkg.myclass.s));
