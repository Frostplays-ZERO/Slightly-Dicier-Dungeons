usestandardenemies();

var items = [];
var gooditems = [];
var otherstuff = [];
var goodotherstuff = [];

//Floor 1:
var commonlist1 = shuffle(["Tetraphobia", "Ice Shard", "Sonic Wave", "Staff", "Dramatic Exit", "Lucky 7"]);
items = [commonlist1.pop()];

addfloor("tiny")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
//Floor 2:
var commonlist2 = ["Rat", "Midnight Charm", "Bump", "Thick Skin", "Signal Jammer", "Secret Weapon", "Poison Cloud", "Scrap Book"];
commonlist2 = shuffle(commonlist2);
commonlist1.push("Electromagnet");
commonlist1 = shuffle(commonlist1);

items = [commonlist2.pop()];
gooditems = [];

otherstuff = [health(), health()];
goodotherstuff = [shop(["Splitula", commonlist2.pop(), commonlist1.pop()]), upgrade()];

addfloor("normal")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
//Floor 3:
var rarelist1 = ["Dodge", "Hookshot", "Pirate Hook", "Ungeradedice", "Giant Spatula"];
rarelist1 = shuffle(rarelist1);
items = [commonlist2.pop()];
gooditems = [];

otherstuff = [
  health(),
  health()
];
goodotherstuff = [
  shop([commonlist2.pop(), "upgrade", commonlist1.pop()])
];

addfloor("normal")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
//Floor 4:
var commonlist3 = ["Lockpick", "Iron Armor", "Catastrophe", "Catalyst", "Spannersword"];
commonlist3 = shuffle(commonlist3);
items = [commonlist3.pop()];
gooditems = [];

var floor5item = commonlist3.pop();

commonlist3.push("Nudgeblade");
commonlist3 = shuffle(commonlist3);

otherstuff = [health(), health()];

var thieftrade;
if(chance(10)){
  thieftrade = trade(["plasma blaster"], ["Pocket Knife"]);
}else if(chance(10)){
  thieftrade = trade(["lockpick"], ["Silver Cauldron"]);
}else{
  thieftrade = trade(["poison cloud", "wrecking ball", "lockpick", "plasma blaster"], ["Backstab", "Determination", "Catastrophe", "Iron Cauldron"]);
}

goodotherstuff = [
  shop([rarelist1.pop(), rarelist1.pop(), commonlist2.pop()]),
  thieftrade
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
  shop(shuffle(["health", commonlist3.pop(), rarelist1.pop()])), 
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
		