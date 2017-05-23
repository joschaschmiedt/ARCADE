%% Visual stimuli for ARCADE
% Stimuli are created invisibly in the task script before the creation of the trial
% states. They can then be manipulated (made visible, moved, ...) in the
% |onEntry| and |onExit| functions of the trial states.
% Possible stimuli are described here. A stimulus is created by calling the
% stimulus type class and storing it in a variable, e.g.
% 
%   stim = MyStimulus;
% 
% |MyStimulus| is the type of stimulus, e.g. |Grating|, |Image|, |Rectangle|, ...
% Stimulus properties can be then be changed in two ways. Either by directly
% setting the property, similar to changing fields of a struct array, e.g.
%
%   stim.property = 3.14;
%
% or by using the |set| command, similar to how figures and axes can be
% manipulated in MATLAB, e.g.,
%
%   set(stim, 'property', 3.14)
%
% Only the latter variant can be used in the |onEntry| and |onExit|
% functions of trial states. The former variant is useful for testing your
% stimuli. To see all properties of a stimulus, use
%   |properties('MyStimulus')|, e.g. |properties('Rectangle')|
%
% To ensure stable operation of ARCADE, all stimuli should be explicitly
% deleted at the end of a trial, e.g. in a |cleanUp| state by issuing
%
%   stim.delete()
% 
%
% *Testing stimuli*
% 
% All stimuli can be tested from any open MATLAB if ARCADE is in the
% MATLAB search path and |ARCADE/arcade/StimServer/StimServer.exe| is running.
% The first command in such a test environment has to be
%
%   StimServer.Connect()
% 
% This command is not necessary in the actual trial script.

%% General stimulus properties
% All stimuli share a few properties. They can be made visible, repositioned,
% protected from clearing or animated (smoothly translated)
properties('Stimulus')
%%
% Visibility can be |true| for on or |false| for off. The |animation| property is empty by
% default and can be set if a stimulus should be animated (see below). 
% Coordinates are usually in pixels. The stimulus |position| is always relative
% to the screen center. Angles are defined in degree with 0 being rightward
% (--) and 90 upward (|). 
% 
% Colors are always specified as 24-bit RGB values, e.g. [255 255 255] for
% white and [0 0 0] for black. Alpha values range from fully transparent
% (0) to fully opaque (255).
% 
% _Note_ : For displays with an even number of pixels is
% actually between the two center pixels. To achieve pixel-perfect display of
% stimuli one should add 0.5 to the coordinate. 

%% Circles
% Filled circles can be created as a |Circle|. Type 1 circles are filled, 
% type 2 circles are outlined circles (5 px width, currently not flexible).
properties('Circle')
%%
% *Example*
%
circ1 = Circle(1);
circ1.alpha = 200;
circ1.diameter = 400;
circ1.position = [0 0];
circ2 = Circle(2);
circ2.diameter = 50;
circ2.position = [20 100];
circ2.color = [128 0 255];
circ3 = Circle(1);
circ3.diameter = 300;
circ3.color = [0 180 255];
circ3.position = [275 49];
circ3.alpha = 100;
set([circ1, circ2, circ3], 'visible', true)
pause(1)
circ1.delete()
circ2.delete()
circ3.delete()

%%
%
% <<exampleCircle.png>>
%


%% Images
% Possible image formats are BMP, PNG and JPEG. The position can be defined
% as an |[x y]| vector in pixels relative to the screen center. An alpha
% transparency level can be defined between 0 and 255 with 0 being fully
% transparent and 255 fully opaque. Transparency in PNGs is also supported.
properties('Image')
%%
% *Example*
%
imgPath = 'C:\Toolboxes\ARCADE\arcade\Docs';
img =  Image(fullfile(imgPath, 'image.png'));
img.position = [0 0];
img.alpha = 200;
img.angle = 45;

img2 =  Image(fullfile(imgPath, 'image.png'));
img2.position = [200 0];
img2.alpha = 200;
img2.angle = 200;
set([img, img2], 'visible', true)
pause(1)
img.delete()
img2.delete()

