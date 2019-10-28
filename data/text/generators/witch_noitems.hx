usestandardenemies();

var items = [];
var gooditems = [];
var otherstuff = [];
var goodotherstuff = [];

var commonlist_basic = ["Magic Shield", "Magic Missile", "Nudge"];
shuffle(commonlist_basic);

var commonlist_offensive = [
  rand(["Life Drain", "Bandage", "Healing Crystal"]), 
  "Slime Ball", 
  "Magic Dagger", 
  "Fury Spell", 
  "Magic Spear",
  "Hex",
  "Catastrophe"
];
var commonlist_dicemanipulation = [
  "Illuminate", 
  "Glass Cauldron", 
  "Gold Cauldron", 
  "Silver Cauldron", 
  "Skeleton Key",
  "Counter Spell",
  "Rat"
];

if(chance(20)){
  commonlist_dicemanipulation.push("Crucible");
}else{
  commonlist_dicemanipulation.push(pick(commonlist_dicemanipulation));
}

//Floor 1:
items = [];
gooditems = [];
otherstuff = [];
goodotherstuff = [];

addfloor("tiny")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
//Floor 2:
commonlist_dicemanipulation = shuffle(commonlist_dicemanipulation);
commonlist_offensive = shuffle(commonlist_offensive);
		
items = [];
		
gooditems = [];
otherstuff = [
  health(), 
  health()
];

goodotherstuff = [
  shop([commonlist_offensive.pop(), "Health",  commonlist_basic.pop()], [99,3,99])
];

addfloor("normal")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  	
//Floor 3:
items = [];
gooditems = [];
		
otherstuff = [
  health(), 
  health()
];

goodotherstuff = [
  shop([commonlist_offensive.pop(), "Health", commonlist_dicemanipulation.pop()], [99,3,99])
];

addfloor("normal")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
//Floor 4:
items = [];
gooditems = [];
		
shuffle(commonlist_dicemanipulation);
shuffle(commonlist_offensive);
		
otherstuff = [
  health(),
  health(),
  health()
];
var goodshopcontents = shuffle(["Lightning Bolt", "Inferno", "Blizzard", "Shockwave"]);
goodotherstuff = [
  shop([commonlist_offensive.pop(), "Health", commonlist_dicemanipulation.pop()], [99,3,99])
];
		
addfloor("normal")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
//Floor 5:
items = [];
gooditems = [];
otherstuff = [health(), health(), health()];
goodotherstuff = [
  shop([commonlist_offensive.pop(), "Health", commonlist_dicemanipulation.pop()], [99,3,99])
];
		
addfloor("big")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();

//Floor 6:
items = [];
gooditems = [];
otherstuff = [];
goodotherstuff = [];

var lastfloor = addfloor("boss");

if (getfinalboss() == "Drake"){
  items.push("Wooden Stake");
}

lastfloor
  .additems(items, gooditems)
  .setlocation('BOSS')
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();