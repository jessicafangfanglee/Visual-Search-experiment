%% Assignment 3: Measuring the speed of the attentional scanner 
% Please execute the while loops separately if they don't all work together at the same time. And please be gentle--thank you. 
% Be advised: certain functions can only be executed with matlab version 2016 and above, 

%% Init
clear all
close all
clc

%% Pop-out Search Set size of 4
% In the pop out search, we only have one dimension: the distractors, no
% matter the shape, will have the same color (green), while target will be
% an red x. 

%initialize amount of correct and incorrect trials. 
validTrials=0;
invalidTrials=0;
%initialize the reaction time for pop out search with set of 4 in order to
%compute mean and graph later!
reactionPopout4=nan(20,2);
%initialize index
i=1
j=1
% Set background & constants
% set a figure as background then add text to it!
f1 = figure('units','normalized','outerposition',[0,0,1,1],'color','k')
hello = text(0.5,0.5, 'Welcome! Please press F for when target present and J when target absent!')
hello.FontSize = 20;
hello.FontWeight = 'bold';
hello.HorizontalAlignment = 'center';
hello.Color = 'r';
shg
axis off
pause
delete(hello)

while validTrials < 20
    %randomize trials
    trialProbability=rand
    if trialProbability<0.5
        %Target Present--in this case, there will be a red 'x' as target.
        %We will need 3 green stimuli: 2 green 0's and 1 green x, and a red
        %x.
        
        %green 'o'
        numStim = 2;
        distractorToDisp1 = 'O';
        stimPos = rand(numStim,2); % put the stimuli on random coordinates on the text
        outputDistractor1 = text(stimPos(:,1),stimPos(:,2),distractorToDisp1)
        % Place distractors in the text
        set(outputDistractor1,'color','g')
        set(outputDistractor1,'Fontsize', 40)
        set(outputDistractor1,'Fontweight', 'bold')
        
        %green 'x'
        numStim = 1;
        distractorToDisp2 = 'X';
        stimPos = rand(numStim,2)
        outputDistractor2 = text(stimPos(:,1),stimPos(:,2),distractorToDisp2)
        set(outputDistractor2,'color','g')
        set(outputDistractor2,'Fontsize', 40)
        set(outputDistractor2,'Fontweight', 'bold')
        
        %red 'x' (target)
        targetToDisp = 'x';
        stimPos2 = rand(1,2)
        outputTarget = text(stimPos2(:,1),stimPos2(:,2),targetToDisp)
        set(outputTarget,'color','r')
        set(outputTarget,'Fontsize', 40)
        set(outputTarget,'Fontweight', 'bold')
        
        tic % measuring reaction time
        pause
        
        %Record participants response
        % Participants will be asked to press keys as quickly as possible
        % when stimuli came on. Press F if stimuli present, press J if not
        % present. This will be the same for the future trials in
        % conjunction search as well. 
        userPressedKey(j,1) = get(f1,'CurrentCharacter')
        delete(outputDistractor1)
        delete(outputDistractor2)
        delete(outputTarget)
        % store reaction time according to participant's response
        if strcmp (f1.CurrentCharacter,'f') == 1
            reactionPopout4(j,1)=toc
            validTrials = validTrials + 1; 
            % compare whether participant has followed the instructions and
            % pressed the proper keys. If they have, we will iterate
            % through it and store the number of valid trials for computing
            % reaction time in the future.
        elseif strcmp (f1.CurrentCharacter,'j') == 1
            reactionPopout4(j,1)=0
            invalidTrials = invalidTrials + 1 ;
            % we do not care about the reaction time for invalid trials. So
            % we store the reaction time as 0.
        end
        
    else %Target Absent: a different condition where target is not present. In this case,
        % we only have green stimuli. 2 green 0's and 2 green X's. 
        
        %green 'O'
        numStim = 2;
        stimPos = rand(numStim,2)
        distractor_1 = 'O';
        outputDistractor1 = text(stimPos(:,1),stimPos(:,2),distractor_1)
        set(outputDistractor1,'color','g')
        set(outputDistractor1,'Fontsize', 40)
        set(outputDistractor1,'Fontweight', 'bold')
        
        %green 'x'
        numStim = 2;
        stimPos = rand(numStim,2)
        distractor_2 = 'X';
        outputDistractor2 = text(stimPos(:,1),stimPos(:,2),distractor_2)
        set(outputDistractor2,'color','g')
        set(outputDistractor2, 'Fontsize', 40)
        set(outputDistractor2,'Fontweight', 'bold')
        tic
        pause
        
        delete(outputDistractor1)
        delete(outputDistractor2)
        %User's response for when target is absent. Just like before. 
        userPressedKey(j,1) = get(f1,'CurrentCharacter')

        if strcmp (userPressedKey(j,1),'J') == 1
            reactionPopout4(j,2)=toc
            validTrials= validTrials+1; % iterate through all the trials 
        elseif strcmp (userPressedKey(j,1),'F') == 1
            reactionPopout4(j,2)=0
            invalidTrials=invalidTrials+1;
        end
    end
    j=j+1
