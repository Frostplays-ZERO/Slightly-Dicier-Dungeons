////////////////////////////////////////////////
// DICE YOU CAN USE | UNIVERSAL CLASS EDITION //
////////////////////////////////////////////////
// Credit goes to hunky-dory.github.io        //
// For writing this code, with Jackeea's help.//
////////////////////////////////////////////////
 
// This limit break should never be gotten by witch or jester
var amjester = false;
if(self.name == ~Jester~ || self.name == ~Witch~){
    amjester = true; 
    trace(~How did you get this?~);
};

//Find out what slots the current cards have 
var slotsahoy = [];
var cardpick = [];
var add = [];
 
 
//If class is Jester do this: nothing
if(amjester == true){
    for(i in 0...4){
    //nothing
    };
} else {
    var eq = self.equipment;
    for(i in 0...eq.length){
    //We don't allow the skillcard to be included in the equipment search
        if(eq[i].skillcard == ~~){
            //Find out the card's slot(s)
            add = eq[i].slots;
            //exclude Spare dice cards (can't be combined with other slots anyway) and Locked (robot) cards
            var exclude = [~SPARE1~|~SPARE2~|~SPARE3~|~SPARE4~|~SPARE5~|~SPARE6~|~LOCKED2~|~LOCKED3~|~LOCKED4~|~LOCKED5~|~LOCKED6~|~LOCKED7~];
            if(exclude.indexOf(add[0]) > -1){
                add = [];
            };
            //If it's a counter card, append the countdown while we're here
            if(add[0] == ~COUNTDOWN~){
                add = [~COUNTDOWN~|eq[i].countdown];
                }
            //Deal with NEEDSX cards (if has needstotal -- nb countdown doesn;t have a needstotal value despite equipment.csv)
            // adds in format ["NEEDS"|needstotal|num slots]
            else if(eq[i].needstotal > 0){
                add = [~NEEDS~|eq[i].needstotal|eq[i].slots.length];
            };
 
            //If we got slots, bung them in the slots array
            if(add.length >= 1){
                //cardpick is just a way to keep track of the card index so that we can refer back to the specific card we selected later on. In theory, the slotsahoy and cardpick arrays are parallel.
                cardpick.push(i);
                slotsahoy.push(add);
            };  
        };
    };
};
 
// If you're trying to debug something, the console will print out the slots it's detected
trace(~Contenders: ~+slotsahoy);
 
//B. PICK A CARD
//Decide which of the eligible cards we're going to give the dice to
var randslot = 0;
 
//We look at how many things are in the slots array and then randomly pick out that number. I believe the maximum number of pieces of equipment you can have is six (we're excluding skillcards above), so that's why we start there.
if(slotsahoy.length == 6){
    randslot = rand([0|1|2|3|4|5]);}
else if(slotsahoy.length == 5){
    randslot = rand([0|1|2|3|4]);}
else if(slotsahoy.length == 4){
    randslot = rand([0|1|2|3]);}
else if(slotsahoy.length == 3){
    randslot = rand([0|1|2]);}
else if(slotsahoy.length == 2){
    randslot = rand([0|1]);}
else if(slotsahoy.length == 1){
    randslot = 0;};
 
