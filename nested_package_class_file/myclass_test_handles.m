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

%% dispatch calls using function handles

% hmvo,
% hmvo->s, hmvo->so
hmvo = obj.call(mypkg.mysubpkg.myclass.hmvo);
assert(isequal(hmvo(), mypkg.mysubpkg.myclass.m));
assert(isequal(hmvo(mypkg.mysubpkg.myclass.s), mypkg.mysubpkg.myclass.s));
assert(isequal(hmvo(mypkg.mysubpkg.myclass.so), mypkg.mysubpkg.myclass.s));

% hsv
hsv = obj.call(mypkg.mysubpkg.myclass.hsv);
assert(isequal(hsv(), mypkg.mysubpkg.myclass.s));

% hsvo
hsvo = obj.call(mypkg.mysubpkg.myclass.hsvo);
assert(isequal(hsvo(), mypkg.mysubpkg.myclass.s));

%% inspect function handles

if true
    fhandles = {hmvo, hsv, hsvo};
    names = {'hmvo', 'hsv', 'hsvo'};
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
