classdef myclass

    properties (Constant)
        % functions
        n = 'nested_function';
        m = 'method_function';
        s = 'static_function';
        so = 'obj.static_function';
        l = 'local_function';
        p = 'private_function';
        % function handles
        hn = '@nested_function';
        hm = '@method_function';
        hmo = '@obj.method_function';
        hmvo = '@(varargin)obj.method_function(varargin{:})';
        hs = '@mypkg.mysubpkg.myclass.static_function';
        hsv = '@(varargin)mypkg.mysubpkg.myclass.static_function(varargin{:})';
        hso = '@obj.static_function';
        hsvo = '@(varargin)obj.static_function(varargin{:})';
        hl = '@local_function';
        hp = '@private_function';
    end

    methods
        function obj = myclass()
        end

        function ret = call(obj, func, varargin)
            switch func
                case mypkg.mysubpkg.myclass.n
                    ret = nested_function(varargin{:});
                case mypkg.mysubpkg.myclass.m
                    ret = obj.method_function(varargin{:});
                case mypkg.mysubpkg.myclass.s
                    ret = mypkg.mysubpkg.myclass.static_function(varargin{:});
                case mypkg.mysubpkg.myclass.so
                    ret = obj.static_function(varargin{:});
                case mypkg.mysubpkg.myclass.l
                    ret = local_function(varargin{:});
                case mypkg.mysubpkg.myclass.p
                    ret = private_function(varargin{:});
                case mypkg.mysubpkg.myclass.hn
                    ret = @nested_function;
                case mypkg.mysubpkg.myclass.hm
                    ret = @method_function;
                case mypkg.mysubpkg.myclass.hmo
                    ret = @obj.method_function;
                case mypkg.mysubpkg.myclass.hmvo
                    ret = @(varargin) obj.method_function(varargin{:});
                case mypkg.mysubpkg.myclass.hs
                    ret = @mypkg.mysubpkg.myclass.static_function;
                case mypkg.mysubpkg.myclass.hsv
                    ret = @(varargin) mypkg.mysubpkg.myclass.static_function(varargin{:});
                case mypkg.mysubpkg.myclass.hso
                    ret = @obj.static_function;
                case mypkg.mysubpkg.myclass.hsvo
                    ret = @(varargin) obj.static_function(varargin{:});
                case mypkg.mysubpkg.myclass.hl
                    ret = @local_function;
                case mypkg.mysubpkg.myclass.hp
                    ret = @private_function;
                otherwise
                    ret = '';
            end

            function ret = nested_function(varargin)
                ret = 'nested_function';
                if nargin > 0
                    switch varargin{1}
                        case mypkg.mysubpkg.myclass.m
                            ret = obj.method_function(varargin{2:end});
                        case mypkg.mysubpkg.myclass.s
                            ret = mypkg.mysubpkg.myclass.static_function(varargin{2:end});
                        case mypkg.mysubpkg.myclass.so
                            ret = obj.static_function(varargin{2:end});
                        case mypkg.mysubpkg.myclass.l
                            ret = local_function(varargin{2:end});
                        case mypkg.mysubpkg.myclass.p
                            ret = private_function(varargin{2:end});
                        case mypkg.mysubpkg.myclass.hm
                            ret = @method_function;
                        case mypkg.mysubpkg.myclass.hmo
                            ret = @obj.method_function;
                        case mypkg.mysubpkg.myclass.hmvo
                            ret = @(varargin) obj.method_function(varargin{:});
                        case mypkg.mysubpkg.myclass.hs
                            ret = @mypkg.mysubpkg.myclass.static_function;
                        case mypkg.mysubpkg.myclass.hsv
                            ret = @(varargin) mypkg.mysubpkg.myclass.static_function(varargin{:});
                        case mypkg.mysubpkg.myclass.hso
                            ret = @obj.static_function;
                        case mypkg.mysubpkg.myclass.hsvo
                            ret = @(varargin) obj.static_function(varargin{:});
                        case mypkg.mysubpkg.myclass.hl
                            ret = @local_function;
                        case mypkg.mysubpkg.myclass.hp
                            ret = @private_function;
                    end
                end
            end
        end

        function ret = method_function(obj, varargin)
            ret = 'method_function';
            if nargin > 1
                switch varargin{1}
                    case mypkg.mysubpkg.myclass.s
                        ret = mypkg.mysubpkg.myclass.static_function(varargin{2:end});
                    case mypkg.mysubpkg.myclass.so
                        ret = obj.static_function(varargin{2:end});
                    case mypkg.mysubpkg.myclass.l
                        ret = local_function(varargin{2:end});
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
                    case mypkg.mysubpkg.myclass.hl
                        ret = @local_function;
                    case mypkg.mysubpkg.myclass.hp
                        ret = @private_function;
                end
            end
        end
    end

    methods (Static)
        function ret = static_function(varargin)
            ret = 'static_function';
            if nargin > 0
                switch varargin{1}
                    case mypkg.mysubpkg.myclass.l
                        ret = local_function(varargin{2:end});
                    case mypkg.mysubpkg.myclass.p
                        ret = private_function(varargin{2:end});
                    case mypkg.mysubpkg.myclass.hl
                        ret = @local_function;
                    case mypkg.mysubpkg.myclass.hp
                        ret = @private_function;
                end
            end
        end
    end

end

function ret = local_function(varargin)
    ret = 'local_function';
    if nargin > 0
        switch varargin{1}
            case mypkg.mysubpkg.myclass.s
                ret = mypkg.mysubpkg.myclass.static_function(varargin{2:end});
            case mypkg.mysubpkg.myclass.p
                ret = private_function(varargin{2:end});
            case mypkg.mysubpkg.myclass.hs
                ret = @mypkg.mysubpkg.myclass.static_function;
            case mypkg.mysubpkg.myclass.hsv
                ret = @(varargin) mypkg.mysubpkg.myclass.static_function(varargin{:});
            case mypkg.mysubpkg.myclass.hp
                ret = @private_function;
        end
    end
end