//reduce slotsahoy to the slots for the card we just picked and ditto for cardpick
slotsahoy = slotsahoy[randslot];
cardpick = cardpick[randslot];
// If you're trying to debug something, the console will print out the slots it's selected
if(amjester == true){
    trace(~I picked:~+Deck.getcard(cardpick).equipment.name+~'s ~+slotsahoy);
} else {
    trace(~I picked:~+self.equipment[cardpick].name+~'s ~+slotsahoy);
};
 
//C. CALCULATE DICE FOR SLOTS
//We're not assigning dice of random acceptable valuesbecause the idea is to activate as though snapped
var dicegift = [];
var diceboost = 0; //not currently in use
var noactivation = 0; //not currently in use
 
 
 
//b. dicegift version  -- this more closely mirrors the way other types of cards are handled by passing the dice required to fill the countdown to the dicegift array, which is then allows the result to be processed downstream. 
if(slotsahoy[0] == ~COUNTDOWN~){
    dicegift = [1];
};
 
// 2. NEEDSX cards (ie Lucky7)
// This will try to divide the NEEDS total as evenly as possible between the available slots
if(slotsahoy[0] == ~NEEDS~){
    //grab needstotal and num of slots from where we stored it earlier
    var needs = slotsahoy[1];       
    var n = slotsahoy[2];
    
    //provided that needs is greater than the number of slots    
    if(needs >= n){
        //does dividing by the num of slots leave a remainder?
        //if not just divide needs by n and push the result to dicegift for however many slots there are
        if (needs % n == 0) { 
            for(i in 0...n){ 
                dicegift.push((needs/n));
            }; 
        //if there is a remainder..    
        } else { 
            // create a version of needs that can be evenly split by deducting the remainder
            // ..and create a var for the remainder
            var splittable = needs - (needs % n);
            var remainder = needs % n; 
 
            // push the even split number to dicegift
            for(i in 0...n){ 
                dicegift.push((splittable/n));
            };
            
            // cycle through dicegift adding 1 from the remainder until its used up
            var start = 0;
            while (remainder > 0){
                dicegift[start]++;
                start++;
                remainder--;
            };
        };
    };
};
 
 
// 3. ALL OTHER CARD TYPES
// Check slot type against array to figure out what dice to return
// Array format: Slot type| # poss values | poss values
 
var matcharray = [~ODD~|~1~|~5~|~EVEN~|~1~|~6~|~MAX1~|~1~|~1~|~MAX2~|~1~|~2~|~MAX3~|~1~|~3~|~MAX4~|~1~|~4~|~MAX5~|~1~|~5~|~MIN2~|~1~|~6~|~MIN3~|~1~|~6~|~MIN4~|~1~|~6~|~MIN5~|~1~|~6~|~NORMAL~|~1~|~6~|~REQUIRE1~|~1~|~1~|~REQUIRE2~|~1~|~2~|~REQUIRE3~|~1~|~3~|~REQUIRE4~|~1~|~4~|~REQUIRE5~|~1~|~5~|~REQUIRE6~|~1~|~6~|~RANGE23~|~1~|~3~|~RANGE24~|~1~|~4~|~RANGE25~|~1~|~5~|~RANGE34~|~1~|~4~|~RANGE35~|~1~|~5~|~RANGE45~|~1~|~5~];
 
var dd = 0;
// Loop through the slots on the chosen card to deliver random acceptable values for each slot
for(i in 0...slotsahoy.length){
    // Doubles are dealt with separately, to ensure the same random dice is delivered twice
    if(slotsahoy[i] == ~DOUBLES~){if(dd == 0){dd = 6;}; dicegift.push(dd);}
    else if(matcharray.indexOf(slotsahoy[i]) > -1){ 
        // if a slot type matches something in the array above, check the next item in the array (poss values)
        switch matcharray[matcharray.indexOf(slotsahoy[i])+1] {
            // once poss values is known, randomly move to one of the acceptable slots, and push that value to the dice array
            case ~1~:
                dicegift.push(matcharray[matcharray.indexOf(slotsahoy[i])+2]);
        };
    };
};
trace(~dicegift: ~+dicegift);
 
//D. USER FEEDBACK
//Say which card got picked onscreen
var flavourtext = rand([0|1|2|3|4|5|6|7|8|9]);
var firsthalf = [~Go go ~|~Fire up ~|~Activate ~|~For your ~|~Let's see ~|~Unleash ~|~It's ~|~It's ~|~~|~Where's my ~];
var secondhalf = [~!~|~!~|~!~|~!~|~!~|~!~|~ time!~|~ o'clock!~|~[;] I choose you!~|~?~];
var jestersays = ~~;
 
if(amjester == true){
    jestersays = firsthalf[flavourtext]+Deck.getcard(cardpick).equipment.name+secondhalf[flavourtext];
} else {
    jestersays =firsthalf[flavourtext]+self.equipment[cardpick].name+secondhalf[flavourtext];
};
 
// By default, text particles are centred, which means longer ones can end up partially offscreen. So we're going to generate an offset of empty spaces based on the length of the text particle.
var space = ~ ~;
var beta = jestersays.length;
var offset =~~;
for(i in 0...beta){offset = offset + space;};
 
//E. SLOT DICE INTO CHOSEN CARD
// Give dice and fire off text saying what was picked. If no cards are eligible (ie all backup cards) then say so.
 
var assignkludge = 0;
if(amjester == true){
   //nothing
} else {
    // Same deal, but for non-Jester classes.
    if(dicegift.length >= 1){
        // Fire off the text we generated in step D
        self.textparticle(offset+jestersays);
 
        // Add the dicegift array to the dicepool
        givedice(dicegift);
 
        // ASSIGNED DICE WORKAROUND PT1: 
        // If the player has already slotted dice in the card, things start to get weird when you try to automagically slot more dice in. At the moment, there's not a lot I can do about this, so here's the workaround..
        // Cycle through dice slots on the selected card and set the assignkludge flag if any of them have slotted dice already.
        for(i in 0...self.equipment[cardpick].assigneddice.length){
            if(self.equipment[cardpick].assigneddice[i] != null){
                assignkludge = 1;
            };
        };
    
        // ASSIGNED DICE WORKAROUND PT2:
        // if the kludge flag is not flying, perform that dice magic and activate the card
        // Otherwise, do nothing, which results in the dicegift dice just appearing in the dicepool instead
        if(assignkludge == 0){
            for(i in 0...dicegift.length){
                self.equipment[cardpick].assigndice(self.dicepool[self.dicepool.length-(i+1)]);
            };
        
			//doequipmentaction: function(actor,target,direction,actualdice,equipdelay,ignorecurse)
            //nb anything with a custom cast direction (ie Spiked Shield) will cast backwards by default
 
            
            self.equipment[cardpick].doequipmentaction(self[;]target[;]self.equipment[cardpick].castdirection[;] self.equipment[cardpick].assigneddice [;]0[;]false);
            
            
        };  
                
        //If there were no cards that could receive dice, pop up a message to say so
        } else {
            self.textparticle(~No dice!~);
        };
};
 
