function ret = private_function(varargin)
    ret = 'private_function';
    if nargin > 0
        switch varargin{1}
            case myclass.s
                ret = myclass.static_function(varargin{2:end});
            case myclass.hsv
                ret = @(varargin) myclass.static_function(varargin{:});
        end
    end
end
