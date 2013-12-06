package ie.lit.jb 
{
	import com.newgrounds.*;
	import com.newgrounds.components.*;
	import flash.geom.Point;
	import ie.lit.jb.DialogManager;
	import ie.lit.jb.Assets.Entrance;
	import ie.lit.jb.Dungeon.Teleporter;
	import ie.lit.jb.NPCs.NPCManager;
	import ie.lit.jb.NPCs.OldManSquare;
	import ie.lit.jb.NPCs.NpcConvoFixer;
	import ie.lit.jb.Player;
	import org.flixel.*;
   
	 
    public class GameMain extends FlxState
    {
		private var teleporter : Teleporter;
        private var player:Player;
		public var level1:StartLevel;
		private var textManager : DialogManager;
		private var npcManager : NPCManager;
		private var buildingManager : BuildingManager;
		private var doorManager : DoorManager;
		private var bounds : FlxRect;
		
		[Embed(source = "../jb/Assets/Player.png")]public var playerTexture:Class;
		[Embed(source = "../jb/Assets/rect5434.png")]public var Level1Texture:Class;
		[Embed(source = "../jb/Assets/DialogBox.png")]public var DialogBoxTexture:Class;
		[Embed(source = "../jb/Assets/Map.png")]public var treesTexture:Class;
		[Embed(source = "../jb/Assets/OldManHouse.png")]public var OldManBuilding:Class;
		[Embed(source = "../jb/Assets/SquareBuilding1.png")]public var Square1Texture:Class;
		[Embed(source = "../jb/Assets/SquareBuilding2.png")]public var Square2Texture:Class;
		[Embed(source = "../jb/Assets/SquareBuilding3.png")]public var Square3Texture:Class;
		[Embed(source = "../jb/Assets/DavidsHouse.png")]public var DavidHouseTexture:Class;
		[Embed(source = "../jb/Assets/TrippyTriangleHouse.png")]public var TrippyHouseTexture:Class;
		[Embed(source = "../jb/Assets/MountainHouse.png")]public var MoutainHouseTexture:Class;
		[Embed(source = "../jb/Assets/clothesLine.png")]public var clothesLineTexture:Class;
		[Embed(source = "../jb/Assets/Fountain.png")]public var FountainTexture:Class;
		[Embed(source = "../jb/Assets/HUDBar.png")]public var HUDTexture:Class;
		[Embed(source = "../jb/Assets/Switch.png")]public var switchTexture:Class;
		[Embed(source = "../jb/Assets/Lock.png")]public var lockTexture:Class;
		[Embed(source = "../jb/Assets/entrance.png")]public var entranceTexture:Class;
		[Embed(source="../jb/Assets/JoesTown.mp3")] public var townMusic:Class;
		private var dungeonEntranceOne : Entrance;
		private var dungeonEntranceTwo : Entrance;
		private var dungeonEntranceThree : Entrance;
		
		private var playerStart : FlxPoint = new FlxPoint(0, 0);
		
		private var boomMedal : Boolean = false;
		
        public function GameMain(playerPos : FlxPoint)
        {
			super();
			FlxG.bgColor = 0xff99FF55;
			playerStart = playerPos;
        }
 
        override public function create():void
        {
			
			FlxG.camera.flash(0x000000, 1, null, false);
			

			super.create();
			FlxG.worldBounds = new FlxRect( -500, -500, 5120, 5120);
						//99FF55
            FlxG.mouse.hide();
			
			level1 = new StartLevel(this, Level1Texture, treesTexture);
			buildingManager = new BuildingManager();
			buildingManager.AddBuilding(OldManBuilding, new FlxPoint(180, 1405),0xffffff);
			buildingManager.AddBuilding(Square1Texture, new FlxPoint(2325, 192),0xffffff);
			buildingManager.AddBuilding(Square2Texture, new FlxPoint(2476, 192), 0xffffff);
			buildingManager.AddBuilding(Square1Texture, new FlxPoint(2628, 192), 0xffffff);
			buildingManager.AddBuilding(Square3Texture, new FlxPoint(2780, 190), 0xffffff);
			buildingManager.AddBuilding(Square2Texture, new FlxPoint(2934, 192), 0xffffff);
			buildingManager.AddBuilding(Square2Texture, new FlxPoint(2934, 192), 0xffffff);
			buildingManager.AddBuilding(DavidHouseTexture, new FlxPoint(2998, 400), 0xffffff);
			
			buildingManager.AddBuilding(Square2Texture, new FlxPoint(2325, 720),0xffffff);
			buildingManager.AddBuilding(Square1Texture, new FlxPoint(2476, 720), 0xffffff);
			buildingManager.AddBuilding(Square2Texture, new FlxPoint(2628, 720), 0xffffff);
			buildingManager.AddBuilding(Square2Texture, new FlxPoint(2780, 720), 0xffffff);
			buildingManager.AddBuilding(Square2Texture, new FlxPoint(2934, 720), 0xffffff);
			buildingManager.AddBuilding(clothesLineTexture, new FlxPoint(5247, 1200), 0xffffff);
			buildingManager.AddBuilding(clothesLineTexture, new FlxPoint(4500, 450), 0xffffff);
			buildingManager.AddBuilding(MoutainHouseTexture, new FlxPoint(4380, 896), 0xffffff);
			buildingManager.AddBuilding(MoutainHouseTexture, new FlxPoint(4400, 400), 0xffffff);
			buildingManager.AddBuilding(MoutainHouseTexture, new FlxPoint(4600, 400), 0xffffff);
			buildingManager.AddBuilding(MoutainHouseTexture, new FlxPoint(4800, 400), 0xffffff);
			buildingManager.AddBuilding(MoutainHouseTexture, new FlxPoint(5000, 400), 0xffffff);
			
			buildingManager.AddBuilding(MoutainHouseTexture, new FlxPoint(4400, 1246), 0xffffff);
			buildingManager.AddBuilding(MoutainHouseTexture, new FlxPoint(4600, 1246), 0xffffff);
			buildingManager.AddBuilding(MoutainHouseTexture, new FlxPoint(4800, 1246), 0xffffff);
			buildingManager.AddBuilding(MoutainHouseTexture, new FlxPoint(5000, 1246), 0xffffff);
			
			buildingManager.AddBuilding(MoutainHouseTexture, new FlxPoint(5451, 1160), 0xffffff);
			
			buildingManager.AddBuilding(TrippyHouseTexture, new FlxPoint(5225, 668), 0xffffff);
			buildingManager.AddBuilding(FountainTexture, new FlxPoint(2575, 462), 0xffffff);
			
			textManager = new DialogManager(this, DialogBoxTexture,HUDTexture);
			player = new Player(this, playerTexture,textManager,level1.levelTiles,playerStart);
			doorManager = new DoorManager(player,this);
			//doorManager.AddSwitchAndDoor(new Door(this, new FlxPoint(3302, 1067), lockTexture, 0, 256),new Switch(this,new FlxPoint(3470,512),switchTexture,0));
			//doorManager.FinishedAdding();
			buildingManager.FinishedAddingBuildings(this,player);
			npcManager = new NPCManager(this, player, level1.levelTiles, textManager);
			FlxG.worldBounds = new FlxRect((player.playerTexture.x - FlxG.width / 2) - 10, (player.playerTexture.y - FlxG.height / 2) - 10, FlxG.width + 20, FlxG.height + 20);
			
			dungeonEntranceOne = new Entrance(new FlxPoint(155, 1795), new FinalDungeon(new FlxPoint(16 * 4,24)),entranceTexture);
			dungeonEntranceTwo = new Entrance (new FlxPoint(3301, 1161), new Dungeon(new FlxPoint(24,24)), entranceTexture);
			dungeonEntranceThree = new Entrance (new FlxPoint(5399, 925), new Dungeon(new FlxPoint(640 - (16 * 3), 480 - (16 * 4))), entranceTexture);
			
			this.add(dungeonEntranceOne);
			this.add(dungeonEntranceTwo);
			this.add(dungeonEntranceThree);
			teleporter = new Teleporter(new FlxPoint(5435,770));
			add(teleporter);
			textManager.AddHud();
			textManager.AddDialogBox();
			FlxG.playMusic(townMusic);
			
		}
		
		public function enterDungeon(obj1 : FlxObject, obj2 : FlxObject) : void
		{
			var dungeon : Entrance = obj2 as Entrance;
			FlxG.switchState(dungeon.level);
		}
		
		public function Teleport (obj1 : FlxObject, obj2 : FlxObject) : void
		{
			player.playerTexture.x = 155;
			player.playerTexture.y = 1171;
		}
		
		override public function update():void
		{
			FlxG.bgColor = 0xff99FF55;

			FlxG.worldBounds.x = (player.playerTexture.x - FlxG.width / 2) - 10;
			FlxG.worldBounds.y =(player.playerTexture.y - FlxG.height / 2) - 10
			FlxG.collide(player.playerTexture,level1.levelTiles);
			FlxG.collide(player.playerTexture, dungeonEntranceOne, enterDungeon);
			FlxG.collide(player.playerTexture,dungeonEntranceTwo,enterDungeon);
			FlxG.collide(player.playerTexture,dungeonEntranceThree,enterDungeon);
			FlxG.collide(player.playerTexture,teleporter,Teleport);
			
			super.update();
			player.UpdateLogic();
			textManager.Update();
			buildingManager.Update();
			npcManager.Update();
			doorManager.Update();
			
			if (textManager.Has("Boomerang") && !boomMedal)
			{
				boomMedal = true;
				
				var medalPopup:MedalPopup = new MedalPopup();
				medalPopup.x = medalPopup.y = 5;
				
				API.unlockMedal("BoomerangGet!");
			}
			
			super.update();
		}
    }
}