end



%% Pop-out Search Set size of 8
% one dimensional search of red target x. We will have equal number 
validTrials=0
invalidTrials=0
ReactionPopout8=nan(20,2); % initialize 20 nans to store reaction time
i=1
j=1
%Background
f2 = figure('units','normalized','outerposition',[0,0,1,1],'color','k')
hello = text(0.5,0.5, 'Welcome! Please press F for when target present and J when target absent!')
hello.FontSize = 20;
hello.FontWeight = 'bold';
hello.HorizontalAlignment = 'center';
hello.Color = 'r';
shg
axis off
pause
delete(hello)

while validTrial<20
    %randomize trials
    trialProbability=rand
    if trialProbability<0.5
        %Target Present
        %Distractors1: 4 green 'o'
        numStim = 4;
        distractor1 = 'O';
        stimPos = rand(numStim,2)
        outputDistractor1 = text(stimPos(:,1),stimPos(:,2),distractor1)
        set(outputDistractor1,'color','g')
        set(outputDistractor1,'Fontsize', 40)
        set(outputDistractor1,'Fontweight', 'bold')
        
        %Distractor2: 3 green 'x'
        numStim = 3;
        distractorToDisp2 = 'x';
        stimPos = rand(numStim,2)
        outputDisplay2 = text(stimPos(:,1),stimPos(:,2),distractorToDisp2)
        set(outputDistractor2,'color','g')
        set(outputDistractor2,'Fontsize', 40)
        set(outputDistractor2,'Fontweight', 'bold')
        
        %Target: red 'x'
        targetToDisp = 'X';
        stimPos2 = rand(1,2)
        outputTarget1 = text(stimPos2(:,1),stimPos2(:,2),targetToDisp)
        set(outputTarget1,'color','r')
        set(outputTarget1,'Fontsize', 40)
        set(outputTarget1,'Fontweight', 'bold')
        tic
        pause
        
        delete(outputDistractor1)
        delete(outputDistractor2)
        delete(outputTarget1)
        
        %Recording response: F for Target Present, J for Target Absent
        userPressedKey(j,1) = get(f2,'CurrentCharacter')
        
        if strcmp (f2.CurrentCharacter,'f') == 1
            ReactionPopout8(j,1)=toc
            validTrials= invalidTrial+1;
        elseif strcmp (f2.CurrentCharacter,'j') == 1
            ReactionPopout8(j,1)=0
            invalidTrials=invalidTrial+1;
        end
        
    else %Target Absent condition. Only green stimuli
        % 4 green 'o'
        numStim = 4;
        distractorToDisp1 = 'O';
        stimPos = rand(numStim,2)
        outputDistractor1 = text(stimPos(:,1),stimPos(:,2),distractorToDisp1)
        set(outputDistractor1,'color','g')
        set(outputDistractor1,'Fontweight', 'bold')
        set(outputDistractor1,'Fontsize', 40)

        % 4 green 'x'
        numStim = 4;
        distractorToDisp2 = 'X';
        stimPos = rand(numStim,2)
        outputDistractor2 = text(stimPos(:,1),stimPos(:,2),distractorToDisp2)
        set(outputDistractor2,'color','g')
        set(outputDistractor2,'Fontsize', 40)
        set(outputDistractor2,'Fontweight', 'bold')
        tic
        pause
        
        %Response
        userPressedKey(j,1) = get(f2,'CurrentCharacter')
        
        delete(outputDistractor1)
        delete(outputDistractor2)
        
        if strcmp (f2.CurrentCharacter,'j') == 1
            ReactionPopout8(j,2)=toc
            validTrials= validTrial+1;
        elseif strcmp (f2.CurrentCharacter,'f') == 1
            ReactionPopout8(j,2)=0
            invalidTrials=invalidTrials+1;
        end
    end
    j=j+1
end

%% Pop-out Search Set size of 12

