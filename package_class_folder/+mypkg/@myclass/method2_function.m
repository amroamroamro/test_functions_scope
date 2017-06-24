function ret = method2_function(obj, varargin)
    ret = 'method2_function';
    if nargin > 1
        switch varargin{1}
            case mypkg.myclass.m
                %ret = obj.method_function(varargin{2:end});
                ret = method_function(obj, varargin{2:end});
            case mypkg.myclass.s
                ret = mypkg.myclass.static_function(varargin{2:end});
            case mypkg.myclass.so
                ret = obj.static_function(varargin{2:end});
            case mypkg.myclass.s2
                ret = mypkg.myclass.static2_function(varargin{2:end});
            case mypkg.myclass.s2o
                ret = obj.static2_function(varargin{2:end});
            case mypkg.myclass.hsv
                ret = @(varargin) mypkg.myclass.static_function(varargin{:});
            case mypkg.myclass.hsvo
                ret = @(varargin) obj.static_function(varargin{:});
            case mypkg.myclass.hs2v
                ret = @(varargin) mypkg.myclass.static2_function(varargin{:});
            case mypkg.myclass.hs2vo
                ret = @(varargin) obj.static2_function(varargin{:});
        end
    end
end
