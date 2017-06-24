function ret = method2_function(obj, varargin)
    ret = 'method2_function';
    if nargin > 1
        switch varargin{1}
            case mypkg.myclass.m
                ret = obj.method_function(varargin{2:end});
            case mypkg.myclass.s
                ret = mypkg.myclass.static_function(varargin{2:end});
            case mypkg.myclass.so
                ret = obj.static_function(varargin{2:end});
            case mypkg.myclass.s2
                ret = mypkg.myclass.static2_function(varargin{2:end});
            case mypkg.myclass.s2o
                ret = obj.static2_function(varargin{2:end});
            case mypkg.myclass.p
                ret = private_function(varargin{2:end});
            case mypkg.myclass.hs
                ret = @mypkg.myclass.static_function;
            case mypkg.myclass.hsv
                ret = @(varargin) mypkg.myclass.static_function(varargin{:});
            case mypkg.myclass.hso
                ret = @obj.static_function;
            case mypkg.myclass.hsvo
                ret = @(varargin) obj.static_function(varargin{:});
            case mypkg.myclass.hs2
                ret = @mypkg.myclass.static2_function;
            case mypkg.myclass.hs2v
                ret = @(varargin) mypkg.myclass.static2_function(varargin{:});
            case mypkg.myclass.hs2o
                ret = @obj.static2_function;
            case mypkg.myclass.hs2vo
                ret = @(varargin) obj.static2_function(varargin{:});
            case mypkg.myclass.hp
                ret = @private_function;
        end
    end
end
