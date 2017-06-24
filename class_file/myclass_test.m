%% create object

obj = myclass();

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
assert(isequal(obj.method_function(), myclass.m));
assert(isequal(myclass.static_function(), myclass.s));
assert(isequal(obj.static_function(), myclass.s));

%% dispatch calls

% n, n->m, n->m->s, n->m->so,
% n->s, n->so
assert(isequal(obj.call(myclass.n), myclass.n));
assert(isequal(obj.call(myclass.n, myclass.m), myclass.m));
assert(isequal(obj.call(myclass.n, myclass.m, myclass.s), myclass.s));
assert(isequal(obj.call(myclass.n, myclass.m, myclass.so), myclass.s));
assert(isequal(obj.call(myclass.n, myclass.s), myclass.s));
assert(isequal(obj.call(myclass.n, myclass.so), myclass.s));

% m,
% m->s, m->so
assert(isequal(obj.call(myclass.m), myclass.m));
assert(isequal(obj.call(myclass.m, myclass.s), myclass.s));
assert(isequal(obj.call(myclass.m, myclass.so), myclass.s));

% s
assert(isequal(obj.call(myclass.s), myclass.s));

% so
assert(isequal(obj.call(myclass.so), myclass.s));
