usestandardenemies();

var items = [];
var gooditems = [];
var otherstuff = [];
var goodotherstuff = [];

//Floor 1:
var commonlist1 = DiceyScript.getequipment();
		
items = [rand(commonlist1)];

addfloor("tiny")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
//Floor 2:
commonlist1.push("Healing Crystal");
commonlist1 = shuffle(commonlist1);

items = [rand(commonlist1)];
gooditems = [];

otherstuff = [health(), health()];
goodotherstuff = [shop(shuffle([rand(commonlist1),rand(commonlist1),rand(commonlist1)]))];

addfloor("normal")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
//Floor 3:
var commonlist2 = ["Lantern", "Last Stand", "First Aid Kit", "Staff", "Lockpick", "Poison Slingshot"];
var rarelist1 = ["Dodge", "Hookshot", "Snake Eye Charm", "Midnight Charm"];

commonlist2 = shuffle(commonlist2);
rarelist1 = shuffle(rarelist1);
items = [rand(commonlist1)];
gooditems = [];

otherstuff = [
  health(),
  health()
];
goodotherstuff = [
  shop([rand(commonlist1),rand(commonlist1),rand(commonlist1)]),
  upgrade()
];

addfloor("normal")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
//Floor 4:
var commonlist3 = ["Lockpick", "Iron Armor", "Blight", "Detonator", "Spatula"];
commonlist3 = shuffle(commonlist3);
items = [rand(commonlist1)];
gooditems = [];

var floor5item = commonlist3.pop();

commonlist3.push("Nudgeblade");
commonlist3 = shuffle(commonlist3);

otherstuff = [health(), health()];

var thieftrade;
if(chance(10)){
  thieftrade = trade(["lockpick"], ["Blender"]);
}else if(chance(10)){
  thieftrade = trade(["lockpick"], ["Rat"]);
}else{
  thieftrade = trade(["poison needle", "crowbar", "lockpick", "dagger"], ["Backstab", "Blight", "Catastrophe", "Glass Cauldron"]);
}

goodotherstuff = [
  shop([rand(commonlist1),rand(commonlist1),rand(commonlist1)]),
  thieftrade
];

addfloor("big")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
 //Floor 5:
items = [rand(commonlist1)];
gooditems = [];
otherstuff = [health(), health(), health()];
goodotherstuff = [
  shop(shuffle(["health", rand(commonlist1),rand(commonlist1)])), 
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
		