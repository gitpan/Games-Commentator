package Games::Commentator;
require Exporter;
@ISA = qw(Exporter);
@EXPORT_OK = qw/random_comment person_comment org_comment about_comment
                make_comment get_variables/;
use warnings;
use strict;
our $VERSION = 0.01;
use utf8;
use Lingua::EN::Inflect qw/A PL PL_V/;

my %comments;

$comments{starter} = [
"Totally %WRONG%.",
"It's a shame that this needs saying - but it does.",
"Nice try but you could have spared those bytes from the indignity of being sent around the internet.",
"There are more things in heaven and earth, Horatio, than are dreamt of in your philosophy.",
"There should not even be %DISCUSSION%, too late, the horse has bolted.",
"An %EXTREME%ly thorough reader might be able to converge by systematically sorting out the %MISTAKE%s, %MISTAKE%s, %MISTAKE%s and %MISTAKE%s voiced and then connecting the dots... But it might be easier to take a glance at the bytes that have have already flowed under this bridge %PASTTIMEPERIOD%.",
"%GOSH%, that IS %BORING%.",
"Hitting, nail and head come to mind.",
"An excellent testament to the pitiable state of the modern intellect.",
"Don't make me laugh;",
"I predicted this would happen years ago, and no one listened or they just mocked, saying it was impossible, but this is just the start.",
"What is this %ARTICLE% - a bit of circus to distract us while the powerful work out how to get us fighting over the bread?",
"Interesting. Still. I'd ask why?",
"I found the %ARTICLE% %FLAWED% on many levels.",
"I cannot believe how many people are defending and identifying with %ISSUE%. Whether this is true or not is one thing.",
"Obvious parallels to %HITLER%.",
"Remarkable.",
"This is %EXTREME%ly %STUPID%.",
"A rather significant %MISTAKE% here, I am afraid:",
"Times like this %SADLY% reveal the %WEAKNESS% of the web. Most %SOCALLED% commentators are %INSULT% %FOOL%s of no %COMMONSENSE%, and their %INSULT% %NONSENSE% is a constant background noise to any %INTELLIGENT% %DISCUSSION% taking place.",
"What's the matter?",
"This will now unleash the current struggle between the wheat and the weeds to a higher level.",
"Have we really become such a community of %FOOL%s?",
"What a %BORING% load of %NONSENSE%.",
"I'll say it again:",
"Breaking news:",
"I don't want to make this personal, but this is a %ARTICLE% so %FLAWED% that it should be removed.",
"What's the story? ",
"Get a grip, everyone:",
"Get over it, %FOOL%s.",
"My %OPINION%s around %ISSUE% are mostly in support of what the contributors have already written.",
"Same old same old....",
"I checked the date. No, it is not April the 1st.",
"Here we go again.",
"This is just %TYPICAL%.",
"Oh here we go again.",
"This %COMMENT% will probably be deleted.",
"%GOSH% not this again.",
"Mark my words.",
"%RANDOMANSWER%!!..",
"%STUPID% question:",
"Oh look.",
"Publish this if you dare.",
"Lies, damned lies, and statistics!",
"A complete collection of %POISON% and %POISON%.",
"First things first.",
"This %BORING% old question again.",
"I don't believe the %COMMENT%s on here..",
"Aw diddums.",
"It makes me sick.",
"Sad but true.",
"It's %SIMPLE%.",
"%TYPICAL%.",
"It's sad but true.",
"'Twas ever thus.",
"A %SIMPLE% '%RANDOMANSWER%'.",
"Hear me out.",
"FYI:",
"%ITHINKTHAT% we all know what's going on here.",
"Start thinking:",
"I am %ANGRYABOUT% this.",
"Question.",
"Let's see now.",
"Please let me comment on that.",
"%ITHINKTHAT% it would be pretty darned %SIMPLE%.",
"Let's be honest,",
"Let's put it into perspective.",
"One step too far.",
"But %GOSH%,",
"Believe it or not,",
"OK, reality check here.",
'Some of the commentators above have adopted the "so what...." approach.',
"Now, can we go back to some basics?",
"We interrupt this posting for a late breaking news flash:",
"SAD TO THINK.",
"%GOSH%! The usual bile and sniping suspects are out in force again I see, now which one is Keyser Soze?",
"Read my words.",
"Read my lips.",
"It's quite %BORING% when you think about it.",
"Plenty of heat on this one, but it's time for some light.",
"It beggars belief.",
"I smell a rat here.",
"You really can't be serious.",
"In a few words, %RANDOMANSWER%.",
"Let's be honest here:",
"What absolute %NONSENSE%.",
"The difficulty we have is that we can't have it both ways.",
"I've just had a flash of inspiration.",
"Wonderful %ARTICLE%.",
"One cannot tell a book by its cover.",
"Seriously, people. Bit of %COMMONSENSE% might be in order.",
"%GOSH%.",
"This is now getting %STUPID%.",
"How is %ISSUE% actually %NEWSWORTHY%?",
"%ITHINKTHAT% given the %COMMENT%s so far it is unnecessary to post a rejoinder to this %EXTREME%ly %INSULT% %INSULT% %INSULT% %NONSENSE%, but let me put my vote down against this %EXTREME%ly %INSULT% %NONSENSE%.",
"Time to bring back %PUNISHMENT%?",
"This will get worse, much worse!",
"All one huge CON.",
"The end is Nigh!",
"%ITHINKTHAT% articles here are now written specifically for %FOOL%s.",
];

