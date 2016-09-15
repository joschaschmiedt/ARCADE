classdef (Sealed) SGLRewardServer < handle 
    % [SINGKETON]
    
    
    %---------------------------------------------%
    % unknown   - Jarrod, wrote class
    % 21.4.2016 - Jarrod, added some documentation/notes
    
    properties (SetAccess = immutable)
        nidaqObj % daq object
    end
    
    methods (Static)
       function this = launch
            persistent thisObj
            if isempty(thisObj) || ~isvalid(thisObj)
                thisObj = SGLRewardServer;
            end
            this = thisObj;
       end
    end
    
    methods (Access = private)
        %# constructor
        function this = SGLRewardServer
            %# create nidaq object
            rewLine = {'Dev1/port2/line3'}; % reward line

            nidaqObj = mNIDAQ; %#ok<*PROP>       % create object
            nidaqObj.daqmxCreateDOChan(rewLine);
            this.nidaqObj = nidaqObj;
            
            % set the nidaq object as a peristent variable
            % and ensure it starts closed 
            this.mSetRewardBit(0,nidaqObj); 
        end
        
    end
    
    methods (...
            Static = true,...
            Access = private)
        %# set the state of the reward bit
        function mSetRewardBit(state,varargin)
            persistent nidaqObj %#ok<*PUSE>
            
            if ~isempty(varargin)
                nidaqObj = varargin{1};
            end
            % state => 0 == closed, 1 = open
            nidaqObj.daqmxWriteDigitalLines(state);
        end
    end
    
    %# public methods 
    methods 
        %# single pulse
        function mRewardPulse(this,rdur)
            % open, time, close 
            t = tic;
            this.mSetRewardBit(1);
            while toc(t)*1000<rdur
                %java.lang.Thread.sleep(1);
            end
            %disp(['Reward pulse: ', int2str(toc(t)*1000),' / ',int2str(rdur)]);
            this.mSetRewardBit(0);
        end
        %# pulse sequence
        function mRewardSequence(this,duration,iri)
            % make sure they are the same length
            if length(duration) ~= length(iri)
                disp('Warning: Reward Duration and Inter-Reward-Interval vectors are not the same length.');
                return;
            end
            
            % first reward 
            %if length(duration)
            for k = 1:length(duration)
                this.mRewardPulse(duration(k));
                % does this hold up the main tread?
                java.lang.Thread.sleep(iri(k));
            end
        end
        %# general delete function 
        function delete(this)
            delete(this.nidaqObj);
        end
    end

end

