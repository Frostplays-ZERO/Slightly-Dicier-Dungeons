//Generate the level, and then choose remixes that go well with it.
//Does some very basic markov chaining to ensure interesting answers that can react to what you've selected
Remix.reset();

//Generic setup: define some remixes that should never occur at the same time
Remix.preventclash(['Lady Luck', 'Rat King']); //Upgraded equipment + super enemies don't work together
Remix.preventclash(['Lady Luck', 'Ned']); //These both upgrade enemy equipment <my fault>
Remix.preventclash(['Snowman', 'Baby Squid', 'Fireman', 'Beatrice', 'Gardener']); //More than one status effect dealer is messy
Remix.preventclash(['Singer', 'Bounty Hunter']); //Avoid more than one dice roll rule change for the player
Remix.preventclash(['Warlock', 'Banshee']); //Don't have both Warlock and a remix that changes to PU rules
Remix.preventclash(['Vacuum', 'Drake']); //These both increase enemy health
Remix.preventclash(['Skeleton', 'Scathach']); //This isn't a fun combination, best to prevent it
//Remix.preventclash(['Space Marine']); //...or for the enemy

var enemylist = getenemylistindungeon();
var player = getplayername();

//Some remixes are very game defining, and it's better if they only come up very occasionally
var veryrare = ['Sneezy', 'Wisp', 'Sticky Hands', 'Warlock'];
if(player != 'Robot') veryrare.push('Paper Knight'); //Robot shouldn't get Paper Knight
if(player != 'Witch' && player != 'Jester') veryrare.push('Ned'); //Jester and Witch shouldn't get Ned, Val or Yolanda
if(player != 'Witch' && player != 'Jester') veryrare.push('Yolanda'); //Jester and Witch shouldn't get Ned, Val or Yolanda
if(player != 'Witch' && player != 'Jester') veryrare.push('Val'); //Jester and Witch shouldn't get Ned, Val or Yolanda
veryrare = shuffle(veryrare);

var curselist = ['Dire Wolf', 'Banshee'];
var firelist = ['Buster'];
curselist = shuffle(curselist);
firelist = shuffle(firelist);

var standardlist = ['Snowman', 'Baby Squid', 'Rat King', 'Hothead', 'Fireman', 'Vacuum', 'Slime', 'Beatrice', 'Gardener'];
if(player != 'Robot') standardlist.push('Singer'); //Robot shouldn't get Singer

if(enemylist.indexOf('Buster') > -1){
  standardlist.push(firelist.pop());
}

var secondremixlist = [];

var earlytwists = ['Wolf Puppy', 'Mimic', 'Cactus', 'Rose', 'Pirate'];
if(player == 'Thief') earlytwists.push('The Thief'); //Finders Keepers rules
if(player == 'Inventor') earlytwists.push('The Inventor'); //PU Scrap rules
//if(player == 'Robot') earlytwists.push('The Robot'); //You Choose You Lose rules
//if(player == 'Witch') earlytwists.push('The Witch'); //Expect the unexpected rules

var hardlist = ['Sorceress', 'Bully', 'Bounty Hunter', 'Cowboy', 'Kraken'];
if(player == 'Robot'){
  standardlist.push('Wisp'); //Robot should be *more* likely to get Wisp, and should never get Skeleton
}else{
  if(player != 'Witch'){ //Witch shouldn't get Skeleton
    hardlist.push('Skeleton');
  }
}

var midtwists = ['Scathach', 'Alchemist', 'Loud Bird']; 
//Frog needs to exclude enemy equipment before it can be included, also a better plan for inventor limits

var cursecount = 0;
if(enemylist.indexOf('Banshee') > -1) cursecount++;
if(enemylist.indexOf('Dire Wolf') > -1) cursecount++;
if(enemylist.indexOf('Kraken') > -1) cursecount++;
if(enemylist.indexOf('Scathach') > -1) cursecount++;
if(enemylist.indexOf('Skeleton') > -1) cursecount++;
if(cursecount >= 3){
  hardlist.push(curselist.pop());
}

