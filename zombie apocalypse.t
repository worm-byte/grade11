% proc zombieattack
%     var x, y, xguess, yguess, numofhits : int
%     numofhits := 0
%     var recentlysaved : string %PROBABLY HAS TO DO WITH THIS
%     var cure : int
%     cure := 0
%     var numofsaved : int
%     numofsaved := 0
%     put "Oh no! You've encountered a zombie! Quick! Guess x & y coordinates to shoot!"
%     randint (x, 100, 580)
%     randint (y, 100, 340)
%     drawfilloval (x, y, 50, 50, 12)
%     loop
%         get xguess
%         get yguess
%         numofhits:=numofhits+1
%         if xguess >= x - 50 and xguess <= x + 50 and yguess >= y - 50 and yguess <= y + 50 then
%             drawdot (x, y, yellow)
%             put "You hit the zombie! You are safe!"
%             exit when xguess >= x - 50 and xguess <= x + 50 and yguess >= y - 50 and yguess <= y + 50
%         elsif
%             if numofhits = 3 then
%                 put "Too many inaccurate shots! The zombie is too close and attacks!"
%                 if numofsaved > 0 then
%                     put recentlysaved, "tries to draw attention away from the zombie."
%                     put "You tell ", recentlysaved, " to stay away. But it's too late."
%                     put "The zombie jumps on ", recentlysaved, " and bites their neck."
%                     put "You know there's nothing more you can do. So you escape"
%                     put "before you're next."
%                 elsif cure > 0 then
%                     put recentlysaved, "tries to draw attention away from the zombie."
%                     put "You tell ", recentlysaved, " to stay away. But it's too late."
%                     put "The zombie jumps on ", recentlysaved, " and bites their neck."
%                     put "You shoot the zombie before things get worse, although"
%                     put recentlysaved, " has been bitten. It won't be long before"
%                     put "they turn into a zombie too. Luckily you have a cure and"
%                     put "decide to use it on ", recentlysaved
%                     exit
%                 else
%                     death
%                 end if
%             else
%
%                 drawdot (x, y, yellow)
%                 put "You missed! Try again!"
%             end if
%         end if
%     end loop
% end zombieattack
%
proc death
    cls
    put "You died trying to save humanity. Well at least you tried."
end death

%TITLE SCREEN
colourback (black)
cls
% setscreen("nocursor")
% setscreen("noecho")
var key : string (1)
var x, y, xguess, yguess, numofhits : int
numofhits := 0
var recentlysaved : string
var numofsaved : int
numofsaved := 0
% locate (11,30)
colour (white)
% put "Zombie Apocalypse"
% locate (12,30)
% delay (2000)
% put "Will you survive?"
% locate (14,26)
% put "Press any key to continue"
% getch (key)
% cls

% %INTRODUCTION
% put "Introduction"
% put "It's only been 7 months since the outspread of the virus, but the world"
% put "as we know it is dwindling away. As more and more people become zombies,"
% put "the odds of survival for humanity is becoming slimmer."
% put "It's a terrible disease, that can only be transmitted through direct contact"
% put "with the bloodstream. Once you've been in contact, it spreads through your body"
% put "like wildfire. Eventually it will reach the brain, and convert you into your"
% put "worse nightmare."
% put "Ringer. That's your name now. You were taken in by a government facility"
% put "and trained to fight and survive in these absurd conditions. Why? Because"
% put "there are still humans out there, and your job is to find them, and bring"
% put "them back to the SAFEHOUSE."
% delay (2000)
% locate (14,1)
% put "Press any key to continue"
% getch (key)
% cls
%
% %INSTRUCTIONS
%
% put "Instructions"
% put "This game is made so that you can 'Choose your own adventure'."
% put "There are different endings to the story, and depending the paths you"
% put "choose, you will stumble upon different situations. A piece of paper"
% put "and pen is required to write things down. It's also important you know"
% put "that the screen coordinates are 649 pixels across (x) and 399 pixels"
% put "wide (y). You may have to hit a target. You must bring at least 2 "
% put "PEOPLE BACK TO THE SAFEHOUSE in order to be successful. The more you
% put "bring back, the better. To make a selection of the path you wish to choose,"
% put "type in the number and press ENTER."
% delay (2000)
% locate (12,1)
% put "Press any key to continue"
% getch (key)
% cls
%
% %READY SCREEN
% put "Are you ready? The game will begin in..."
% delay (1000)
% put 3
% delay (1000)
% put 2
% delay (1000)
% put 1
% delay (1000)
% cls

%GAME
setscreen ("cursor")
setscreen ("echo")
var choice : int
var numofv : array 1 .. 7 of int := init (0, 0, 0, 0, 0, 0, 0)
var food : int
food := 0
var place : string
place := "start"