correctTrials=0
incorrectTrials=0
ReactionPopout12=nan(20,2);
i=1
j=1
%Background
f3 = figure('units','normalized','outerposition',[0,0,1,1],'color','k')
hello = text(0.5,0.5, 'Welcome! Please press F for when target present and J when target absent!')
hello.FontSize = 20;
hello.FontWeight = 'bold';
hello.HorizontalAlignment = 'center';
hello.Color = 'r';
shg
axis off
pause
delete(hello)
while validTrials<20
    %randomize trials
    trialProbability=rand
    if trialProbability<0.5
        %Target Present: 6 green 0s, 5 green xs 1 red x
        %green 'o'
        numStim = 6;
        distractorToDisp1 = 'O';
        stimPos = rand(numStim,2)
        outputDistractor1 = text(stimPos(:,1),stimPos(:,2),distractorToDisp1)
        set(outputDistractor1,'color','g')
        set(outputDistractor1,'Fontsize', 40)
        set(outputDistractor1,'Fontweight', 'bold')
        
        %green 'x'
        numStim = 5;
        distractorToDisp2 = 'X';
        stimPos = rand(numStim,2)
        outputDistractor2 = text(stimPos(:,1),stimPos(:,2),distractorToDisp2)
        set(outputDistractor2,'color','g')
        set(outputDistractor2,'Fontsize', 40)
        set(outputDistractor2,'Fontweight', 'bold')
        
        %target: red x 
        targetToDisp = 'x';
        stimPos2 = rand(1,2)
        outputTarget1 = text(stimPos2(:,1),stimPos2(:,2),targetToDisp)
        set(outputTarget1,'color','r')
        set(outputTarget1,'Fontsize', 40)
        set(outputTarget1,'Fontweight', 'bold')
        tic
        pause
        
        %Response: F for Target Present, J for Target Absent
        userPressedKey(j,1) = get(f3,'CurrentCharacter')
        delete(outputDistractor1)
        delete(outputDistractor2)
        delete(outputTarget)
        
        if strcmp (f3.CurrentCharacter,'f') == 1
            ReactionPopout12(j,1)=toc
            correctTrial= correctTrial+1;
        elseif strcmp (f3.CurrentCharacter,'j') == 1
            ReactionPopout12(j,1)=0
            incorrectTrial=incorrectTrial+1;
        end
        
    else %Target Absent
        
        %6 green 'O'
        numStim = 6;
        distractorToDisp1 = 'o';
        stimPos = rand(numStim,2)
        outputDistractor1 = text(stimPos(:,1),stimPos(:,2),distractorToDisp1)
        set(outputDisplay1,'color','g')
        set(outputDistractor1,'Fontsize', 40)
        set(outputDistractor1,'Fontweight', 'bold')
        
        %6 green 'x'
        numStim = 6;
        distractorToDisp2 = 'x';
        stimPos = rand(numStim,2)
        outputDistractor2 = text(stimPos(:,1),stimPos(:,2),distractorToDisp2)
        set(outputDistractor2, 'color','g')
        set(outputDistractor2,'Fontsize', 40)
        set(outputDistractor2,'Fontweight', 'bold')        
        pause
        
        %Response: F for Target Present, J for Target Absent
        userPressedKey(j,1) = get(f3,'CurrentCharacter')
        delete(outputDistractor1)
        delete(outputDistractor2)
        
        if strcmp (f3.CurrentCharacter,'j') == 1
            ReactionPopout12(j,2)=toc
            validTrials= validTrials+1;
        elseif strcmp (f3.CurrentCharacter,'f') == 1
            RTPopout12(j,2)=0
            invalidTrials=invalidTrial+1;
        end
    end
    j=j+1
end


%% Pop out Search Set size of 16
validTrials=0
invalidTrials=0
ReactionPopout16=nan(20,2);
i=1
j=1
%Background
f4 = figure('units','normalized','outerposition',[0,0,1,1],'color','k')
hello = text(0.5,0.5, 'Welcome! Please press F for when target present and J when target absent!')
hello.FontSize = 20;
hello.FontWeight = 'bold';
hello.HorizontalAlignment = 'center';
hello.Color = 'r';
shg
axis off
pause
delete(hello)

