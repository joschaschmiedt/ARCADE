function eventmarker(value,varargin)
% Send a digital marker for an event to the DAQ card (if available) and
% store the corresponding timestamp in the .evt file.
% 
% INPUT
% -----
%   value : event code number between 0 and 2^16
% 

% if there is a value, and it is an unsigned 16-bit integer
if ~isempty(value) && isnumeric(value) && value<2^16 && value>=0
    % get event server
    EventServer = SGLEventMarkerServer.launch;
    
    value = round(value); % ensure it is an integer 
    
    if isempty(varargin)
        EventServer.mSendEventMarker(value);% send eventmarker
    else
        EventServer.mSendEventMarker(value,varargin{1});% send eventmarker
    end
end

end