%%
%
% <<exampleImage.png>>
%

%% Masked grating
% Masked gratings are implemented as PixelShader stimuli with various
% parameters:
properties('Grating')
%%
% Spatial frequency is defined as |pixelsPerCycle|. Temporal frequency is
% specified via the |animationIncrement| property in units of cycles per
% frame. That is, for a 120 Hz display, a |animationIncrement| value of
% 1/120 will result in a drifting grating at a speed of 1 cycle/s. 
% The mask can be circular or elliptical, and can be rotated.
% The two colors of the grating are specfied as a vector of 8-bit values for
% |[red green blue alpha]|. The |smoothing| parameter is 2 for purely
% sinusoidal gratings. Values > 2 will approach a square wave grating.
%%
% *Example*
%
grat1 = Grating();
grat1.color1 = [255 0 0 200];
grat1.color2 = [0 255 0 200];
grat1.maskRotation = 45;
grat1.maskWidth = 400;
grat1.pixelsPerCycle = 60;
grat1.smoothing = 2;
grat1.animationIncrement = 1/120;
grat1.visible = true;

grat2 = Grating();
grat2.color1 = [255 0 0 200];
grat2.color2 = [0 0 0 200];
grat2.maskRotation = 270;
grat2.maskWidth = 400;
grat2.pixelsPerCycle = 20;
grat2.smoothing = 10;
grat2.animationIncrement = 1/120;
grat2.position = [400 0];
grat2.visible = true;

pause(1);
grat1.delete();
grat2.delete();
%%
%
% <<exampleGrating.png>>
%

%% Rectangles
% Rectangles are always filled and have the following properties:
properties('Rectangle')
%%
% *Example*
%
r1 = Rectangle;
r1.color = [128 0 255];
r1.height = 200;
r1.angle = 45;
r1.alpha = 100;
r1.visible = true;

r2 = Rectangle;
r2.color = [128 255 255];
r2.height = 200;
r2.angle = 180;
r2.alpha = 100;
r2.visible = true;
pause(1)
r1.delete();
r2.delete();
%%
%
% <<exampleRectangle.png>>
%

%% Animations
% Every stimulus can be smoothly moved around on the screen. To animate a
% stimulus, the |animation| parameter of the stimulus should be set with
% the required animation. Currently there are two types of animation
% 
% # |LinearMotion|: This moves the stimulus along a polygon.
% # |GeneralMotion|: This moves the stimulus along an arbitrary path
% defined in a file. *NOT IMPLEMENTED YET*
% 
% The |LinearMotion| needs two input arguments, the |velocity| defined in
% pixels per second at 120 Hz and the |vertices=[x1 y1 x2 y2 ...]|, which are the
% center coordinates that the stimulus will be moved to one after the
% other. The |terminalAction| property defines what happens at the end of
% the animation and is an 8-bit mask. The bits have the following meaning
% 
% 
%    1 disable the assigned stimulus
%    2
%    4 toggle the photodiode signal1
%    8 signal an event (see section 3 on page 4)
%   16 restart animation (cyclic execution)
%   32 
%   64 
%  128 end deferred mode
% 
%%
% *Example*
r = Rectangle;
r.color = [255 255 255];
r.height = 200;
r.angle = 45;

pause(1)
vertices = [0 0 100 0 500 500]; % [x1 y2 x2 y2 x3 y3]
speed = 150; % px/s
a = LinearMotion(speed, vertices);
r.animation = a;
r.visible = true;
%%
%
% <<exampleAnimation.png>>
%


%% Moving Bars
% The |MovingBar| class simplifies the creation of animated bars by
% automatically creating the animation. 
properties('MovingBar')
%%
% Only the |startPosition|, |direction| and |travelDistance| have to bet set.
% If |linkedOrientationDirection| is set, the bar will always be
% orthogonal to the travel direction.
%%
% *Example*
speed = 200;
travelDistance = 500;
mb = MovingBar(speed, travelDistance);
mb.direction = 35;
mb.visible = true;
pause(5)
mb.delete()