$comments{ladedah} = [
"right-on",
"la-de-dah",
"politically correct",
];

$comments{rubbish} = [
"Haven't seen such a great big fuss since the last great big fuss.",
"It's a %WHITEELEPHANT% now, even if it wasn't before.",
"The question which so many %LADEDAH% media commentators take great steps to ignore or try and brush away, I think.",
"You learn something new every day.",
"And I never thought that I would be saying that.",
"%DISASTER% would be a more fun way to spend an evening.",
"Could have been a good %ARTICLE% if it had looked at the problem seriously rather than making %STUPID% analogies.",
"Time to bring back %PUNISHMENT%?",
"It's beyond comical, enough to make a meerkat do continuous hysterical somersaults %FUTURETIMEPERIOD%!!!",
"Who will be the one to decide between the anticipated chaos of %OPINION%s?",
"Absolute %NONSENSE%.",
"Where will it end?",
"I'm not holding my breath.",
"Clear?",
"Would it be that a little %COMMONSENSE% prevailed in this country! Tssk!",
"%SIMPLE% answer to %SIMPLE% question. %RANDOMANSWER%.",
"Grow up!!",
"Nice try. But it will not work. Please credit us with a bit more %COMMONSENSE%!",
"....mmmmm...that should work, NOT.",
"......is it 1st of April?",
"You couldn't make it up!",
"They can stick this in their pipe and smoke it as far as I'm concerned!!!",
"I speak from some experience!!!!!!",
"Mind you, it might upset the %JOB%s and we can't have that now, can we?",
"Wake up %FOOL%s, before it's too late.",
"A multi-pronged attack is overdue %FUTURETIMEPERIOD%.",
"Sad but true.",
"I am %ANGRYABOUT% this!",
"Shame.",
"Sometimes pointing out the %SIMPLE% seems to be a revelation...",
"Go figure.",
"First the government deny us our rights with their tyrannical laws and now the people are trying to enforce them.",
"Perhaps this will be the proverbial straw breaking this horse designed by committee.",
"Hope springs eternal.",
"Only %FOOL%s have had any confidence in what has clearly been a %FARCE% %PASTTIMEPERIOD%.",
"What a %FARCE% %NOW%.",
"I wonder if they will ever get it.",
"I'd just use plain & %SIMPLE% %COMMONSENSE%, but %SADLY%, although it is commonly available to all, many would not recognise it unless it was packaged up & sold in £1 shops or Primark or came with tomato ketchup on top.",
"Get a life.",
"If I'm %WRONG%, shoot me.",
"This is not an exaggeration.",
"Is this really all people can think about anymore?",
"Wake up! You are programmed!",
"But having gone through a one way door, there may be no turning back.",
"Once you jump off a cliff without a parachute, it's too late to worry about the landing five seconds before you will hit the ground.",
"Take a leaf out of my book and do your job properly and stop adding fuel to the fire of %IGNORANCE% already burning.",
"Another day, another %STUPID% %IDEA%.",
" I'll leave you to ponder that one.",
"Very likely.",
".............FACT!",
"We have become %LAUGHINGSTOCK%.",
"What a sad sad world we live in.",
"%FOOL%s.",
"Spare us the %FARCE% for pity's sake!",
"The last thing we want these days is some %FOOL% posing in a loin cloth. We have had enough of that sort %PASTTIMEPERIOD%.",
"ROFLMAO.",
"Truly sorry to deliver a jeremiad :)",
"Which planet do these people think they are living on?",
"Now let the chorus of %FOOL%s sing forth.",
"All across the world, we mere peons are being savaged to keep the fat cats in cream.",
"They are a %WHITEELEPHANT%, turn them into %JOB%s or something else useful like %JOB%s, but then maybe not probably they would stuff that up also.",
"Nature abhors a vacuum, as does knowledge.",
"%IGNORANCE% %WINS%.",
"Just think: You could be %WRONG%.",
"It's easy for people to comment, but I doubt if any or very very few are party to actual information, by doing so you comment out of sheer %IGNORANCE%, hence many stated %COMMENT%s are just made out of pure %BIASED% %IGNORANCE% with no relativity to facts.",
"%ITHINKTHAT% %COMMONSENSE% needs to prevail here.",
"Not strictly relevant to this forum but I just wanted to say it.",
"This is just %IGNORANCE% which characterises a lot of the arguments spouted by the %FOOL%s in the %DISCUSSION% on this topic.",
"In the medieval messengers with bad news were executed, today they are fired.",
"The future will prove who was right and who was %WRONG%.",
"I GIVE UP.\n\nThanks for reading.",
"Just %EXTREME%, and not in a good way.",
"Try growing a little %COMMONSENSE% and facing the world for what it is. You really can put down that blanket and stop sucking your thumb. Honest.",
"Something to talk about.",
"%IGNORANCE%: doing the same thing over and over again and expecting different results each time.",
"*facepalm*",
"Is anyone else also thinking WTF?",
"Answers on a postcard please.",
"World's gone %STUPID%.",
"%ITHINKTHAT% the human race will not survive in the form of civilization as we know it much longer.",
"%TYPICAL% media distorting headline.",
"What a lot of %EXTREME% %NONSENSE% in this %ARTICLE% and comments.",
"This is the last time I'll read a %ARTICLE% on the subject until the next time.",
];



