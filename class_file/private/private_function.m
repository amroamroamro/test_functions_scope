function ret = private_function(varargin)
    ret = 'private_function';
    if nargin > 0
        switch varargin{1}
            case myclass.s
                ret = myclass.static_function(varargin{2:end});
            case myclass.hs
                ret = @myclass.static_function;
            case myclass.hsv
                ret = @(varargin) myclass.static_function(varargin{:});

            % for testing errors:
            % private_function cant reach local_function (not directly)
            case myclass.l
                ret = local_function(varargin{2:end});
            case myclass.hl
                ret = @local_function;
        end
    end
end
