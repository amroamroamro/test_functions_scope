function ret = myfcn(varargin)
    ret = 'mypkg.function';
    if nargin > 0
        switch varargin{1}
            case mypkg.myclass.s
                ret = mypkg.myclass.static_function(varargin{2:end});
            case mypkg.myclass.s2
                ret = mypkg.myclass.static2_function(varargin{2:end});
            case mypkg.myclass.hs
                ret = @mypkg.myclass.static_function;
            case mypkg.myclass.hsv
                ret = @(varargin) mypkg.myclass.static_function(varargin{:});
            case mypkg.myclass.hs2
                ret = @mypkg.myclass.static2_function;
            case mypkg.myclass.hs2v
                ret = @(varargin) mypkg.myclass.static2_function(varargin{:});
        end
    end
end