$comments{about} = [
"Personally, I have no idea as to %ABOUT%. Nor do you. Nor do I have an opinion on it.",
"Aw, man, wow, %ABOUT%! Wow!",
"It may amaze you but astonishingly enough, %BOFFIN%s have recently discovered that %ABOUT% %ABOUTBE% a %WHITEELEPHANT%.",
"%ITHINKTHAT% there is a bit of the Dunning-Kruger effect going on here. People chatting about %ABOUT% who know nothing about it.",
"I warned and warned you all a long time ago - %ABOUT% is back!",
"But %ABOUT%, you say? That might be a bit too much.",
"I'm a %TYPE%, and %ITHINKTHAT% %ABOUT% %ABOUTBE% %EXTREME%ly important!",
"Do me a favour. It's %ABOUT% at %ABOUTITS% worst, as even a %TYPE% could see.",
"What a bunch of %FOOL%s, getting worked up over %ABOUT%. %FOOL%s!",
"%SADLY% this %ARTICLE% (and the %COMMENT%s) contain a lot of the same %BORING% %MISTAKE%s and %INSULT% %NONSENSE% you always hear about %ABOUT%.",
"I am %ANGRYABOUT% them riding rough-shod over %ABOUT%.",
"Get them in to have major brain surgery to fix their inability to take responsibility for %ABOUT%.",
"It's as if so many have been in deep hibernation and only just awoke with NO knowledge of the damage caused by %ABOUT% and just accepting everything has got to change and is going to get worse, because a magic fairy has said so.",
"Why are you even commenting on the ifs and buts and whys, WITHOUT even mentioning %ABOUT% in your %COMMENT%s, which are the FACTUAL catalyst to %DISASTER%.",
"Some people loved %ABOUT% and some people hated %ABOUTTHEM%.",
"How quickly we forget %ABOUT%.",
"There has been a lot of %NONSENSE% talked about %ABOUT%.",
"That's %ABOUT% for you.",
"We need to bring back %PUNISHMENT% for %ABOUT%.",
"I would love to see %INTELLIGENT% %DISCUSSION% on the %ABOUT% issue, but you can see exactly no one is pursuing that end.",
"Even when the most %INTELLIGENT% fall prey to the tentacles of %ABOUT%, one can well imagine the plight of %STUPID% %FOOL%s who easily falter in the heat of the moment.",
"I'm not anti-%ABOUT%...but I couldn't eat a whole one.",
"How %ABOUTMUCH% %ABOUT% %ABOUTBE% needed to do anything %NOW%?",
"I'm %ANGRYABOUT% the %STUPID% %FARCE% of %ABOUT%.",
"Has it ever occurred to anyone that it is %ABOUT% that %ABOUTBE% %DOINGSOMETHINGWRONG%?",
"%ITHINKTHAT% we've come a long way from the days when people protested the horror of %ABOUT%.",
"All we hear about is %ABOUT%.",
"Call it what it is, and be done with it: %ABOUT%.",
"What is it with you people and %ABOUT%?",
"Please let us extend this scheme to %ABOUT%.",
"Just to add insult to injury, %ABOUT%!",
"The general public are too wrapped up in their %BIASED% %IDEA%s of what is morally right and wrong to even consider the fact that %ABOUT% %ABOUTBE% %REALLYGOODFORYOU%.",
"%ITHINKTHAT% we should finally accept that %ABOUT% %ABOUTDONOT% work.",
"The whole %IDEA% of %ABOUT% is quite %STUPID%.",
"What a %TYPICAL% %ABOUT% %DISCUSSION%. The answer is %SIMPLE%ly '%RANDOMANSWER%'.",
"Here we go - another day, another %BIASED% %BIASED% %ARTICLE% about %ABOUT%.",
"%ABOUT% = %WHITEELEPHANT%.",
"%ABOUT% may just save us from %DISASTER%.",
"I just knew that there would be loads of %COMMENT%s saying %ABOUT% before I even read the first %COMMENT%. Don't you people ever get bored of being so predictable?",
"%ABOUT% laid bare.",
];

