usestandardenemies();

var items = [];
var gooditems = [];
var otherstuff = [];
var goodotherstuff = [];

//Floor 1:
items = [pick(["Staff of Keys", "Bullseye Staff"]), "Sword"];
var gearslist = shuffle(["Warm Gear","Cold Gear","Grinding Gear","Heavy Gear"]);
gooditems = [gearslist.pop()];
otherstuff = [];
goodotherstuff = [];

addfloor("small")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
//Floor 2:
var commonlist1 = ["Leather Armor", "Bump", "Tipped Scale", "Two Leaf Clover", "Sea Hammer", "Keyblade"];
var scraplist = shuffle(["Strange Gun", "Broken Lock", "Blank Ring", "Closed Box", "Unmarked Key"]);
var shoplist1 = ["Vengeful Dagger", "Silver Charm", "Crystal Whip", "Glass Hammer", "Mirror Wrench"];
if (chance(60)) shoplist1.push("Rosepetal Staff");
commonlist1 = shuffle(commonlist1);
shoplist1 = shuffle(shoplist1);

items = [];
gooditems = [commonlist1.pop(), commonlist1.pop()];

otherstuff = [
  health(), 
  health()
];
goodotherstuff = [
  shop(shuffle(["upgrade", shoplist1.pop(), scraplist.pop()]), shuffle([2, 3, 4]))
];

addfloor("small")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();

//Floor 3:
var midtierdrops = shuffle(["Peculiar Potion", "Electromagnet", "Rainbow Cannon"]);
items = [scraplist.pop()];
items.push(pick(["Sword of Extremes", "Silver Charm", "Crystal Whip", "Mirror Wrench", "Golden Charm"]));
gooditems = [midtierdrops.pop()];
		
var commonlist2 = ["Shovel", "Longsword", "Throwing Star", "Two Leaf Clover", scraplist.pop(), "Healing Crystal"];
shuffle(commonlist2);
		
otherstuff = [health()];
goodotherstuff = [
  shop(shuffle([shoplist1.pop(), shoplist1.pop(), commonlist1.pop()]), shuffle([1, 2, 3])),
  shop(shuffle([commonlist2.pop(), commonlist2.pop(), "upgrade"]))
];
	
addfloor("big")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
//Floor 4:
items = [gearslist.pop()];
gooditems = [midtierdrops.pop()];
		
otherstuff = [health(), health()];
goodotherstuff = [];
		
addfloor("normal")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
//Floor 5:
items = [pick(["Rainbow Cannon", "Hookshot", "Lightning Rod"])];
gooditems = [midtierdrops.pop()];
		
otherstuff = [health(), health()];
goodotherstuff = [
  shop(shuffle([commonlist2.pop(), "health", commonlist2.pop()])),
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
		
		