function ret = private_function(varargin)
    ret = 'private_function';
    if nargin > 0
        switch varargin{1}
            case mypkg.myclass.s
                ret = mypkg.myclass.static_function(varargin{2:end});
            case mypkg.myclass.hs
                ret = @mypkg.myclass.static_function;
            case mypkg.myclass.hsv
                ret = @(varargin) mypkg.myclass.static_function(varargin{:});

            % for testing errors:
            % private_function cant reach local_function (not directly)
            case mypkg.myclass.l
                ret = local_function(varargin{2:end});
            case mypkg.myclass.hl
                ret = @local_function;
        end
    end
end