$comments{org} = [
"This is just another illustration of the complete contempt that %ORG% has for ordinary men or women in the street.",
"Do not let %ORG% con you like they always do with one scheme or another %PASTTIMEPERIOD%. They are the only ones %DOINGSOMETHINGWRONG%.",
"You will struggle to find a bigger collection of %FOOL%s and %FOOL%s than %ORG%.",
"%ORG% crying because their toys have been taken away from them shocker.",
"Wake up, %ORG%. You're the %STUPIDEST% of all.",
"Some %COMMONSENSE% would do %ORG% a world of good.",
"What a %STUPID% %IDEA%, trust %ORG% to come up with this %INSULT% %IDEA%.",
"%IGNORANCE% %WINS% in %ORG% circles once again.",
"Isn't this a great example of what a %EXTREME% %WHITEELEPHANT% %ORG% has become?",
'%ORG% have a lot in common with that %HITLER% in their "Let them eat cake" attitude.',
"I am %ANGRYABOUT% hearing everyone rail against %ORG%.",
"Too bad %ORG% do not have the facility to think ahead and to think clearly but instead are ruled by emotion alone.",
"It's about time this kind of behaviour induced by %POLICY% was confronted head on and stopped now before %ORG% lead the lemmings over the cliff...~for a laugh!",
"%TYPICAL% %ORG%.",
"This just shows us %ORG%'s real agenda.",
"It is almost %EXTREME% reading all these %COMMENT%s, from people that have absolutely no %IDEA% of the internal structure of %ORG%.",
"Is there no end to %ORG%'s face-saving measures?",
"They are not interested in %ISSUE%. They just want a stick to beat %ORG% with.",
"%ORG% has created a virtual Disneyland for %POLICY%.",
];

$comments{statements} = [
"It's about time %STATE%, and the sooner the better.",
];

$comments{discussion} = [qw/
discussion
debate
talk
deliberation
dialogue
arguments
content
/];

$comments{intelligent} = [qw/
balanced
perceptive
shrewd
clever
worthwhile
intelligent
sensible
educated
/];

