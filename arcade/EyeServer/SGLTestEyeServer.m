classdef SGLTestEyeServer < ABSEyeServer
    
    properties
        fig
        ax
        dot
    end
   
    methods (Static)
        function this = launch
            persistent thisObj
            if isempty(thisObj) || ~isvalid(thisObj)
                thisObj = SGLTestEyeServer;
            end
            this = thisObj;
        end
    end
    
    
    methods ( Access = private )
        function obj = SGLTestEyeServer
            obj = obj@ABSEyeServer;
            
            obj.fig = figure('WindowStyle', 'normal');
            obj.ax = axes('SortMethod','childorder', ...
                'XLim', [-1920 1920]/2, 'YLim', [-1080 1080]/2);
            grid on
            
            obj.dot = line('XData', 0,'YData', 0,...
                'Marker','o','color','k', 'MarkerSize', 40);
            set(obj.fig,'Pointer','circle');
            obj.update();
            set(obj.fig, 'WindowButtonDownFcn', @obj.onClick)
            fprintf('bla')
        end
    end
    methods
        
        
        function obj = onClick(obj, src, callbackdata)
            seltype = get(src,'SelectionType');
            
            if strcmp(seltype,'normal')
                
                
                cp = get(obj.ax,'CurrentPoint');
                x = cp(1,1);
                y = cp(1,2);
                
                set(obj.dot, 'XData', x, 'YData', y)
                obj.update();
            end
            
        end
        
        function obj = update(obj)
            x = get(obj.dot, 'XData');
            y = get(obj.dot, 'yData');
            titleString = sprintf('x=%.1f, y=%.1f', x, y);
            title(obj.ax, titleString)
            obj.sharedMemory.pointer.Value = [x; y];
        end
        
        function obj = start(obj)
            
        end
    end
end