while validTrials<20
    %randomize trials
    trialProbability=rand
    if trialProbability<0.5
        %Target Present: 8 green 0s, 7 green xs 1 red x
        %green 'o'
        numStim = 8;
        distractorToDisp1 = 'O';
        stimPos = rand(numStim,2)
        outputDistractor1 = text(stimPos(:,1),stimPos(:,2),distractorToDisp1)
        set(outputDistractor1,'color','g')
        set(outputDistractor1,'Fontsize', 40)
        set(outputDistractor1,'Fontweight', 'bold')
        
        %green 'x'
        numStim = 8;
        distractorToDisp2 = 'X';
        stimPos = rand(numStim,2)
        outputDistractor2 = text(stimPos(:,1),stimPos(:,2),distractorToDisp2)
        set(outputDistractor2,'color','g')
        set(outputDistractor2,'Fontsize', 40)
        set(outputDistractor2,'Fontweight', 'bold')
        
        %target: red x 
        numStim = 1;
        targetToDisp = 'x';
        stimPos2 = rand(numStim,2)
        outputTarget1 = text(stimPos2(:,1),stimPos2(:,2),targetToDisp)
        set(outputTarget1,'color','r')
        set(outputTarget1,'Fontsize', 40)
        set(outputTarget1,'Fontweight', 'bold')
        tic
        pause
        
        %Response: F for Target Present, J for Target Absent
        userPressedKey(j,1) = get(f4,'CurrentCharacter')
        delete(outputDistractor1)
        delete(outputDistractor2)
        delete(outputTarget)
        
        if strcmp (f4.CurrentCharacter,'f') == 1
            ReactionPopout12(j,1)=toc
            validTrials= validTrial+1;
        elseif strcmp (f4.CurrentCharacter,'j') == 1
            ReactionPopout12(j,1)=0
            invalidTrials=invalidTrials+1;
        end
        
    else %Target Absent--8 green O's and 8 green X's 
        
        %8 green 'O'
        numStim = 8;
        distractorToDisp1 = 'O';
        stimPos = rand(numStim,2)
        outputDistractor1 = text(stimPos(:,1),stimPos(:,2),distractorToDisp1)
        set(outputDisplay1,'color','g')
        set(outputDistractor1,'Fontsize', 40)
        set(outputDistractor1,'Fontweight', 'bold')
        
        %8 green 'x'
        numStim = 8;
        distractorToDisp2 = 'X';
        stimPos = rand(numStim,2)
        outputDistractor2 = text(stimPos(:,1),stimPos(:,2),distractorToDisp2)
        set(outputDisplay2,'color','g')
        set(outputDistractor2,'Fontsize', 40)
        set(outputDistractor2,'Fontweight', 'bold')
        tic
        pause
        
        %Response: F for Target Present, J for Target Absent
        userPressedKey(j,1) = get(f1,'CurrentCharacter')
        delete(outputDistractor1)
        delete(outputDistractor2)
        
        if strcmp (f4.CurrentCharacter,'j') == 1
            ReactionPopout12(j,2)=toc
            validTrials= validTrials+1;
        elseif strcmp (f4.CurrentCharacter,'f') == 1
            ReactionPopout12(j,2)=0
            invalidTrials=invalidTrial+1;
        end
    end
    j=j+1
end


%% Conjunction Search: Set size 4
% in the conjunction search, there exists 2 dimensions. For the set size of 4, we expect that 
% there will be 4 stimuli, 2 of them X and 2 of them O. When the target is present, there will be 
% One green X, one green 0, one red O, and one red X (the target)

% same as before, initialize trials as 0 for computing reaction time later
validTrials=0;
invalidTrials=0;
reactionConj4=nan(20,2);
i=1
j=1
%Background
f5 = figure('units','normalized','outerposition',[0,0,1,1],'color','k')
hello = text(0.5,0.5, 'Welcome! Please press F for when target present and J when target absent!')
hello.FontSize = 20;
hello.FontWeight = 'bold';
hello.HorizontalAlignment = 'center';
hello.Color = 'r';
shg
axis off
pause
delete(hello)axis off

pause(2)
while correctTrial<20
    %randomize trials
    trial = rand;
    if trial<0.5
        %Target Present
        % one green 'O'
        numStim = 1;
        distractorToDisp1 = 'o';
        stimPos = rand(numStim,2)
        outputDistractor1 = text(stimPos(:,1),stimPos(:,2),distractorToDisp1)
        set(outputDistractor1,'color','g')
        set(outputDistractor1,'Fontsize', 40)
        set(outputDistractor1,'Fontweight', 'bold')
        
        % one green 'x'
        numStim = 1;
        distractorToDisp2 = 'x';
        stimPos = rand(numStim,2)
        outputDistractor2 = text(stimPos(:,1),stimPos(:,2),distractorToDisp2)
        set(outputDistractor2,'color','g')
        set(outputDistractor2,'Fontsize', 40)
        set(outputDistractor2,'Fontweight', 'bold')
        
        %one red 'O'
        numStim = 1;
        distractorToDisp3 = 'o';
        stimPos = rand(numStim,2)
        outputDistractor3 = text(stimPos(:,1),stimPos(:,2),distractorToDisp3)
        set(outputDistractor3,'color','g')
        set(outputDistractor3,'Fontsize', 40)
        set(outputDistractor3,'Fontweight', 'bold')
        
        %one red 'X' (target)
        numStim = 1;
        targetToDisp = 'X';
        stimPos2 = rand(1,2)
        outputTarget = text(stimPos2(:,1),stimPos2(:,2),targetToDisp)
        set(outputTarget,'color','r')
        set(outputTarget,'Fontsize', 40)
        set(outputTarget,'Fontweight', 'bold')
        pause
        
        %Response: F for Target Present, J for Target Absent
        userPressedKey(j,1) = get(f5,'CurrentCharacter')
        delete(outputDistractor1)
        delete(outputDistractor2)
        delete(outputDistractor3)
        delete(outputTarget)
        if strcmp (f5.CurrentCharacter,'f') == 1
            reactionConj4(j,1)=toc
            validTrials= validTrials+1;
        elseif strcmp (f5.CurrentCharacter,'j') == 1
            reactionConj4(j,1)=0
            invalidTrials=invalidTrials+1;
        end
        
        
    else %Target Absent-- No red x, but still two red 0's and two green x's
        %2 red 'O'
        numStim = 2;
        distractorToDisp1 = 'O';
        stimPos = rand(numStim,2)
        outputDistractor1 = text(stimPos(:,1),stimPos(:,2),distractorToDisp1)
        set(outputDistractor1,'color','r')
        set(outputDistractor1,'Fontsize', 40)
        set(outputDistractor1,'Fontweight', 'bold')
        
        %2 green 'x'
        numStim = 2;
        distractorToDisp2 = 'X';
        stimPos = rand(numStim,2)
        outputDistractor2 = text(stimPos(:,1),stimPos(:,2),distractorToDisp2)
        set(outputDisplay2,'color','g')
        set(outputDistractor2,'Fontsize', 40)
        set(outputDistractor2,'Fontweight', 'bold')
        tic
        pause
        
        %Response: F for Target Present, J for Target Absent
        userPressedKey(j,1) = get(f5,'CurrentCharacter')
        delete(outputDistractor1)
        delete(outputDistractor2)
        if strcmp (f5.CurrentCharacter,'j') == 1
            reactionConj4(j,2)=toc
            validTrials= validTrials+1;
        elseif strcmp (f5.CurrentCharacter,'f') == 1
            reactionConj4(j,2)=0
            invalidTrials=invalidTrials+1;
        end
    end
    j=j+1