$comments{person} = [
"Come on folks, let's give %PERSON% %SEXPOS% props.",
"I want to believe, %PERSON%.",
"Well said %PERSON%, they are falling into the age-old trap of timidity in the face of an insidious enemy that has no such qualms about lying and other underhand tactics.",
"That is why no one is listening, %PERSON%. Nor should they be....",
"Don't be %STUPID% %PERSON%.",
"Don't worry about %PERSON%, give 'em enough rope and sooner or later they'll manage to shoot themselves with it.",
"A trenchant critique from %PERSON%.",
"%PERSON% - thanks for injecting a note of %COMMONSENSE% into this %DISCUSSION%. ",
"They might meet their match with ole' %PERSON% - %SEXPRO% has even more %INSULT% self-regard for the %INSULT% %NONSENSE% that %SEXPRO% confabulates in what passes for a brain than they do.",
"%ITHINKTHAT% %PERSON% goes into these rants deliberately to stir controversy and generate lots of %COMMENT%s to show %SEXPOS% employer %SEXPRO% is worthy of retaining.",
"%PERSON% might have been %INTELLIGENT% once, but this %ARTICLE% is a %WHITEELEPHANT%. If this is all %SEXPRO% can produce today it is time for %SEXOBJ% to quietly retire before %SEXPRO%  destroys any reputation %SEXPRO%  may have left.",
"%ITHINKTHAT% it's worth reminding ourselves what a %EXTREME% %INSULT% %FOOL% %PERSON% is.",
"%PERSON% %EXTENDEDPERSONINSULT%.",
"What makes me more sad than the fact that the %COMMENT%s were made is that %PERSON% lacks the %COMMONSENSE% to admit that %SEXPRO% was %WRONG% and that an apology should be forthcoming.",
"%PERSON% wants to blow off steam ... fine .... but it's not %NEWSWORTHY%.",
"You can't have your cake and eat it %PERSON% - ask %HITLER%!",
"Who cares what %PERSON% thinks?",
"Why can't people admit that %PERSON% %EXTENDEDPERSONINSULT% and %EXTENDEDPERSONINSULT%?",
"%PERSON% has put the cart before the horse. In fact %SEXPRO% has put all of the carts before the horse.",
"%PERSON% I really feel for you.",
"%ITHINKTHAT% %PERSON% can accidentally stumble upon some %INTELLIGENT% %DISCUSSION%, yet later %POISON% undermines %SEXPOS% work, removing any support %SEXPRO% may win for %SEXPOS% %DISCUSSION%. ",
"If what %PERSON% said is true...and %NOW% it seems to be so...the people who propagated this %STUPID% %NONSENSE% must be held to account. ",
"%PERSON% should really know a lot better. ",
"I'm with %PERSON% on this one.",
"Someone criticised %PERSON%? Disgraceful.",
"All we hear about is %PERSON%.",
"Whatever faults %PERSON% might have, at least %SEXPRO%'s someone who's actually done something %NEWSWORTHY%, unlike a lot of the people criticizing %SEXOBJ%.",
"I was %EXTREME%ly appalled and shocked to hear %PERSON%'s %EXTREME%ly %STUPID% approach.",
"%ANGRYABOUT% %PERSON% %WHINING%.",
"%PERSON% %EXTENDEDPERSONINSULT% and %EXTENDEDPERSONINSULT%.",
"Let's have some justice for %PERSON%.",
"Am afraid %PERSON% %EXTENDEDPERSONINSULT%.",
"Remember %PERSON%, 'talk is cheap'.",
"I genuinely do not get %PERSON%. Genuinely. Do. Not.",
"%PERSON%, who first appeared on the scene as a %STUPID% but endearing %PUPPET% for %POLICY%, has now graduated to become the %PUPPET% for those suffering from terminal %IGNORANCE%.",
];

$comments{futuretimeperiod} = [
"for an eternity, or at least a minimal googolplex",
"in the now or never",
", and the sooner the better",
];

$comments{now} = [
"at this late date",
"these days",
"so far",
];

$comments{pasttimeperiod} = [
"through the ages",
"from day one",
"in recent years",
"never before seen in human history unfolding before our eyes these last months",
"in the bygone decade",
"since time immemorial",
];

$comments{mistake} = [qw/
misunderstanding
misconception
contradiction
error
excess
inaccuracy
blunder
distortion
/];

$comments{doingsomethingwrong} = [
'stirring up trouble',
'adding insult to injury',
'profiting from all this while you suffer the brunt and pain',
];


