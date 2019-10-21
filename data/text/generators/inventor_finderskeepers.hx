usestandardenemies();

var items = [];
var gooditems = [];
var otherstuff = [];
var goodotherstuff = [];

//Floor 1:
var commonlist1 = shuffle(["Leather Armor", "Bump", "Healing Crystal", "Lockpick", "Spike", "Keyblade"]);
		
items = [commonlist1.pop()];

addfloor("tiny")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
//Floor 2:
commonlist1.push("Dagger");
commonlist1 = shuffle(commonlist1);

items = [];
gooditems = [];

otherstuff = [health(), health()];
goodotherstuff = [shop(shuffle(["Scrap Metal", commonlist1.pop(), "upgrade"]))];

addfloor("small")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
//Floor 3:
var commonlist2 = ["Shovel", "Boomerang", "Pea Shooter", "Spanner", "Scrap Metal", "Healing Crystal"];
var rarelist1 = ["Broadsword", "Bump", "Crystal Sword", "Chocolate Cookie", "Hall of Mirrors", "Midnight Charm"];

commonlist2 = shuffle(commonlist2);
rarelist1 = shuffle(rarelist1);
items = [];
gooditems = [];

otherstuff = [
  health(),
  health()
];
goodotherstuff = [
  upgrade(),
  upgrade()
];

addfloor("normal")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
//Floor 4:
var commonlist3 = ["Counterfeit", "Electromagnet", "Ray Gun"];
commonlist3 = shuffle(commonlist3);
items = [];
gooditems = [];

var floor5item = commonlist3.pop();

commonlist3.push("Hookshot");
commonlist3 = shuffle(commonlist3);

otherstuff = [health(), health()];

goodotherstuff = [
  shop(shuffle([commonlist3.pop(), "health", commonlist2.pop()])), upgrade()
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
  shop(shuffle(["health", commonlist3.pop(), pick([rarelist1.pop(), commonlist2.pop()])])), 
  upgrade()
];

addfloor("normal")
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
		