end

%% Conjunction Search: Set size 8
% in the conjunction search, there exists 2 dimensions. For the set size of 8, we expect that 
% there will be 8 stimuli, 4 of them X and 4 of them O. When the target is present, there will be 
% 3 red 0's, 3 green x's and 1 red x (target) and one green 0!

% when the target is absent: four red 0's and four green x's

% same as before, initialize trials as 0 for computing reaction time later
validTrials=0;
invalidTrials=0;
reactionConj8=nan(20,2);
i=1
j=1
%Background
f6 = figure('units','normalized','outerposition',[0,0,1,1],'color','k')
hello = text(0.5,0.5, 'Welcome! Please press F for when target present and J when target absent!')
hello.FontSize = 20;
hello.FontWeight = 'bold';
hello.HorizontalAlignment = 'center';
hello.Color = 'r';
shg
axis off
pause
delete(hello)

% target is present
while correctTrial<20
    %randomize trials
    trial = rand;
    if trial<0.5
        % 3 green 'X'
        numStim = 3;
        distractorToDisp1 = 'X';
        stimPos = rand(numStim,2)
        outputDistractor1 = text(stimPos(:,1),stimPos(:,2),distractorToDisp1)
        set(outputDistractor1,'color','g')
        set(outputDistractor1,'Fontsize', 40)
        set(outputDistractor1,'Fontweight', 'bold')
        
        % one green 'O'
        numStim = 1;
        distractorToDisp2 = 'O';
        stimPos = rand(numStim,2)
        outputDistractor2 = text(stimPos(:,1),stimPos(:,2),distractorToDisp2)
        set(outputDistractor2,'color','g')
        set(outputDistractor2,'Fontsize', 40)
        set(outputDistractor2,'Fontweight', 'bold')
        
        %3 red 'O's
        numStim = 3;
        distractorToDisp3 = 'O';
        stimPos = rand(numStim,2)
        outputDistractor3 = text(stimPos(:,1),stimPos(:,2),distractorToDisp3)
        set(outputDistractor3,'color','r')
        set(outputDistractor3,'Fontsize', 40)
        set(outputDistractor3,'Fontweight', 'bold')
        
        %one red 'X' (target)
        numStim = 1;
        targetToDisp = 'X';
        stimPos2 = rand(1,2)
        outputTarget = text(stimPos2(:,1),stimPos2(:,2),targetToDisp)
        set(outputTarget,'color','r')
        set(outputTarget,'Fontsize', 40)
        set(outputTarget,'Fontweight', 'bold')
        pause
        
        %Response: F for Target Present, J for Target Absent
        userPressedKey(j,1) = get(f6,'CurrentCharacter')
        delete(outputDistractor1)
        delete(outputDistractor2)
        delete(outputDistractor3)
        delete(outputTarget)
        
        if strcmp (f6.CurrentCharacter,'f') == 1
            reactionConj8(j,1)=toc
            validTrials= validTrials+1;
        elseif strcmp (f6.CurrentCharacter,'j') == 1
            reactionConj8(j,1)=0
            invalidTrials=invalidTrials+1;
        end
        
    else %Target Absent-- No red x, but still 4 red 0's and 4 green x's
        %4 red 'O'
        numStim = 4;
        distractorToDisp1 = 'O';
        stimPos = rand(numStim,2)
        outputDistractor1 = text(stimPos(:,1),stimPos(:,2),distractorToDisp1)
        set(outputDistractor1,'color','r')
        set(outputDistractor1,'Fontsize', 40)
        set(outputDistractor1,'Fontweight', 'bold')
        
        % 4 green 'x'
        numStim = 4;
        distractorToDisp2 = 'X';
        stimPos = rand(numStim,2)
        outputDistractor2 = text(stimPos(:,1),stimPos(:,2),distractorToDisp2)
        set(outputDistractor2,'color','g')
        set(outputDistractor2,'Fontsize', 40)
        set(outputDistractor2,'Fontweight', 'bold')
        tic
        pause
        
        %Response: F for Target Present, J for Target Absent
        userPressedKey(j,1) = get(f6,'CurrentCharacter')
        delete(outputDistractor1)
        delete(outputDistractor2)
        
        if strcmp (f6.CurrentCharacter,'j') == 1
            reactionConj8(j,2)=toc
            validTrials= validTrials+1;
        elseif strcmp (f6.CurrentCharacter,'f') == 1
            reactionConj8(j,2)=0
            invalidTrials=invalidTrials+1;
        end
    end
    j=j+1