$comments{wins} = [
"reigns supreme",
"triumphs",
"prevails",
"dominates",
"wins out",
"carries the day",
];

$comments{puppet} = [
"%POISON% puppet",
"poster \%BOY%",
];

$comments{whining} = [qw/
whining
complaining
whinging
/];

$comments{policy} = [
"global corporate policy",
"%POISON%, %POISON%, %POISON%, %POISON% and %POISON%",
"those who can't handle reality to immerse themselves in",
];

$comments{is} = [
"was and remains",
"is",
"is looking more and more like %SEXPRO% is",
];

$comments{commonsense} = [
"common sense",
"perspective",
"insight",
"intelligence",
"backbone",
"rationality",
"moral fortitude and maturity",
"adultness",
];

$comments{reallygoodforyou} = [
"really good for you",
"just common sense",
];

$comments{comment} = [qw/
response
comment
reply
post
/];

$comments{hitler} = [
"the Nazis",
"Adolf Hitler",
"Marie Antoinette",
"Pol Pot",
"Mussolini",
"Napoleon Bonaparte",
"18th century Mary-Ann Twanet",
"Margaret Thatcher",
];

$comments{whiteelephant} = [
"dead duck",
'white elephant',
'albatross',
'embarrassment',
'dead weight',
'waste of time',
'waste of space',
];

$comments{fool} = [qw/
crybaby
fool
idiot
moron
wanker
nonentity
ninny
nincompoop
dimwit
zero
zealot
wimp
sleep-walker
gas-bag
sheep
/,
"low-watt bulb",
"bullshit artist",
"piss taker",
];

$comments{biased} = [qw/
biased
preconceived
partisan
scaremongering
chauvinistic
warped
garbled
doctrinaire
opinionated
tortured
/];

$comments{ignorance} = [qw/
witlessness
stupidity
ignorance
insanity
foolishness
misinformation/,
'wishful thinking',
"short-sightedness"
];

$comments{article} = [qw/
piece
article
thread
/,
"web page",
"pub bore rant",
];

$comments{flawed} = [
"deeply flawed",
"riddled with problems",
"lacking in profound %COMMONSENSE%",
"shoddy",
];

$comments{nonsense} = [qw/
bilge
crap
balls
claptrap
rubbish
nonsense
tomfoolery
buffoonery
silliness
garbage
hocus-pocus
absurdity
idiocy
mewling
/];

$comments{stupid} = [
"witless",
"absurd",
"barmy",
"crazy",
"fatuous",
"foolish",
"idiotic",
"illogical",
"inaccurate",
"mad",
"mealy-mouthed",
"nutty",
"pointless",
"reprehensible",
"ridiculous",
"shoddy",
"silly",
"simple-minded",
"stupid",
"unprofessional",
"useless",
"vacuous",
];

$comments{extreme} = [qw/
absurd
amazing
astounding
bizarre
incredible
ludicrous
outrageous
remarkable
staggering
unbelievable
/];

$comments{very} = [qw/
utter
complete
/];


$comments{insult} = [
"bloated",
"addled",
"mealy-mouthed",
"wishy-washy",
"feeble-minded",
"dumb ass",
"incoherent",
"ill-informed",
"childish",
"contentless",
"small-minded",
"pointless",
];

$comments{angryabout} = [
"furious about",
"very angry about",
"sick to death of",
"sick and tired of",
"fed up with",
];

$comments{farce} = [qw/
farce
joke
pantomime
charade
/];
 
$comments{randomanswer} = [
"no",
"yes",
"of course",
"never",
"you must be joking",
];

$comments{punishment} = [
"the chain gang",
"the birch",
"the stocks",
"hanging",
"stoning",
"hanging, drawing and quartering",
"crucifixion",
"major brain surgery",
];

$comments{extendedpersoninsult} = [
"%IS% over %SEXPOS% head",
"%IS% the tool of special interest groups",
"%IS% a %STUPID% %SEXNOUN% driven by %SEXPOS% ego",
"%IS% unable to brook any %OPINION% or %OPINION% other than %SEXPOS% own",
"%IS% all talk and no trousers",
"%IS% probably either sad, mad or bad",
"probably should be looked after for the rest of %SEXPOS% life in a secure environment",
"is as useful as a chocolate tea pot",
"%IS% %EXTREME%ly %STUPID% at %SEXPOS% job, and should have been fired years ago",
"is a %STUPID% %FOOL% who has no %IDEA% of what life is like for people in the real world",
"hasn't had an original thought in %SEXPOS% life, never mind an active one",
];

