%% create object

obj = mypkg.myclass();

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
assert(isequal(obj.method_function(), mypkg.myclass.m));
assert(isequal(mypkg.myclass.static_function(), mypkg.myclass.s));
assert(isequal(obj.static_function(), mypkg.myclass.s));
err = false; try private_function(); catch, err = true; end, assert(err);

%% dispatch calls

% n, n->m, n->m->s, n->m->so,
% n->s, n->so
assert(isequal(obj.call(mypkg.myclass.n), mypkg.myclass.n));
assert(isequal(obj.call(mypkg.myclass.n, mypkg.myclass.m), mypkg.myclass.m));
assert(isequal(obj.call(mypkg.myclass.n, mypkg.myclass.m, mypkg.myclass.s), mypkg.myclass.s));
assert(isequal(obj.call(mypkg.myclass.n, mypkg.myclass.m, mypkg.myclass.so), mypkg.myclass.s));
assert(isequal(obj.call(mypkg.myclass.n, mypkg.myclass.s), mypkg.myclass.s));
assert(isequal(obj.call(mypkg.myclass.n, mypkg.myclass.so), mypkg.myclass.s));

% m,
% m->s, m->so
assert(isequal(obj.call(mypkg.myclass.m), mypkg.myclass.m));
assert(isequal(obj.call(mypkg.myclass.m, mypkg.myclass.s), mypkg.myclass.s));
assert(isequal(obj.call(mypkg.myclass.m, mypkg.myclass.so), mypkg.myclass.s));

% s
assert(isequal(obj.call(mypkg.myclass.s), mypkg.myclass.s));

% so
assert(isequal(obj.call(mypkg.myclass.so), mypkg.myclass.s));