end

%% Conjunction Search: Set size 12
% when the target is present: 5 red O's, one green o, 5 green x's and one red x
% when the target is absent: six green x's and 6 red o's 

% same as before, initialize trials as 0 for computing reaction time later
validTrials=0;
invalidTrials=0;
reactionConj12=nan(20,2);
i=1
j=1
%Background
f7 = figure('units','normalized','outerposition',[0,0,1,1],'color','k')
hello = text(0.5,0.5, 'Welcome! Please press F for when target present and J when target absent!')
hello.FontSize = 20;
hello.FontWeight = 'bold';
hello.HorizontalAlignment = 'center';
hello.Color = 'r';
shg
axis off
pause
delete(hello)

% target is present
while correctTrial<20
    %randomize trials
    trial = rand;
    if trial<0.5
        % 5 green 'X'
        numStim = 5;
        distractorToDisp1 = 'X';
        stimPos = rand(numStim,2)
        outputDistractor1 = text(stimPos(:,1),stimPos(:,2),distractorToDisp1)
        set(outputDistractor1,'color','g')
        set(outputDistractor1,'Fontsize', 40)
        set(outputDistractor1,'Fontweight', 'bold')
        
        % one green 'O'
        numStim = 1;
        distractorToDisp2 = 'O';
        stimPos = rand(numStim,2)
        outputDistractor2 = text(stimPos(:,1),stimPos(:,2),distractorToDisp2)
        set(outputDistractor2,'color','g')
        set(outputDistractor2,'Fontsize', 40)
        set(outputDistractor2,'Fontweight', 'bold')
        
        %5 red 'O's
        numStim = 5;
        distractorToDisp3 = 'O';
        stimPos = rand(numStim,2)
        outputDistractor3 = text(stimPos(:,1),stimPos(:,2),distractorToDisp3)
        set(outputDistractor3,'color','r')
        set(outputDistractor3,'Fontsize', 40)
        set(outputDistractor3,'Fontweight', 'bold')
        
        %one red 'X' (target)
        numStim = 1;
        targetToDisp = 'X';
        stimPos2 = rand(1,2)
        outputTarget = text(stimPos2(:,1),stimPos2(:,2),targetToDisp)
        set(outputTarget,'color','r')
        set(outputTarget,'Fontsize', 40)
        set(outputTarget,'Fontweight', 'bold')
        pause
        
        %Response: F for Target Present, J for Target Absent
        userPressedKey(j,1) = get(f1,'CurrentCharacter')
        delete(outputDistractor1)
        delete(outputDistractor2)
        delete(outputDistractor3)
        delete(outputTarget)
        
        if strcmp (f7.CurrentCharacter,'f') == 1
            reactionConj12(j,1)=toc
            validTrials= invalidTrials+1;
        elseif strcmp (f7.CurrentCharacter,'j') == 1
            reactionConj12(jj,1)=0
            invalidTrials=invalidTrials+1;
        end
        
%target absent:%Target Absent-- No red x, but still 6 red 0's and 6 green x's        
    else 
        %6 red 'o'
        numStim = 6;
        distractorToDisp1 = 'O';
        stimPos = rand(numStim,2)
        outputDistractor1 = text(stimPos(:,1),stimPos(:,2),distractorToDisp1)
        set(outputDistractor1,'color','r')
        set(outputDistractor1,'Fontsize', 40)
        set(outputDistractor1,'Fontweight', 'bold')
        
        % 6 green 'X'
        numStim = 6;
        distractorToDisp2 = 'X';
        stimPos = rand(numStim,2)
        outputDistractor2 = text(stimPos(:,1),stimPos(:,2),distractorToDisp2)
        set(outputDistractor2,'color','g')
        set(outputDistractor2,'Fontsize', 40)
        set(outputDistractor2,'Fontweight', 'bold')
        tic
        pause
        
        %Response: F for Target Present, J for Target Absent
        userPressedKey(j,1) = get(f1,'CurrentCharacter')
        delete(outputDistractor1)
        delete(outputDistractor2)
        if strcmp (f7.CurrentCharacter,'j') == 1
            reactionConj12(j,2)=toc
            validTrials= validTrials+1;
        elseif strcmp (f7.CurrentCharacter,'f') == 1
            reactionConj12(j,2)=0
            invalidTrials=invalidTrials+1;
        end
    end
    j=j+1
