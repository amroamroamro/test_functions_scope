classdef myclass

    properties (Constant)
        % functions
        n = 'nested_function';
        m = 'method_function';
        s = 'static_function';
        so = 'obj.static_function';
        p = 'private_function';
        % function handles
        hmvo = '@(varargin)obj.method_function(varargin{:})';
        hsv = '@(varargin)mypkg.myclass.static_function(varargin{:})';
        hsvo = '@(varargin)obj.static_function(varargin{:})';
        hp = '@private_function';
    end

    methods
        function obj = myclass()
        end

        function ret = call(obj, func, varargin)
            switch func
                case mypkg.myclass.n
                    ret = nested_function(varargin{:});
                case mypkg.myclass.m
                    ret = obj.method_function(varargin{:});
                case mypkg.myclass.s
                    ret = mypkg.myclass.static_function(varargin{:});
                case mypkg.myclass.so
                    ret = obj.static_function(varargin{:});
                case mypkg.myclass.hmvo
                    ret = @(varargin) obj.method_function(varargin{:});
                case mypkg.myclass.hsv
                    ret = @(varargin) mypkg.myclass.static_function(varargin{:});
                case mypkg.myclass.hsvo
                    ret = @(varargin) obj.static_function(varargin{:});
                otherwise
                    ret = '';
            end

            function ret = nested_function(varargin)
                ret = 'nested_function';
                if nargin > 0
                    switch varargin{1}
                        case mypkg.myclass.m
                            %ret = obj.method_function(varargin{2:end});
                            ret = method_function(obj, varargin{2:end});
                        case mypkg.myclass.s
                            ret = mypkg.myclass.static_function(varargin{2:end});
                        case mypkg.myclass.so
                            ret = obj.static_function(varargin{2:end});
                        case mypkg.myclass.hmvo
                            ret = @(varargin) obj.method_function(varargin{:});
                        case mypkg.myclass.hsv
                            ret = @(varargin) mypkg.myclass.static_function(varargin{:});
                        case mypkg.myclass.hsvo
                            ret = @(varargin) obj.static_function(varargin{:});
                    end
                end
            end
        end

        function ret = method_function(obj, varargin)
            ret = 'method_function';
            if nargin > 1
                switch varargin{1}
                    case mypkg.myclass.s
                        ret = mypkg.myclass.static_function(varargin{2:end});
                    case mypkg.myclass.so
                        ret = obj.static_function(varargin{2:end});
                    case mypkg.myclass.hsv
                        ret = @(varargin) mypkg.myclass.static_function(varargin{:});
                    case mypkg.myclass.hsvo
                        ret = @(varargin) obj.static_function(varargin{:});
                end
            end
        end
    end

    methods (Static)
        function ret = static_function(varargin)
            ret = 'static_function';
        end
    end

end
