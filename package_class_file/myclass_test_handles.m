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

%% dispatch calls using function handles

% hmvo,
% hmvo->s, hmvo->so
hmvo = obj.call(mypkg.myclass.hmvo);
assert(isequal(hmvo(), mypkg.myclass.m));
assert(isequal(hmvo(mypkg.myclass.s), mypkg.myclass.s));
assert(isequal(hmvo(mypkg.myclass.so), mypkg.myclass.s));

% hsv
hsv = obj.call(mypkg.myclass.hsv);
assert(isequal(hsv(), mypkg.myclass.s));

% hsvo
hsvo = obj.call(mypkg.myclass.hsvo);
assert(isequal(hsvo(), mypkg.myclass.s));

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
