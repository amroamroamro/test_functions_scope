function ret = private_function(varargin)
    ret = 'private_function';
    if nargin > 0
        switch varargin{1}
            case mypkg.mysubpkg.myclass.s
                ret = mypkg.mysubpkg.myclass.static_function(varargin{2:end});
            case mypkg.mysubpkg.myclass.hs
                ret = @mypkg.mysubpkg.myclass.static_function;
            case mypkg.mysubpkg.myclass.hsv
                ret = @(varargin) mypkg.mysubpkg.myclass.static_function(varargin{:});

            % for testing errors:
            % private_function cant reach local_function (not directly)
            case mypkg.mysubpkg.myclass.l
                ret = local_function(varargin{2:end});
            case mypkg.mysubpkg.myclass.hl
                ret = @local_function;
        end
    end
end
