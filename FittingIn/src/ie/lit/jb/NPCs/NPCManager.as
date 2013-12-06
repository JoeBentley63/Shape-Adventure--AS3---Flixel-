package ie.lit.jb.NPCs 
{
	import ie.lit.jb.DialogManager;
	import ie.lit.jb.GameMain;
	import ie.lit.jb.Player;
	import ie.lit.jb.NPC
	
	import org.flixel.*;
	/**
	 * ...
	 * @author Joseph Bentley
	 */
	public class NPCManager 
	{
		[Embed(source = "../Assets/OldManSquare.png")]public var oldManSquareTexture:Class;
		[Embed(source = "../Assets/Square.png")]public var SquareTexture:Class;
		[Embed(source = "../Assets/ConorTheEgg.png")]public var conorTexture:Class;
		[Embed(source = "../Assets/Triangle.png")]public var triangleTexture:Class;
		[Embed(source = "../Assets/Star.png")]public var starTexture:Class;
		[Embed(source = "../Assets/Hexagon.png")]public var HexagonTexture:Class;
		[Embed(source = "../Assets/Cresent.png")]public var CresentTexture:Class;
		[Embed(source = "../Assets/Sign.png")]public var SignTexture:Class;
		
		private var NPCs : FlxGroup;
		private var playerRef : Player;
		private var levelMap : FlxTilemap;
		private var conversationManagerRef : DialogManager;
		
		public function NPCManager(level : GameMain,player : Player,levelTiles : FlxTilemap,ConversationManagerRef : DialogManager) 
		{
			conversationManagerRef = ConversationManagerRef;
			levelMap = levelTiles;
			playerRef = player;
			
			NPCs = new FlxGroup(100);
			/*
			 * peoples
			 */
			NPCs.add( new OldManSquare(new Array(new FlxPoint(260, 1540)), level, oldManSquareTexture,ConversationManagerRef,true,0));
			NPCs.add( new ConversationNPC(new Array(new FlxPoint(807,640)), level, SquareTexture, "Frank", new Array("The guy running is my brother.He's training for the annual sports day we have in the Square Kingdom.","I'm timing his laps, but I forgot the batteries for my stopwatch, so I'm just shouting random times","He hasn't noticed yet hehe ","......1:56 JIM!! YOU'RE DOING GREAT!!","He's such an idiot"), 0x008080,ConversationManagerRef,true,1));
			NPCs.add( new ItemNPC(new Array(new FlxPoint(2551, 884)), level, SquareTexture, "James", new Array("Ohh man, my washing machine broke this morning, a spring straight up shot out suddenly, almost took my eye out.","To make things worse, I have no idea where it went. any chance you could find it for me?","...","OHH MAN, you found it. here, this is all I have,I found diggin' through my bins "),
			new Array("Working like new man, cheers :D.They say theres a magic man in the mountains who trades them monsters for magic, what what his name.. silly square??,Mumba Wumba??!Trippy Triangle??"),
			new Array("Ohh man, my washing machine broke this morning, a spring straight up shot out suddenly, almost took my eye out.","To make things worse, I have no idea where it went. any chance you could find it for me?","I can't give you money, but I guess I could give you this magical animal I found diggin' through my bins"),
			0x99ff55, ConversationManagerRef, false, "Spring", "Magic Monster"	,2));
			
			NPCs.add( new ConversationNPC(new Array(new FlxPoint(2862, 358)), level, SquareTexture, "Perry", new Array("Everything here is grey and dull, 'cept my house, which is FAB-", "-U-", "LOUS"), 0x008080,ConversationManagerRef,true,3));
			NPCs.add( new ConversationNPC(new Array(new FlxPoint(2176, 957)), level, SquareTexture, "Joe", new Array("There's this weird sign thingy just southwest of town, down a stairs. Its like someone put up a target or something?","I tried hitting it myself, but nothing happend...weird right?","So I looked into it some more, studied it from a distance, studied it up close.Studied it upside down, and with one eye closed","It has been trained well, as it would not release its secrets...weird right?","So I did what any sane square would do, I dressed up like a target,became a target, and over the course of 2 long years, I gained its trust, Its friendship you could say.The secret is, what you hit it with, needs to be spinning...weird right ?"), 0xffcc00,ConversationManagerRef,true,4));
			
			
			//
			NPCs.add( new ItemNPC(new Array(new FlxPoint(312,256)), level, SquareTexture, "'Imaginary' Jake", new Array(".............!!?",
			"Wait... you can see me?...REALLY!!!? OHH THANK THE HEAVENS I TAUGHT I WAS DOOMED!!",
			"I'm the guy next to me's imaginary friend, and for awhile I beleived him, but now....YES!!! I knew I was real ", 
			"...hmmm, I'm going to go ahead and play along though, theres great benifits in being an 'imaginary friend', plus I get to put bug's in all the food I give him .", 
			"Its the little victorys....", 
			"Here, take this "),
			new Array("shhh... don't blow my cover!...scram!![press I to open inventory]"),
			new Array(""),
			0x99ff55, ConversationManagerRef, false, "Nothing!!", "Apple"	,5));
			
			NPCs.add( new ItemNPC(new Array(new FlxPoint(2951, 854)), level, SquareTexture, "Fred", new Array("[rumble]...Man am I hungry. You wouldn't happen to have anything to eat on your would you pal?","YOU DO, aaaawwww yeaaah!! I LOVE APPLES, do you mind if take it . Thank you so much, here, take this ...."),
			new Array("[Om nom nom]"),
			new Array("[rumble]...Man am I hungry. You wouldn't happen to have anything to eat on your would you pal? I can give you this bottle of water in exchange?"),
			0xffaaaa, ConversationManagerRef, true, "Apple", "Water Bottle"	,6));
			
			NPCs.add( new ItemNPC(new Array(new FlxPoint(3052,570)), level, HexagonTexture, "David of 'Questionable Morrals'", new Array("Hey buddy, whatcha' buyin' haha, 'fraid im sold out of everything bar this useless tr...I mean, this just in,a killer BOOMERANG!!, your's today for 1 Square coin hehe","Whats that? YOU'RE ACTUALLY BUYING THIS...ahem, I mean, very good, here you go <sucker haha>[throw with C]"),
			new Array("Hows your...hehe...Boomerang....haha","[throw with C]"),
			new Array("Hey buddy, whatcha' buyin' haha, 'fraid im sold out of everything bar this useless tr...I mean, this just in,a killer BOOMERANG!!, your's today for 1 Square coin hehe"),
			0xffffff, ConversationManagerRef, true, "Square Coin", "Boomerang"	,7));
			
			NPCs.add( new ItemNPC(new Array(new FlxPoint(375,371),
													new FlxPoint(375,803),
													new FlxPoint(1265, 803),
													new FlxPoint(1265, 369)
													), level, SquareTexture, "Jimmy", new Array("I'm training for the Square Kingdom Sports day!","*pant* *pant*, It's hardwork, and I am pooped, got anything on you that could help me cool down?","Thank for the water man, [Glug!, Glug!]...nice","Here, take this for your troubles [tosses coin]"),
			new Array("[glug glug]"),
			new Array("I'm training for the Square Kingdom Sports day!","*pant* *pant*, It's hardwork, and I am pooped, got anything on you that could help me cool down?"),
			0x00ffff, ConversationManagerRef, false, "Water Bottle", "Square Coin",8	));
			
			
			NPCs.add( new ConversationNPC(new Array(new FlxPoint(256, 256)), level, starTexture, "Christy", new Array("Silly Circle, like you, your quest is...POINTLESS!! haha get it, POINT!! LESS!!,","You're a cirle...you have no points......","haha classic","I overheard you speaking with the old Man.So your looking for the circles.Rumor is they locked themselves away from the world in their kingdom far East.They didn't get along with the triangles and squares, and one day, snapped and shut the gates for good.We haven't seen a circle in nearly 100 years"), 0xffcc00,ConversationManagerRef,false,9));
			
			
			NPCs.add( new ItemNPC(new Array(new FlxPoint(4568, 984)), level, SquareTexture, "Will", new Array("[Buuurrr], Gotta love this mountain air.I wouldn't live anywhere else but here.","But man is it cold, any chance you have some apple seeds on you? I heard a rumor that if you plant them in the glacier ice,the shock will from flame apples,kinda a natural defence mechanism or something","You do, ahh man, thanks, here take this.It flew at me from the west, some kinda spring or something?"),
			new Array("Thanks man, gotta wait for the snow to melt a bit so I can treck to the glacier."),
			new Array("[Buuurrr], gotta love this mountain air.I wouldn't live anywhere else but here.","But man is it cold, any chance you have some apple seeds on you? I heard a rumor that if you plant them in the glacier ice,the shock will from flame apples,kinda a natural defence mechanism or something"),
			0xffffff, ConversationManagerRef, false, "Apple Seeds!", "Spring",10));
			
			
			NPCs.add( new ConversationNPC(new Array(new FlxPoint(5263, 1249)), level, SquareTexture, "Paranoid Pete", new Array("Wow?!!!","What are the implications of this!!","Are those clothes on that line or what?!!!","Man... I..I'm not sticking around this town for long","Doesnt feel right at all..."),0x800080,ConversationManagerRef,true,11));
			
			NPCs.add( new ConversationNPC(new Array(new FlxPoint(4802,916)), level, triangleTexture, "Terra", new Array("Beware, Triangles are pointy!"), 0xffff00,ConversationManagerRef,false,12));
		
			NPCs.add( new ItemNPC(new Array(new FlxPoint(5225,800)), level, triangleTexture, "Trippy the Triangle", new Array("Muhahaha!!!","I AM TRIPPY","Give me magic monster, I give you Magical POOOOWERS!!!","Muhahah","...Whats that, you have the creature?","Well dont just stand there, give it here","Here, Boogity Boogity Wah Wah Wah!!","Boogity Boogity Wah Wah Wah!!","[Press V while your boomerang is green to teleport]","Dont question it guy, just roll with it "),
			new Array("[press V to teleport, just make sure its green]"),
			new Array("Muhahaha!!!","I AM TRIPPY","Give me magic monster, I give you Magical POOOOWERS!!!","Muhahah","Feel free to use my teleportor beside my house, it flings you back to the outskirts of the square kingdom Muhahaha!!"),
			0x00ff00, ConversationManagerRef, false, "Magic Monster", "Teleport Power",13));
			
			
			NPCs.add( new ConversationNPC(new Array(new FlxPoint(5148,508)), level, conorTexture, "Conor the 'Genius'", new Array("I'm an Offaly 'Egg'citing guy to hang out with!","What do you mean I dont need glasses because I have no eyes?"), 0xffffffff,ConversationManagerRef,false,14));
			
			NPCs.add( new ConversationNPC(new Array(new FlxPoint(4616,668)), level, CresentTexture, "Leo the crazy crescent", new Array("HOW ARE YOU KEN!!....","What?... your names not ken, wow, egg on my face." , " Sorry, been playing alot of fighting game latly, I like charge characters, but I'd figure you as more of a full circle guy","HAHAHA, get it? cause your a cirlce"), 0x800000,ConversationManagerRef,false,15));
			NPCs.add( new ConversationNPC(new Array(new FlxPoint(4716,668)), level, SquareTexture, "Kevin", new Array("BOOJA BOOJA BOOJA","Oh hey guys, I have a really good idea, I'm gonna stand in the way all day!"), 0x333333,ConversationManagerRef,false,14));
			
			/*
			*/
			/*
			 * Signs
			 */
			NPCs.add( new ConversationNPC(new Array(new FlxPoint(980,666)), level, SignTexture, "", new Array("Press I to view your inventory"), 0xffffff,ConversationManagerRef,true,16));
			NPCs.add( new ConversationNPC(new Array(new FlxPoint(372,1477)), level, SignTexture, "", new Array("Press the Arrow Keys to move..","and Z to read signs and talk to people...but I guess you figured that one out for yourself"), 0xffffff,ConversationManagerRef,true,17));
			NPCs.add( new ConversationNPC(new Array(new FlxPoint(1430,256)), level, SignTexture, "", new Array("-->Square Kingdom ahead","Motto: Be there or be SQUARE!!","Home of the Wopper"), 0xffffff,ConversationManagerRef,true,18));
			NPCs.add( new ConversationNPC(new Array(new FlxPoint(1927,256)), level, SignTexture, "", new Array("Square Kingdom Border"), 0xffffff,ConversationManagerRef,true,19));
			NPCs.add( new ConversationNPC(new Array(new FlxPoint(267,1753)), level, SignTexture, "", new Array("Circle Kingdom Entrance"), 0xffffff,ConversationManagerRef,true,20));
			NPCs.add( new ConversationNPC(new Array(new FlxPoint(3477,518)), level, SignTexture, "", new Array("Triangle Kingdom -> [Path due to be cleared as part of regeneration program] "), 0xffffff,ConversationManagerRef,true,20));
			
			level.add(NPCs);
		}
		public function Update () : void
		{
			
			FlxG.collide(playerRef.playerTexture, NPCs, null);
			if (playerRef.boomerang != null)
			FlxG.collide(playerRef.boomerang.boomerang, NPCs);
			
			
			FlxG.collide(NPCs, NPCs, null);
			FlxG.collide(NPCs, levelMap, null);
			
			var ClosestNPC : NPC;
			var dist : int = 99999;
			for (var i:int = 0; i < NPCs.length; i ++)
			{
				
				NPCs.members[i].update();
				var temp : NPC = NPCs.members[i];
			    var currentDist : int = FlxU.getDistance(new FlxPoint(playerRef.playerTexture.x, playerRef.playerTexture.y), new FlxPoint(temp.x, temp.y));
			
				if ( currentDist < dist )
				{
					ClosestNPC = temp;
					dist =  FlxU.getDistance(new FlxPoint(playerRef.playerTexture.x, playerRef.playerTexture.y), new FlxPoint(temp.x, temp.y));
				}
			}
			if (ClosestNPC != null && dist < 100)
			{
				//FlxG.camera.follow(ClosestNPC);
				FlxCamera
				if (FlxG.keys.Z && conversationManagerRef.displayText == false)
				{
					var dialog : Array = ClosestNPC.GetDialog();
					for (var j : int = 0; j < dialog.length; j ++)
					{
						conversationManagerRef.AddMessage(dialog[j]);
					}
					
				}
			}
			else
			{
				//FlxG.camera.follow(playerRef.playerTexture);
			}
		}
	}

}