end


%% Conjunction Search: Set size 16
% when the target is present: 7 red O's, one green o, 7 green x's and one red x
% when the target is absent: 8 green x's and 8 red o's 

% same as before, initialize trials as 0 for computing reaction time later
validTrials=0;
invalidTrials=0;
reactionConj16=nan(20,2);
i=1
j=1
%Background
f8 = figure('units','normalized','outerposition',[0,0,1,1],'color','k')
hello = text(0.5,0.5, 'Welcome! Please press F for when target present and J when target absent!')
hello.FontSize = 20;
hello.FontWeight = 'bold';
hello.HorizontalAlignment = 'center';
hello.Color = 'r';
shg
axis off
pause
delete(hello)

% target is present
while correctTrial<20
    %randomize trials
    trial = rand;
    if trial<0.5
        % 7 green 'X'
        numStim = 7;
        distractorToDisp1 = 'X';
        stimPos = rand(numStim,2)
        outputDistractor1 = text(stimPos(:,1),stimPos(:,2),distractorToDisp1)
        set(outputDistractor1,'color','g')
        set(outputDistractor1,'Fontsize', 40)
        set(outputDistractor1,'Fontweight', 'bold')
        
        % one green 'O'
        numStim = 1;
        distractorToDisp2 = 'O';
        stimPos = rand(numStim,2)
        outputDistractor2 = text(stimPos(:,1),stimPos(:,2),distractorToDisp2)
        set(outputDistractor2,'color','g')
        set(outputDistractor2,'Fontsize', 40)
        set(outputDistractor2,'Fontweight', 'bold')
        
        %7 red 'O's
        numStim = 7;
        distractorToDisp3 = 'O';
        stimPos = rand(numStim,2)
        outputDistractor3 = text(stimPos(:,1),stimPos(:,2),distractorToDisp3)
        set(outputDistractor3,'color','r')
        set(outputDistractor3,'Fontsize', 40)
        set(outputDistractor3,'Fontweight', 'bold')
        
        %one red 'X' (target)
        numStim = 1;
        targetToDisp = 'X';
        stimPos2 = rand(1,2)
        outputTarget = text(stimPos2(:,1),stimPos2(:,2),targetToDisp)
        set(outputTarget,'color','r')
        set(outputTarget,'Fontsize', 40)
        set(outputTarget,'Fontweight', 'bold')
        pause
        
        %Response: F for Target Present, J for Target Absent
        userPressedKey(j,1) = get(f8,'CurrentCharacter')
        delete(outputDistractor1)
        delete(outputDistractor2)
        delete(outputDistractor3)
        delete(outputTarget)
        
        if strcmp (f8.CurrentCharacter,'f') == 1
            reactionConj16(j,1)=toc
            validTrials= validTrials+1;
        elseif strcmp (f8.CurrentCharacter,'j') == 1
            reactionConj16(j,1)=0
            invalidTrials=invalidTrials+1;
        end
        
    else %Target Absent-- No red x, but still 8 red 0's and 8 green x's
        % 8 red 'O'
        numStim = 8;
        distractorToDisp1 = 'O';
        stimPos = rand(numStim,2)
        outputDistractor1 = text(stimPos(:,1),stimPos(:,2),distractorToDisp1)
        set(outputDistractor1,'color','r')
        set(outputDistractor1,'Fontsize', 40)
        set(outputDistractor1,'Fontweight', 'bold')
        
        %8 green 'X'
        numStim = 8;
        distractorToDisp2 = 'X';
        stimPos = rand(numStim,2)
        outputDistractor2 = text(stimPos(:,1),stimPos(:,2),distractorToDisp2)
        set(outputDisplay2,'color','g')
        set(outputDistractor2,'Fontsize', 40)
        set(outputDistractor2,'Fontweight', 'bold')
        tic
        pause
        
        %Response: F for Target Present, J for Target Absent
        userPressedKey(j,1) = get(f8,'CurrentCharacter')
        delete(outputDistractor1)
        delete(outputDistractor2)
        
        if strcmp (f8.CurrentCharacter,'j') == 1
            reactionConj16(j,2)=toc
            validTrials= validTrials+1;
        elseif strcmp (f8.CurrentCharacter,'f') == 1
            reactionConj16(j,2)=0
            invalidTrials=invalidTrials+1;
        end
    end
    j=j+1
