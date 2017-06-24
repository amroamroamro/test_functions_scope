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
        hsv = '@(varargin)myclass.static_function(varargin{:})';
        hsvo = '@(varargin)obj.static_function(varargin{:})';
        hp = '@private_function';
    end

    methods
        function obj = myclass()
        end

        function ret = call(obj, func, varargin)
            switch func
                case myclass.n
                    ret = nested_function(varargin{:});
                case myclass.m
                    ret = obj.method_function(varargin{:});
                case myclass.s
                    ret = myclass.static_function(varargin{:});
                case myclass.so
                    ret = obj.static_function(varargin{:});
                case myclass.hmvo
                    ret = @(varargin) obj.method_function(varargin{:});
                case myclass.hsv
                    ret = @(varargin) myclass.static_function(varargin{:});
                case myclass.hsvo
                    ret = @(varargin) obj.static_function(varargin{:});
                otherwise
                    ret = '';
            end

            function ret = nested_function(varargin)
                ret = 'nested_function';
                if nargin > 0
                    switch varargin{1}
                        case myclass.m
                            %ret = obj.method_function(varargin{2:end});
                            ret = method_function(obj, varargin{2:end});
                        case myclass.s
                            ret = myclass.static_function(varargin{2:end});
                        case myclass.so
                            ret = obj.static_function(varargin{2:end});
                        case myclass.hmvo
                            ret = @(varargin) obj.method_function(varargin{:});
                        case myclass.hsv
                            ret = @(varargin) myclass.static_function(varargin{:});
                        case myclass.hsvo
                            ret = @(varargin) obj.static_function(varargin{:});
                    end
                end
            end
        end

        function ret = method_function(obj, varargin)
            ret = 'method_function';
            if nargin > 1
                switch varargin{1}
                    case myclass.s
                        ret = myclass.static_function(varargin{2:end});
                    case myclass.so
                        ret = obj.static_function(varargin{2:end});
                    case myclass.hsv
                        ret = @(varargin) myclass.static_function(varargin{:});
                    case myclass.hsvo
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