$comments{idea} = [qw/
idea
notion
thought
inkling
inspiration
presumption
hypothesis
concept
/];


$comments{type} = [
"teenager",
"ten-year old",
"old-age pensioner",
"normal person",
"man on the Clapham omnibus",
];

$comments{sadly} = [
"sadly",
"unfortunately",
"regrettably",
];

$comments{socalled} = [
"wannabe",
"so-called",
"would-be",
];

$comments{simple} = [qw/
obvious
simple
straightforward
crystal-clear
self-evident
undeniable
/];

$comments{stupidest} = [qw/
stupidest
dumbest
daftest/,
"most absurd",
"most ridiculous",
];

$comments{job} = [qw/
accountant
do-gooder/,
"supermarket~check-out~employee",
];

$comments{issue} = [
"this question",
"what was reported to be said",
"stuff like this",
"the wider issue",
];

$comments{weakness} = [
"weakness",

];

$comments{opinion} = [
"opinion",
"criticism",
];

$comments{typical} = [qw/
typical
consummate
quintessential
standard
usual
true-to-form
/];

$comments{laughingstock} = [
'a laughing stock',
'figures of fun',
];

$comments{ithinkthat} = [
"ominous signs lead me to the conclusion that",
"I'd have thought",
"I can't help thinking that",
"it seems to me that",
"I think",
"it seems",
"IMHO",
"I suppose",
"I feel that",
"you will have noticed that",
"interesting to note that",
];

$comments{wrong} = [
'wrong',
'incorrect',
'missing the point',
];

$comments{poison} = [qw/
propaganda
poisoning
lies
canards
invective
psychology/,
'behavioural manipulation'];

$comments{disaster} = [
'impending negative/detrimental consequential outcomes',
"having to spend our last days living in upturned milk crates, eating insects out of each other's hair",
"sticking red hot needles in our eyes",
];

$comments{newsworthy} = [qw/
significant
newsworthy
/];

$comments{boring} = [qw/
boring
tired
tedious
depressing
pathetic
stupefying
/];

$comments{gosh} = [
'good golly',
'gawd',
'wow',
"Oh for god's sake",
"Oh god"
];

$comments{boffin} = [qw/
scientist
boffin/,
'magic~fairy',
'wise~man',
];

sub is_plural
{
    my ($word) = @_;
    my ($first_word, undef) = split /\s+/, $word, 2;
    if ($first_word) {
        $word = $first_word;
    }
    if ($word =~ /s$/i) {
        return 1;
    }
    return;
}

sub random_comment
{
    my ($type) = @_;

    if (!$comments{$type}) {
        die "No $type comments";
    }
    my $nvalues = scalar @{$comments{$type}};
    my $random = int (rand () * $nvalues);
    return $comments{$type}->[$random];
}

sub person_comment
{
    my ($person, $sex) = @_;
#    print "$person, $sex\n";
    my $comment = random_comment ("person");
    $comment =~ s/%PERSON%/$person/g;
    return $comment;
}

sub org_comment
{
    my ($org, $sex) = @_;
    my $comment = random_comment ("org");
    $comment =~ s/%ORG%/$org/g;
    return $comment;
}

sub about_comment
{
    my ($about) = @_;
    my $comment = random_comment ("about");
    $comment =~ s/%ABOUT%/$about/g;
    # Assume singular/uncountable at first.
    my $aboutmuch = "much";
    my $aboutdonot = "doesn't";
    my $aboutbe = "is";
    my $aboutits = "its";
    my $aboutthem = "it";
    if (is_plural ($about)) {
        # Check for plurality
        $aboutdonot = "don't";
        $aboutbe = "are";
        $aboutmuch = "many";
        $aboutits = "their";
        $aboutthem = "them";
    }
    $comment =~ s/%ABOUTBE%/$aboutbe/g;
    $comment =~ s/%ABOUTMUCH%/$aboutmuch/g;
    $comment =~ s/%ABOUTDONOT%/$aboutdonot/g;
    $comment =~ s/%ABOUTITS%/$aboutits/g;
    $comment =~ s/%ABOUTTHEM%/$aboutthem/g;
    return $comment;
}

