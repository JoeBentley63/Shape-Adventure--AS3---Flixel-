package ie.lit.jb 
{
	import ie.lit.jb.Assets.Entrance;
	import ie.lit.jb.Dungeon.DungeonPlayer;
	import ie.lit.jb.Dungeon.ToggleSwitch;
	import ie.lit.jb.Light;
	import ie.lit.jb.Menu;
	import ie.lit.jb.NPCs.ConversationNPC;
    import org.flixel.*;
 
    public class FinalDungeon extends FlxState
    {
        private var backButton:FlxButton;
		private var player : DungeonPlayer;
		public var tileMap : FlxTilemap;
		public var levelTiles : FlxTilemap;
		private var darkness:FlxSprite;
		private var light:Light;
		private var switches1 : FlxGroup;	
		private var switches2 : FlxGroup;
		private var switches3 : FlxGroup;
		
		private var gates : FlxGroup;
		private var dialog : DialogManager;
		private var signs : FlxGroup;
	    private var exit : Entrance;
		private var enter : Entrance;
		private var playerStart : FlxPoint = new FlxPoint(0,0);
		[Embed(source = "../jb/Assets/DungeonTile.png")]public var tileTex:Class;
		[Embed(source = "../jb/Assets/tinySign.png")]public var SignTexture:Class;
		[Embed(source="../jb/Assets/DUNGEON.mp3")] public var dungeonMusic:Class;
		
		protected var tiles : Array =  new Array(
			1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			1,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			1,1,1,1,1,1,1,1,1,0,0,0,0,1,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			1,1,1,1,1,1,1,1,1,0,0,0,0,1,0,0,0,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,2,2,4,2,2,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,2,0,0,0,2,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			1,1,1,1,1,1,0,0,0,0,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			1,1,1,1,1,1,0,0,0,0,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			1,1,1,1,1,1,0,0,0,0,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			1,1,1,1,1,1,0,0,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,
			1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,
			1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,1,0,1,0,0,0,0,1,1,1,1,1,1,
			1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,0,1,1,1,1,0,1,1,1,1,1,1,
			1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,0,1,1,1,1,0,1,1,1,1,1,1,
			1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,3,1,1,1,0,1,1,1,1,0,1,1,1,1,1,1,
			1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,1,1,1,1,0,1,1,1,1,1,1,
			1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,
			1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,3,1,1,1,
			1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,
			1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,3,1,1,1,1,1,0,1,1,1,1,1,1,
			1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,1,
			1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,
			1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,
			1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
			1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1);

		
		[Embed(source = "../jb/Assets/dungeonPlayer.png")]public var playerTexture:Class;
		[Embed(source = "../jb/Assets/DialogBox.png")]public var DialogBoxTexture:Class;
		[Embed(source = "../jb/Assets/HUDBar.png")]public var HUDTexture:Class;
		[Embed(source = "../jb/Assets/entranceMini.png")]public var entranceTexture:Class;
        public function FinalDungeon(playerStart : FlxPoint)
        {
			this.playerStart = playerStart;
			switches1 = new FlxGroup(2);
			switches2 = new FlxGroup(1);
			switches3 = new FlxGroup(3);
			signs = new FlxGroup(10);
			gates = new FlxGroup(20);
			dialog = new DialogManager(this, DialogBoxTexture, HUDTexture);
			exit = new Entrance(new FlxPoint(640 - 32, 480 - (16 * 4)),new EndSplash, entranceTexture);
			enter = new Entrance(new FlxPoint(32,16), new GameMain(new FlxPoint(322,1727)), entranceTexture);
			FlxG.bgColor = 0xff000000;
			
        }
	    override public function draw():void 
		{
			FlxG.bgColor = 0xff000000;

			darkness.fill(0xff000000);
			super.draw();
		}
        override public function create():void
        {
			FlxG.worldBounds = new FlxRect( 0, 0, 640, 480);
			FlxG.camera.flash(0x000000, 1, null, false);
			
            //FlxG.mouse.show();
			super.create();
			tileMap = new FlxTilemap();
			tileMap.loadMap(FlxTilemap.arrayToCSV(tiles, 40, false), tileTex,0,0,FlxTilemap.OFF)
			add(tileMap);
			darkness = new FlxSprite(0,0);
			darkness.makeGraphic(FlxG.width, FlxG.height, 0xff000000);
			darkness.scrollFactor.x = darkness.scrollFactor.y = 0;
			darkness.blend = "multiply";
			light = new Light(FlxG.width / 2, FlxG.height / 2, darkness,0xffffff,1,true);
			var groupOfLights : FlxGroup = new FlxGroup(100);
			var lava : Array = tileMap.getTileCoords(4, true);
			for (var i : int = 0; i < lava.length; i ++ )
			{
				   
					groupOfLights.add(new Light(lava[i].x, lava[i].y, darkness, 0xff0000,2,true));
				
			}
			var torches : Array = tileMap.getTileCoords(3, true);
			for (i = 0; i < torches.length; i ++ )
			{
				groupOfLights.add(new Light(torches[i].x, torches[i].y, darkness, 0x00ffff,1,true));
				
			}
			
			switches1.add(new ToggleSwitch(this, 83, 177, darkness));
			switches1.add(new ToggleSwitch(this, 52, 177, darkness));
			gates.add(new Gate(new FlxPoint(323, 176), switches1));
			gates.add(new Gate(new FlxPoint(339, 176), switches1));
			gates.add(new Gate(new FlxPoint(355, 176), switches1));
			gates.add(new Gate(new FlxPoint(371, 176), switches1));
			gates.add(new Gate(new FlxPoint(387, 176), switches1));
			gates.add(new Gate(new FlxPoint(403, 176), switches1));
			
			switches2.add(new ToggleSwitch(this, 529,465,darkness));
			
			gates.add(new Gate(new FlxPoint(592,416), switches2));
			gates.add(new Gate(new FlxPoint(576,416), switches2));
			gates.add(new Gate(new FlxPoint(560,416), switches2));
			gates.add(new Gate(new FlxPoint(544,416), switches2));
			signs.add(new ConversationNPC(new Array(new FlxPoint(174 , 22.4)), this, SignTexture, "", new Array("Circle Kingdom ->","Caution, tunnels bricked off in a puzzling fashion for your safety.Please turnback"), 0xffffff, dialog, true,22));

			//switches3.add(new ToggleSwitch(this, 175 , 315, darkness));
			//switches3.add(new ToggleSwitch(this, 315,313, darkness));
			//switches3.add(new ToggleSwitch(this, 257,381, darkness));
			//gates.add(new Gate(new FlxPoint(308 , 340), switches3));
			
			 
			//signs.add(new ConversationNPC(new Array(new FlxPoint(19, 20)), this, SignTexture, "", new Array("Dungeon of the sacred Square Kingdom weapon.Progress at your own risk", "[note to gaurds, please change the locks of this place, I hate having to hit all these targets dotted about the place] ","Old Squarese Proverb : 'Boomerang return to those who wait'"), 0xffffff, dialog, true,20));
			//signs.add(new ConversationNPC(new Array(new FlxPoint(306, 115)), this, SignTexture, "", new Array("Beware the Lava, it tends to be bad for your continued existance.","'Thanks to a petition from the local community, we have placed tiny(invisible) fences along the lava, to stop you falling in' - King Square"), 0xffffff, dialog, true,21));
			//signs.add(new ConversationNPC(new Array(new FlxPoint(549, 212)), this, SignTexture, "", new Array("[It seems to be some kind of instruction. It seems to say, that if you move after you throw your boomerang, that it will curve, and if you move in a circle, it will often spiral around you.","Interesting...."), 0xffffff, dialog, true,22));

			// 

			player = new DungeonPlayer(this, playerTexture,dialog,tileMap,darkness,playerStart);

			add(exit);
			add(enter);
			add(switches1);
			add(switches2);
			add(switches3);
			add(gates);
			add(light);
			add(signs);
			add(groupOfLights);
			add(player);
			add(darkness);
			dialog.AddDialogBox();
			//FlxG.camera.follow(player);
			//FlxG.camera.zoom = 2;
			FlxG.playMusic(dungeonMusic);
            
        }
		override public function update():void 
		{
			super.update();
			
			dialog.Update();
			player.Update();
					
			light.x = player.x;
			light.y = player.y;
			
			for (var i : int = 0; i < gates.members.length; i ++)
			{
				if (gates.members[i] != null)
				{
					gates.members[i].Update();
				}
			}
			
			//FlxG.collide(player, tileMap);
			FlxG.collide(player,gates);
			
			if (player.boomerang.boomerang != null && player.boomerang!=null)
			{
		
				FlxG.overlap(player.boomerang.boomerang, switches1, toggles);
				FlxG.overlap(player.boomerang.boomerang, switches2, toggles);
				FlxG.overlap(player.boomerang.boomerang,switches3, toggles);
			}
			ReadDemSigns();
			FlxG.collide(player, exit, Exit);
			FlxG.collide(player, enter, Enter);
		}
		public function test(object1 : FlxObject, object2 : FlxObject) : void
		{
			
		}
		public function Exit(object1 : FlxObject, object2 : FlxObject) : void
		{
			FlxG.switchState(exit.level);
		}
		public function Enter(object1 : FlxObject, object2 : FlxObject) : void
		{
			FlxG.switchState(enter.level);
		}
		public function ReadDemSigns() : void
		{
			var ClosestNPC : NPC;
			var dist : int = 99999;
			for (var i:int = 0; i < signs.length; i ++)
			{
				
				signs.members[i].update();
				var temp : NPC = signs.members[i];
			    var currentDist : int = FlxU.getDistance(new FlxPoint(player.x, player.y), new FlxPoint(temp.x, temp.y));
				
				if ( currentDist < dist )
				{
					ClosestNPC = temp;
					dist =  FlxU.getDistance(new FlxPoint(player.x, player.y), new FlxPoint(temp.x, temp.y));
				}
			}
			if (ClosestNPC != null && dist < 10)
			{
				//FlxG.camera.follow(ClosestNPC);
				
				if (FlxG.keys.Z && dialog.displayText == false)
				{
					var convo : Array = ClosestNPC.GetDialog();
					for (var j : int = 0; j < convo.length; j ++)
					{
						dialog.AddMessage(convo[j]);
					}
					
				}
			}
		}
		public function toggles(object1 : FlxObject, object2 : FlxObject) :void
		{
			
			(object2 as ToggleSwitch).On = true;
			
		}
    }
}