put "You are dropped off by helicopter in a small town that looks abandoned."
put "As you check your surroundings, you see that there's quite a few places you"
put "can start your mission."
loop
    if place = "start" then
	put "Where would you like to go?"
	put "1. Grocery Store"
	put "2. School"
	put "3. Mountains in the distance"
	put "4. Church"
	put "5. Pharmacy"
	put "6. Arena"
	put "7. Local homes"
	put "8. Back to SAFEHOUSE"
	get choice
	case choice of
	    label 1 :
		place := "grocery store"
	    label 2 :
		place := "school"
	    label 3 :
		place := "mountains"
	    label 4 :
		place := "church"
	    label 5 :
		place := "pharmacy"
	    label 6 :
		place := "arena"
	    label 7 :
		place := "house"
	    label :
		put "That was not an option, try again"
	end case
    elsif place = "grocery store" then
	cls
	numofv (1) := numofv (1) + 1
	put "You head towards the grocery store. There isn't much to see. The place"
	put "is a mess. You approach the front and push roughly at the door that once"
	put "had streams of people coming through. It's unlocked. No surprise there."
	put "You investigate the area, not missing the rotten food strewn on the floor"
	put "with suspicious crimson stains everywhere. You don't have a good feeling"
	put "about this."
	put "What do you do?"
	put "1. Pack whatever food you can find before heading back to start"
	put "2. Trust your instincts and bolt it back to start NOW"
	get choice
	case choice of
	    label 1 :
		if numofv (1) = 2 then
		    % zombieattack
		else
		    cls
		    put "You now have extra food! Never know when you will need it!"
		    place := "start"
		    food := food + 1
		end if
	    label 2 :
		cls
		place := "start"
	    label :
		put "That was not an option, try again"
	end case
    elsif place = "school" then
	cls
	numofv (2) := numofv (2) + 1
	put "You jog over to the local school. The place is abandoned, but it's not"
	put "hard to imagine what this place looked like before the pandemic."
	put "It's eerily quiet. As you examine the halls, your footsteps thunder on the"
	put "tiles, your breaths are sonice booms."
	place := "mainhall"
	loop
	    if place = "mainhall" then
		put "Where would you like to go?"
		put "1. Gymn"
		put "2. Cafe"
		put "3. Library"
		put "4. Back to start"
		get choice
		case choice of
		    label 1 :
			place := "gym"
		    label 2 :
			place := "cafe"
		    label 3 :
			place := "library"
		    label 4 :
		    cls
			place := "start"
			exit
		    label :
			put "That was not an option, try again."
		end case
	    elsif place = "gym" then
		cls
		% zombieattack
		place := "mainhall"
	    elsif place = "cafe" then
		cls
		% zombieattack
		place := "mainhall"
	    elsif place = "library" then
		cls
		put "On your way to the library, you hear some noises from what looks"
		put "like a chemistry room. What do you do?"
		put "1. Check it out, why not"
		put "2. Get the heck out of there! (back to start)"
		get choice
		case choice of
		    label 1 :
			cls
			if numofv (2) > 1 then
			    % zombieattack
			    place := "mainhall"
			else
			    put "You prepare yourself for the worse. You take a deep breath and"
			    put "burst through the door your gun raised and ready to shoot. You're"
			    put "surprised to see a middle-aged woman ruffling through papers in her"
			    put "desk. She's just as surprised to see you, and almost in tears when"
			    put "she realizes you're still human. You lower your gun."
			    put "'Hi, I'm Ringer. I'm here to save you.'"
			    put "'Really? Well we better get out of here before...'"
			    put "You furrow your eyebrows,'Before what?'"
			    put "She doesn't have to answer. A locked cabinet breaks open and out comes"
			    put "the walking dead. You attempt to shoot it down, but all you hear"
			    put "is a clicking noise. What's wrong with your gun? The ammo is full..."
			    put "Ahh, there's no time to figure it out, you have to do something now to"
			    put "get rid of the zombie! You notice bottles of chemicals on the counter"
			    put "closest to you. Just mix up something that will explode when you throw it"
			    put "at the zombie. What do you mix?"
			    put "1. Sodium Hydrochlorite & ethanoic acid"
			    put "2. Caesium & water"
			    put "3. Potassium chlorate & gummy bears"
			    get choice
			    case choice of
				label 1 :
				    cls
				    put "You mix Sodium Hydrochlorite and ethanoic acid, unfortunately this mixture"
				    put "releases toxic gases that kill instantly. The zombie doesn't die, but you do."
				    delay (3000)
				    death
				label 2 :
				    cls
				    put "You mix Caesium and water, and throw it at the zombie. With lightning"
				    put "speed, you grab the teacher's arm and book it out of the room"
				    put "with precious milliseconds left before it explodes."
				    put "The explosion force knocks you both to the ground, but you get"
				    put "back up running pulling her with you. You make it back to the start"
				    put "before finally stopping to catch your breath."
				    put "'How did you know that was in there?' you say between breaths."
				    put "'She was a co-worker of mine that got scratched.' she says softly,"
				    put "'I didn't know what else to do with her except lock her up.'"
				    put "She doesn't need to say more. You have a pretty clear idea of what happened."
				    put "'What's your name?' you ask after some silence."
				    put "'Jennifer' she says. You nod, it doesn't matter anymore if you address her"
				    put "with 'miss' or 'mrs'. You tell her you still have to check out the town"
				    put "before heading back to the Safehouse."
				    recentlysaved := "Jennifer"
				    numofsaved := numofsaved + 1
				    place := "start"
				    exit
				label 3 :
				    put "You mix Potassium chlorate and gummy bears, and throw it at the zombie. "
				    put "With lightning speed, you grab the teacher's arm and book it out of the room"
				    put "with precious milliseconds left before it explodes."
				    put "The explosion force knocks you both to the ground, but you get"
				    put "back up running pulling her with you. You make it back to the start"
				    put "before finally stopping to catch your breath."
				    put "'How did you know that was in there?' you say between breaths."
				    put "'She was a co-worker of mine that got scratched.' she says softly,"
				    put "'I didn't know what else to do with her except lock her up.'"
				    put "She doesn't need to say more. You have a pretty clear idea of what happened."
				    put "'What's your name?' you ask after some silence."
				    put "'Jennifer' she says. You nod, it doesn't matter anymore if you address her"
				    put "with 'miss' or 'mrs'. You tell her you still have to check out the town"
				    put "before heading back to the Safehouse."
				    recentlysaved := "Jennifer"
				    numofsaved := numofsaved + 1
				    place := "start"
				    exit
				label :
				    put "That was not an option, try again"
			    end case
			end if
		    label 2 :
			cls
			place := "mainhall"
		    label :
			put "That was not an option, try again"
		end case
	    end if
	end loop
    end if
end loop


