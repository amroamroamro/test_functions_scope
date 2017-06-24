function ret = method2_function(obj, varargin)
    ret = 'method2_function';
    if nargin > 1
        switch varargin{1}
            case myclass.m
                ret = obj.method_function(varargin{2:end});
            case myclass.s
                ret = myclass.static_function(varargin{2:end});
            case myclass.so
                ret = obj.static_function(varargin{2:end});
            case myclass.s2
                ret = myclass.static2_function(varargin{2:end});
            case myclass.s2o
                ret = obj.static2_function(varargin{2:end});
            case myclass.p
                ret = private_function(varargin{2:end});
            case myclass.hs
                ret = @myclass.static_function;
            case myclass.hsv
                ret = @(varargin) myclass.static_function(varargin{:});
            case myclass.hso
                ret = @obj.static_function;
            case myclass.hsvo
                ret = @(varargin) obj.static_function(varargin{:});
            case myclass.hs2
                ret = @myclass.static2_function;
            case myclass.hs2v
                ret = @(varargin) myclass.static2_function(varargin{:});
            case myclass.hs2o
                ret = @obj.static2_function;
            case myclass.hs2vo
                ret = @(varargin) obj.static2_function(varargin{:});
            case myclass.hp
                ret = @private_function;
        end
    end
end
