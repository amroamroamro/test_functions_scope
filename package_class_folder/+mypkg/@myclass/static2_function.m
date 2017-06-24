function ret = static2_function(varargin)
    ret = 'static2_function';
    if nargin > 0
        switch varargin{1}
            case mypkg.myclass.s
                ret = mypkg.myclass.static_function(varargin{2:end});
            case mypkg.myclass.p
                ret = private_function(varargin{2:end});
            case mypkg.myclass.hs
                ret = @mypkg.myclass.static_function;
            case mypkg.myclass.hsv
                ret = @(varargin) mypkg.myclass.static_function(varargin{:});
            case mypkg.myclass.hp
                ret = @private_function;
        end
    end
end
