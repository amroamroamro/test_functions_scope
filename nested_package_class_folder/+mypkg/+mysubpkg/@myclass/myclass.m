classdef myclass

    properties (Constant)
        % functions
        n = 'nested_function';
        m = 'method_function';
        m2 = 'method2_function';
        s = 'static_function';
        so = 'obj.static_function';
        s2 = 'static2_function';
        s2o = 'obj.static2_function';
        l = 'local_function';
        p = 'private_function';
        % function handles
        hn = '@nested_function';
        hm = '@method_function';
        hmo = '@obj.method_function';
        hmvo = '@(varargin)obj.method_function(varargin{:})';
        hm2 = '@method2_function';
        hm2o = '@obj.method2_function';
        hm2vo = '@(varargin)obj.method2_function(varargin{:})';
        hs = '@mypkg.mysubpkg.myclass.static_function';
        hsv = '@(varargin)mypkg.mysubpkg.myclass.static_function(varargin{:})';
        hso = '@obj.static_function';
        hsvo = '@(varargin)obj.static_function(varargin{:})';
        hs2 = '@mypkg.mysubpkg.myclass.static2_function';
        hs2v = '@(varargin)mypkg.mysubpkg.myclass.static2_function(varargin{:})';
        hs2o = '@obj.static2_function';
        hs2vo = '@(varargin)obj.static2_function(varargin{:})';
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
                case mypkg.mysubpkg.myclass.m2
                    ret = obj.method2_function(varargin{:});
                case mypkg.mysubpkg.myclass.s
                    ret = mypkg.mysubpkg.myclass.static_function(varargin{:});
                case mypkg.mysubpkg.myclass.so
                    ret = obj.static_function(varargin{:});
                case mypkg.mysubpkg.myclass.s2
                    ret = mypkg.mysubpkg.myclass.static2_function(varargin{:});
                case mypkg.mysubpkg.myclass.s2o
                    ret = obj.static2_function(varargin{:});
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
                case mypkg.mysubpkg.myclass.hm2
                    ret = @method2_function;
                case mypkg.mysubpkg.myclass.hm2o
                    ret = @obj.method2_function;
                case mypkg.mysubpkg.myclass.hm2vo
                    ret = @(varargin) obj.method2_function(varargin{:});
                case mypkg.mysubpkg.myclass.hs
                    ret = @mypkg.mysubpkg.myclass.static_function;
                case mypkg.mysubpkg.myclass.hsv
                    ret = @(varargin) mypkg.mysubpkg.myclass.static_function(varargin{:});
                case mypkg.mysubpkg.myclass.hso
                    ret = @obj.static_function;
                case mypkg.mysubpkg.myclass.hsvo
                    ret = @(varargin) obj.static_function(varargin{:});
                case mypkg.mysubpkg.myclass.hs2
                    ret = @mypkg.mysubpkg.myclass.static2_function;
                case mypkg.mysubpkg.myclass.hs2v
                    ret = @(varargin) mypkg.mysubpkg.myclass.static2_function(varargin{:});
                case mypkg.mysubpkg.myclass.hs2o
                    ret = @obj.static2_function;
                case mypkg.mysubpkg.myclass.hs2vo
                    ret = @(varargin) obj.static2_function(varargin{:});
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
                        case mypkg.mysubpkg.myclass.m2
                            ret = obj.method2_function(varargin{2:end});
                        case mypkg.mysubpkg.myclass.s
                            ret = mypkg.mysubpkg.myclass.static_function(varargin{2:end});
                        case mypkg.mysubpkg.myclass.so
                            ret = obj.static_function(varargin{2:end});
                        case mypkg.mysubpkg.myclass.s2
                            ret = mypkg.mysubpkg.myclass.static2_function(varargin{2:end});
                        case mypkg.mysubpkg.myclass.s2o
                            ret = obj.static2_function(varargin{2:end});
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
                        case mypkg.mysubpkg.myclass.hm2
                            ret = @method2_function;
                        case mypkg.mysubpkg.myclass.hm2o
                            ret = @obj.method2_function;
                        case mypkg.mysubpkg.myclass.hm2vo
                            ret = @(varargin) obj.method2_function(varargin{:});
                        case mypkg.mysubpkg.myclass.hs
                            ret = @mypkg.mysubpkg.myclass.static_function;
                        case mypkg.mysubpkg.myclass.hsv
                            ret = @(varargin) mypkg.mysubpkg.myclass.static_function(varargin{:});
                        case mypkg.mysubpkg.myclass.hso
                            ret = @obj.static_function;
                        case mypkg.mysubpkg.myclass.hsvo
                            ret = @(varargin) obj.static_function(varargin{:});
                        case mypkg.mysubpkg.myclass.hs2
                            ret = @mypkg.mysubpkg.myclass.static2_function;
                        case mypkg.mysubpkg.myclass.hs2v
                            ret = @(varargin) mypkg.mysubpkg.myclass.static2_function(varargin{:});
                        case mypkg.mysubpkg.myclass.hs2o
                            ret = @obj.static2_function;
                        case mypkg.mysubpkg.myclass.hs2vo
                            ret = @(varargin) obj.static2_function(varargin{:});
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
                    case mypkg.mysubpkg.myclass.m2
                        ret = obj.method2_function(varargin{2:end});
                    case mypkg.mysubpkg.myclass.s
                        ret = mypkg.mysubpkg.myclass.static_function(varargin{2:end});
                    case mypkg.mysubpkg.myclass.so
                        ret = obj.static_function(varargin{2:end});
                    case mypkg.mysubpkg.myclass.s2
                        ret = mypkg.mysubpkg.myclass.static2_function(varargin{2:end});
                    case mypkg.mysubpkg.myclass.s2o
                        ret = obj.static2_function(varargin{2:end});
                    case mypkg.mysubpkg.myclass.l
                        ret = local_function(varargin{2:end});
                    case mypkg.mysubpkg.myclass.p
                        ret = private_function(varargin{2:end});
                    case mypkg.mysubpkg.myclass.hm2
                        ret = @method2_function;
                    case mypkg.mysubpkg.myclass.hm2o
                        ret = @obj.method2_function;
                    case mypkg.mysubpkg.myclass.hm2vo
                        ret = @(varargin) obj.method2_function(varargin{:});
                    case mypkg.mysubpkg.myclass.hs
                        ret = @mypkg.mysubpkg.myclass.static_function;
                    case mypkg.mysubpkg.myclass.hsv
                        ret = @(varargin) mypkg.mysubpkg.myclass.static_function(varargin{:});
                    case mypkg.mysubpkg.myclass.hso
                        ret = @obj.static_function;
                    case mypkg.mysubpkg.myclass.hsvo
                        ret = @(varargin) obj.static_function(varargin{:});
                    case mypkg.mysubpkg.myclass.hs2
                        ret = @mypkg.mysubpkg.myclass.static2_function;
                    case mypkg.mysubpkg.myclass.hs2v
                        ret = @(varargin) mypkg.mysubpkg.myclass.static2_function(varargin{:});
                    case mypkg.mysubpkg.myclass.hs2o
                        ret = @obj.static2_function;
                    case mypkg.mysubpkg.myclass.hs2vo
                        ret = @(varargin) obj.static2_function(varargin{:});
                    case mypkg.mysubpkg.myclass.hl
                        ret = @local_function;
                    case mypkg.mysubpkg.myclass.hp
                        ret = @private_function;
                end
            end
        end

        ret = method2_function(obj, varargin)
    end

    methods (Static)
        function ret = static_function(varargin)
            ret = 'static_function';
            if nargin > 0
                switch varargin{1}
                    case mypkg.mysubpkg.myclass.s2
                        ret = mypkg.mysubpkg.myclass.static2_function(varargin{2:end});
                    case mypkg.mysubpkg.myclass.l
                        ret = local_function(varargin{2:end});
                    case mypkg.mysubpkg.myclass.p
                        ret = private_function(varargin{2:end});
                    case mypkg.mysubpkg.myclass.hs2
                        ret = @mypkg.mysubpkg.myclass.static2_function;
                    case mypkg.mysubpkg.myclass.hs2v
                        ret = @(varargin) mypkg.mysubpkg.myclass.static2_function(varargin{:});
                    case mypkg.mysubpkg.myclass.hl
                        ret = @local_function;
                    case mypkg.mysubpkg.myclass.hp
                        ret = @private_function;
                end
            end
        end

        ret = static2_function(varargin)
    end

end

function ret = local_function(varargin)
    ret = 'local_function';
    if nargin > 0
        switch varargin{1}
            case mypkg.mysubpkg.myclass.s
                ret = mypkg.mysubpkg.myclass.static_function(varargin{2:end});
            case mypkg.mysubpkg.myclass.s2
                ret = mypkg.mysubpkg.myclass.static2_function(varargin{2:end});
            case mypkg.mysubpkg.myclass.p
                ret = private_function(varargin{2:end});
            case mypkg.mysubpkg.myclass.hs
                ret = @mypkg.mysubpkg.myclass.static_function;
            case mypkg.mysubpkg.myclass.hsv
                ret = @(varargin) mypkg.mysubpkg.myclass.static_function(varargin{:});
            case mypkg.mysubpkg.myclass.hs2
                ret = @mypkg.mysubpkg.myclass.static2_function;
            case mypkg.mysubpkg.myclass.hs2v
                ret = @(varargin) mypkg.mysubpkg.myclass.static2_function(varargin{:});
            case mypkg.mysubpkg.myclass.hp
                ret = @private_function;
        end
    end
end