end

%% Computing reaction time. Find only the valid trials where target is present and target is absent. 
% Since there are 4 levels and 2 types with 2 condiitons, there will be 16 means we need to graph.

%Pop-out 4 Present
reactionPopout4Present=(reactionPopout4(:,1))
reactionPopout4Present=reactionPopout4Present(reactionPopout4Present~=0)

%Pop-out 4 Absent
reactionPopout4Absent=(reactionPopout4(:,2))
reactionPopout4Absent=reactionPopout4Absent(reactionPopout4Absent~=0)

%Pop-out 8 Present
ReactionPopout8Present=(ReactionPopout8(:,1))
ReactionPopout8Present=ReactionPopout8Present(ReactionPopout8Present~=0)

%Pop-out 8 Absent
reactionPopout8Absent=(reactionPopout8(:,2))
reactionPopout8Absent=reactionPopout8Absent(reactionPopout8Absent~=0)

%Pop-out 12 Present
ReactionPopout12Present=(ReactionPopout12(:,1))
ReactionPopout12Present=ReactionPopout12Present(ReactionPopout12Present~=0)

%Pop-out 12 Absent
ReactionPopout12Absent=(ReactionPopout12(:,2))
ReactionPopout12Absent=ReactionPopout12Absent(ReactionPopout12Absent~=0)

%Pop-out 16 Present
ReactionPopout16Present=(ReactionPopout16(:,1))
ReactionPopout16Present=ReactionPopout16Present(ReactionPopout16Present~=0)

%Pop-out 16 Absent
ReactionPopout16Absent=(ReactionPopout12(:,2))
ReactionPopout16Absent=ReactionPopout16Absent(ReactionPopout16Absent~=0)

%Conjunction 4 Present
reactionConj4Present=(reactionConj4=(:,1))
reactionConj4Present=reactionConj4Present(reactionConj4Present~=0)

%Conjunction 4 Absent
reactionConj4Absent=(reactionConj4(:,2))
reactionConj4Absent=reactionConj4Absent(reactionConj4Absent~=0)

%Conjunction 8 Present
reactionConj8Present=(reactionConj8(:,1))
reactionConj8Present=reactionConj8Present(reactionConj8Present~=0)

%Conjunction 8 Absent
reactionConj8Absent=(reactionConj8(:,2))
reactionConj8Absent=reactionConj8Absent(reactionConj8Absent~=0)

%Conjunction 12 Present
reactionConj12Present=(reactionConj12(:,1))
reactionConj12Present=reactionConj12Present(reactionConj12Present~=0)

%Pop-out 12 Absent
reactionConj12Absent=(reactionConj12(:,2))
reactionConj12Absent=reactionConj12Absent(reactionConj12Absent~=0)

%Pop-out 16 Present
reactionConj16Present=(reactionConj16(:,1))
reactionConj16Present=reactionConj16Present(reactionConjPresent~=0)

%Pop-out 16 Absent
reactionConj16Absent=(reactionConj16(:,2))
reactionConj16Absent=reactionConj16Absent(reactionConj16Absent~=0)

%% Compute mean reaction time for four condition
%Popout searches:
popoutPresent = mean([reactionPopout4Present, ReactionPopout8Present, ReactionPopout12Present, ReactionPopout16Present])
popoutAbsent = mean([reactionPopout4Absent,reactionPopout8Absent,ReactionPopout12Absent,ReactionPopout16Absent])

%Conjunction searches
ConjunctionPresent=mean([reactionConj4Present, reactionConj8Present, reactionConj12Present, reaction16Present])
ConjunctionAbsent = mean([reactionConj4Absent, reactionConj8Absent, reactionConj12Absent, reactionConj16Absent])

%% Plotting Data
figure
subplot(1,2,1) % creating one row two cols
x=[4,8,12,16] % the x axis specifies the set size
PopoutPresentLinePlot=plot(x,popoutPresent) 
hold on

ConjunctionPresentLinePlot=plot(x,ConjunctionPresent)
title('Mean Reaction Time for Target Present')
xlabel('Set Size') 
ylabel('Reaction Time (ms)')
legend([PopoutPresentLine,ConjunctionPresentLinePlot],'Pop-out', 'Conjunction')

subplot(1,2,2)
PopoutAbsentLinePlot=plot(x,PopoutAbsent)
hold on
ConjunctionAbsentLinePlot=plot(x,ConjunctionAbsentPlot)
title('Target Absent Mean Reaction Time')
xlabel('Set Size') 
ylabel('Reaction Time(ms)')
legend([PopoutAbsentLinePlot,ConjunctionAbsentLinePlot],'Pop-out', 'Conjunction')
