function ret = myfcn(varargin)
    ret = 'mypkg.mysubpkg.function';
    if nargin > 0
        switch varargin{1}
            case mypkg.mysubpkg.myclass.s
                ret = mypkg.mysubpkg.myclass.static_function(varargin{2:end});
            case mypkg.mysubpkg.myclass.p
                ret = private_function(varargin{2:end});
            case mypkg.mysubpkg.myclass.hs
                ret = @mypkg.mysubpkg.myclass.static_function;
            case mypkg.mysubpkg.myclass.hsv
                ret = @(varargin) mypkg.mysubpkg.myclass.static_function(varargin{:});
            case mypkg.mysubpkg.myclass.hp
                ret = @private_function;
        end
    end
end
