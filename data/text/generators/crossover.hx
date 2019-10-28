usestandardenemies();

var items = [];
var gooditems = [];
var otherstuff = [];
var goodotherstuff = [];

//Floor 1:
var commonlist1 = shuffle(["Leather Armor", "Bump", "Bandage", "Pickpocket", "Pea Shooter", "Snake Eye Charm", 
						   "Broadsword", "Iron Shield", "Dagger", "Buckler", "Target Shield", "Nightstick", "Blight", "Snake Eye Charm", "Midnight Charm", "Healing Crystal", "Claw", "Snowball", "Boomerang", "Tazer", "First Aid Kit"
						   "Juggling Ball", "Spanner", "Spiked Shield", "Doppeldice", "Short Circuit",
						   "Leather Armor", "Bump", "Healing Crystal", "Lockpick", "Spike", "Keyblade",
						   "Juggling Ball", "Boop", "Shovel", "Lament", "Whip", "Hammer", "Blood Suck", "Counterfeit",
						   "Healing Crystal", "Buckler", "Spare 4", "Plasma Cannon"]);
var commonlist_basic = shuffle(["Magic Shield", "Magic Missile", "Nudge",
								"Healing Crystal", "Small Shield",
								"Illuminate", "Glass Cauldron", "Gold Cauldron", "Silver Cauldron", "Rat"]);		
items = [commonlist_basic.pop()];

addfloor("tiny")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
//Floor 2:
commonlist1.push("Healing Crystal");
commonlist1 = shuffle(commonlist1);

items = [commonlist1.pop()];
gooditems = [];

otherstuff = [health(), health()];
goodotherstuff = [shop(shuffle([commonlist1.pop(), commonlist1.pop(), commonlist1.pop()]))];

addfloor("normal")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
//Floor 3:
var commonlist2 = ["Lantern", "Last Stand", "First Aid Kit", "Staff", "Lockpick", "Poison Slingshot",
				   "Bump", "Six Shooter", "Crystal Sword", "Chocolate Cookie", "Blight", "Detonator", "Spatula",
				   "Whip", "Toxic Ooze", "Claw", "Staff", "Hammer", "Shovel", "Battle Axe",
				   "Midnight Charm", "Ray Gun",
				   "Lockpick", "Iron Armor", "Blight", "Detonator", "Spatula"];
var rarelist1 = ["Dodge", "Hookshot", "Snake Eye Charm", "Midnight Charm",
				 "Spatula", "Lightning Rod", "Shriek", "Hammer", "Juggling Ball", "Toxic Ooze",
				 "Counterfeit", "Electromagnet", "Ray Gun", "Crucible"];
for(i in commonlist2){commonlist1.push(i);}
commonlist2 = shuffle(commonlist1);
rarelist1 = shuffle(rarelist1);
items = [commonlist2.pop()];
gooditems = [];

otherstuff = [
  health(),
  health()
];
goodotherstuff = [
  shop([commonlist2.pop(), rarelist1.pop(), commonlist2.pop()]),
  shop(shuffle([commonlist2.pop(), rarelist1.pop(), "upgrade"]))
];

addfloor("normal")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
//Floor 4:
var commonlist3 = [];
commonlist3 = shuffle(commonlist2);
items = [commonlist3.pop()];
gooditems = [];

var floor5item = commonlist3.pop();

commonlist2.push("Nudgeblade");
commonlist3 = shuffle(commonlist2);

otherstuff = [health(), health()];

goodotherstuff = [
  shop([rarelist1.pop(), rarelist1.pop(), commonlist2.pop()]),
  
  shop([rarelist1.pop(), rarelist1.pop(), commonlist2.pop()])
];

addfloor("big")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
 //Floor 5:
items = [floor5item];
gooditems = [];
otherstuff = [health(), health(), health()];
goodotherstuff = [
  shop(shuffle(["health", commonlist3.pop(), pick([rarelist1.pop(), commonlist2.pop()])])), 
  upgrade()
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
		