function ret = static2_function(varargin)
    ret = 'static2_function';
    if nargin > 0
        switch varargin{1}
            case myclass.s
                ret = myclass.static_function(varargin{2:end});
            case myclass.p
                ret = private_function(varargin{2:end});
            case myclass.hsv
                ret = @(varargin) myclass.static_function(varargin{:});
            case myclass.hp
                ret = @private_function;
        end
    end
end
