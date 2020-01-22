usestandardenemies();

var items = [];
var gooditems = [];
var otherstuff = [];
var goodotherstuff = [];

//Floor 1:
var commonlist1 = shuffle(["Thick Skin", "Bump", "Healing Crystal", "Raw Ambition", "Paper Cauldron", "Square Pair"]);
		
items = [commonlist1.pop()];
otherstuff = [health()];

addfloor("tiny")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
//Floor 2:
commonlist1.push("Glass Cauldron");
commonlist1 = shuffle(commonlist1);

items = [commonlist1.pop()];
gooditems = [];

otherstuff = [health(), health()];
goodotherstuff = [shop(shuffle(["Crowbar", commonlist1.pop(), commonlist1.pop()]))];

addfloor("normal")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
//Floor 3:
var commonlist2 = ["Doppeldice", "Last Stand", "First Aid Kit", "Catastrophe", "Lockpick", "First Aid Kit", "Counterfeit"];
var rarelist1 = ["Puppy Paws", "Dodge", "Hall of Mirrors", "Bear Trap", "Chocolate Cookie"];

commonlist2 = shuffle(commonlist2);
rarelist1 = shuffle(rarelist1);
items = [commonlist2.pop()];
gooditems = [];

otherstuff = [
  health(),
  health(),
  health()
];
goodotherstuff = [
  shop([commonlist2.pop(), commonlist2.pop(), commonlist1.pop()]),
  upgrade()
];

addfloor("normal")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
//Floor 4:
var commonlist3 = ["Splitula", "Iron Armor", "Cowbell", "Don't Stop!", "Hookshot"];
commonlist3 = shuffle(commonlist3);
items = [commonlist3.pop()];
gooditems = [];

var floor5item = commonlist3.pop();

commonlist3.push("Candle");
commonlist3 = shuffle(commonlist3);

otherstuff = [health(), health()];


goodotherstuff = [
  shop([rarelist1.pop(), rarelist1.pop(), "upgrade"]),
  health()
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

lastfloor
  .additems(items, gooditems)
  .setlocation('BOSS')
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
		