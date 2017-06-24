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

%% dispatch calls using function handles

% hmvo,
% hmvo->s, hmvo->so
hmvo = obj.call(myclass.hmvo);
assert(isequal(hmvo(), myclass.m));
assert(isequal(hmvo(myclass.s), myclass.s));
assert(isequal(hmvo(myclass.so), myclass.s));

% hsv
hsv = obj.call(myclass.hsv);
assert(isequal(hsv(), myclass.s));

% hsvo
hsvo = obj.call(myclass.hsvo);
assert(isequal(hsvo(), myclass.s));

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