var poisoncount = 0;
if(enemylist.indexOf('Haunted Jar') > -1) poisoncount++;
if(enemylist.indexOf('Rat King') > -1) poisoncount++;
if(enemylist.indexOf('Drain Monster') > -1) poisoncount++;
if(enemylist.indexOf('Dire Wolf') > -1) poisoncount++;
if(poisoncount >= 2){
  hardlist.push('Haunted Jar');
}

var veryhardlist = ['Cornelius', 'Drake', 'Madison'];
if(enemylist.indexOf('Beatrice') > -1) veryhardlist.push('Handyman');

//Really simple first draft, shuffle all the lists, assign them randomly
earlytwists = shuffle(earlytwists);
standardlist.push(earlytwists.pop());
standardlist = shuffle(standardlist);

midtwists = shuffle(midtwists);
hardlist.push(midtwists.pop());
hardlist = shuffle(hardlist);

veryhardlist = shuffle(veryhardlist);

//Figure out the final rule offerings
var finaloffer2 = [standardlist.pop(), standardlist.pop(), earlytwists.pop()];
//Add some stuff we don't want to appear in the first remix, e.g. curse and poison related things
for(r in standardlist){
  secondremixlist.push(r);
}
if(chance(25)){
  secondremixlist.push('Rotten Apple'); //This one is brutal, keep it rare!
}
if(secondremixlist.indexOf('Rat King') > -1) secondremixlist.remove('Rat King'); //Rat King needs to appear as the first remix
secondremixlist = shuffle(secondremixlist);
var finaloffer3 = [secondremixlist.pop(), secondremixlist.pop(), midtwists.pop()];
var finaloffer4 = [hardlist.pop(), hardlist.pop(), hardlist.pop()];
var finaloffer5 = [veryhardlist.pop(), hardlist.pop(), veryhardlist.pop()];

//Insert twists!
if(chance(66)){
  //66% chance of seeing a twist
  if(chance(66)){
    if(chance(33)){
      trace('Twist type A');
      finaloffer2.insert(0, earlytwists.pop());
    }else{
      trace('Twist type B');
      finaloffer2.insert(1, earlytwists.pop());
    }
  }else{
    if(chance(33)){
      trace('Twist type C');
      finaloffer2.insert(0, veryrare.pop());
    }else{
      trace('Twist type D');
      finaloffer2.insert(1, veryrare.pop());
    }
  }
}

//To ensure we never run out, fill up the arrays with the rest of the options
if(standardlist.length > 0) finaloffer2.push(standardlist.pop());
if(standardlist.length > 0) finaloffer3.push(standardlist.pop());
if(standardlist.length > 0) finaloffer2.push(standardlist.pop());
if(standardlist.length > 0) finaloffer3.push(standardlist.pop());
if(earlytwists.length > 0) finaloffer2.push(earlytwists.pop());
if(earlytwists.length > 0) finaloffer3.push(earlytwists.pop());
if(hardlist.length > 0) finaloffer4.push(hardlist.pop());
if(hardlist.length > 0) finaloffer5.push(hardlist.pop());
if(hardlist.length > 0) finaloffer4.push(hardlist.pop());
if(hardlist.length > 0) finaloffer5.push(hardlist.pop());
if(midtwists.length > 0) finaloffer4.push(midtwists.pop());
if(midtwists.length > 0) finaloffer5.push(midtwists.pop());
if(veryhardlist.length > 0) finaloffer4.push(veryhardlist.pop());
if(veryhardlist.length > 0) finaloffer5.push(veryhardlist.pop());
if(standardlist.length > 0) finaloffer4.push(standardlist.pop());
if(standardlist.length > 0) finaloffer5.push(standardlist.pop());

Remix.offer(2, '', finaloffer2);
Remix.offer(3, '', finaloffer3);
Remix.offer(4, '', finaloffer4);
Remix.offer(5, '', finaloffer5);