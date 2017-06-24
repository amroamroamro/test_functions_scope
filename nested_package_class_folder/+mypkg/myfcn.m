function ret = myfcn(varargin)
    ret = 'mypkg.function';
    if nargin > 0
        switch varargin{1}
            case mypkg.mysubpkg.myclass.s
                ret = mypkg.mysubpkg.myclass.static_function(varargin{2:end});
            case mypkg.mysubpkg.myclass.s2
                ret = mypkg.mysubpkg.myclass.static2_function(varargin{2:end});
            case mypkg.mysubpkg.myclass.hs
                ret = @mypkg.mysubpkg.myclass.static_function;
            case mypkg.mysubpkg.myclass.hsv
                ret = @(varargin) mypkg.mysubpkg.myclass.static_function(varargin{:});
            case mypkg.mysubpkg.myclass.hs2
                ret = @mypkg.mysubpkg.myclass.static2_function;
            case mypkg.mysubpkg.myclass.hs2v
                ret = @(varargin) mypkg.mysubpkg.myclass.static2_function(varargin{:});
        end
    end
end
