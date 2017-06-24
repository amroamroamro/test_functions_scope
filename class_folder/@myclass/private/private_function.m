function ret = private_function(varargin)
    ret = 'private_function';
    if nargin > 0
        switch varargin{1}
            case myclass.s
                ret = myclass.static_function(varargin{2:end});
            case myclass.s2
                ret = myclass.static2_function(varargin{2:end});
            case myclass.hsv
                ret = @(varargin) myclass.static_function(varargin{:});
            case myclass.hs2v
                ret = @(varargin) myclass.static2_function(varargin{:});
        end
    end
end