sub get_random_unused
{
    my ($type, $used_ref) = @_;
    my @list = @{$comments{$type}};
    my $count = 0;
    while ($count < 100) {
        $count++;
        my $random = int (rand () * @list);
        next if $used_ref->{$type}{$random};
        $used_ref->{$type}{$random} = 1;
        return $list[ $random ];
    }
    die "Too many attempts to find an unused phrase.";
}

sub subs_word_types
{
    my ($comment, $sex) = @_;

    my @types = qw/extendedpersoninsult extreme insult fool stupid
                   angryabout farce randomanswer punishment nonsense
                   article biased ignorance comment reallygoodforyou
                   commonsense hitler flawed whiteelephant is type
                   sadly socalled simple policy puppet whining
                   stupidest idea issue wins job doingsomethingwrong
                   now pasttimeperiod futuretimeperiod discussion
                   intelligent ladedah weakness opinion mistake
                   typical laughingstock ithinkthat wrong poison
                   disaster newsworthy boring gosh boffin/;

    my $matches = join "|", sort {length $b <=> length $a} (map {uc $_} @types);
    my $count = 0;
    my %used;
    while ($comment =~ /(%($matches)%)(s)?/) {
        my $replace = $1;
        my $type = lc $2;
        my $plural = $3;
        my $substitute = get_random_unused ($type, \%used);
	if ($comment =~ /\ba $replace/) {
            $substitute = A($substitute);
	    $comment =~ s/a $replace/$substitute/;
	} elsif ($comment =~ /${replace}ly/ && $substitute =~ /le$/) {
	    $substitute =~ s/le$/ly/;
	    $comment =~ s/${replace}ly/$substitute/;
        } elsif ($plural) {
            $substitute = PL ($substitute);
	    $comment =~ s/${replace}s/$substitute/;
	} else {
	    $comment =~ s/$replace/$substitute/;
	}
        $count++;
        if ($count > 1000) {
            die "Endless loop detected substituting $replace for $substitute in $comment";
        }
    }
    my $sexpro = "he";
    my $sexpos = "his";
    my $sexobj = "him";
    my $sexnoun = "man";
    my $sexboy = "boy";
    if ($sex && $sex eq "female") {
        $sexpro = "she";
        $sexpos = "her";
        $sexobj = "her";
        $sexnoun = "woman";
        $sexboy = "girl";
    }
    $comment =~ s/%SEXPRO%/$sexpro/g;
    $comment =~ s/%SEXPOS%/$sexpos/g;
    $comment =~ s/%SEXOBJ%/$sexobj/g;
    $comment =~ s/%SEXNOUN%/$sexnoun/g;
    $comment =~ s/%BOY%/$sexboy/g;
    return $comment;
}

# Test that all  the phrases are being substituted properly.

sub test_phrases
{

}

sub make_comment
{
    my ($params) = @_;
    my @comment;

    push @comment, random_comment ("starter");
    my @pieces;
    if ($params->{about}) {
        push @pieces, about_comment ($params->{about});
    }
    if ($params->{person}) {
        my $person_comment = person_comment ($params->{person});
        push @pieces, $person_comment;
    }
    if ($params->{organization}) {
        push @pieces, org_comment ($params->{organization});
    }
    if (! $params->{sex}) {
        $params->{sex} = 'male';
    }

    if (@pieces) {
        if (@pieces > 1) {
            fisher_yates_shuffle (\@pieces);
        }
        push @comment, @pieces;
    }
    push @comment, random_comment ("rubbish");

    my $comment = join " ", @comment;
    $comment = subs_word_types ($comment, $params->{sex});
    # Capitalize the first letter of each sentence.
    $comment =~ s/(^|[.?!]\s+)([a-z])/$1\u$2/g;
    # tilde to space
    $comment =~ s/~/ /g;

    return $comment;
}

# http://community.livejournal.com/perl/101830.html?thread=755654#t755654

sub fisher_yates_shuffle {
    my $array = shift;
    my $i;
    for ($i = @$array; --$i; ) {
        my $j = int rand ($i+1);
        next if $i == $j;
        @$array[$i,$j] = @$array[$j,$i];
    }
}

my @variables = qw/about person organization sex/;

sub get_variables
{
    return @variables;
}


1;

