function ret = method2_function(obj, varargin)
    ret = 'method2_function';
    if nargin > 1
        switch varargin{1}
            case mypkg.mysubpkg.myclass.m
                ret = obj.method_function(varargin{2:end});
            case mypkg.mysubpkg.myclass.s
                ret = mypkg.mysubpkg.myclass.static_function(varargin{2:end});
            case mypkg.mysubpkg.myclass.so
                ret = obj.static_function(varargin{2:end});
            case mypkg.mysubpkg.myclass.s2
                ret = mypkg.mysubpkg.myclass.static2_function(varargin{2:end});
            case mypkg.mysubpkg.myclass.s2o
                ret = obj.static2_function(varargin{2:end});
            case mypkg.mysubpkg.myclass.p
                ret = private_function(varargin{2:end});
            case mypkg.mysubpkg.myclass.hs
                ret = @mypkg.mysubpkg.myclass.static_function;
            case mypkg.mysubpkg.myclass.hsv
                ret = @(varargin) mypkg.mysubpkg.myclass.static_function(varargin{:});
            case mypkg.mysubpkg.myclass.hso
                ret = @obj.static_function;
            case mypkg.mysubpkg.myclass.hsvo
                ret = @(varargin) obj.static_function(varargin{:});
            case mypkg.mysubpkg.myclass.hs2
                ret = @mypkg.mysubpkg.myclass.static2_function;
            case mypkg.mysubpkg.myclass.hs2v
                ret = @(varargin) mypkg.mysubpkg.myclass.static2_function(varargin{:});
            case mypkg.mysubpkg.myclass.hs2o
                ret = @obj.static2_function;
            case mypkg.mysubpkg.myclass.hs2vo
                ret = @(varargin) obj.static2_function(varargin{:});
            case mypkg.mysubpkg.myclass.hp
                ret = @private_function;
        end
    end
end
