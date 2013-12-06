package ie.lit.jb 
{
	import org.flixel.FlxSprite;
	import org.flixel.*;
	/**
	 * ...
	 * @author Joseph Bentley
	 */
	public class Player 
	{
		[Embed(source = "../jb/Assets/trail.png")]public var TrailTexture:Class;
		[Embed(source = "../jb/Assets/sword.png")]private var swordSprite:Class;
		[Embed(source = "../jb/Assets/boomerang.png")]public var BoomTexture:Class;
		
        private var weaponSelect : Array = new Array(false, false, false, false);
		public var playerTexture: FlxSprite;
		public static var thrownBoomerang : Boolean = false;
		private var testText : FlxText;
		private var dialogManager : DialogManager;
		public  var boomerang : Boomerang = null;
		private var boomerangDirection : FlxPoint = new FlxPoint(0, 0);
		private var level:GameMain
		private var levelRef : FlxTilemap;
		public function Player(level:GameMain, texture:Class,convoManager : DialogManager,levelRef : FlxTilemap,playerStart : FlxPoint) 
		{
			this.levelRef = levelRef;
			weaponSelect[0] = true;
			weaponSelect[1] = false;
			weaponSelect[2] = false;
			weaponSelect[3] = false;
			this.level = level;
			//520,1795
			dialogManager = convoManager;
			playerTexture = new FlxSprite(playerStart.x,playerStart.y, texture);
			FlxG.camera.follow(playerTexture);
			testText = new FlxText(256, 256, 640, "Pos : " + playerTexture.x + " , " + playerTexture.y, false);
		    level.add(playerTexture);
			//level.add(testText);
			boomerang = new Boomerang(BoomTexture,this.playerTexture,new FlxPoint(0,0),level,levelRef,false,dialogManager);
			boomerang.boomerang.visible = false;
						
		}
		public function ResetDatBoomerang(object1 : FlxObject,object2 : FlxObject) :void
		{
			if (boomerang != null && boomerang.boomerang !=null)
			{
				boomerang.boomerang.visible = false;
				thrownBoomerang = false;
				
				level.remove(boomerang.trailRender.trail);
				level.remove(boomerang.boomerang);
				boomerang.boomerang = null;
			}
		}
		public function UpdateLogic():void
		{
			
			if (dialogManager.displayText == false)
			{
				if (FlxG.keys.C && !thrownBoomerang && dialogManager.Has("Boomerang"))
				{
					thrownBoomerang = true;
					//trace("Boomerang GO!!");
					boomerang = new Boomerang(BoomTexture, playerTexture, new FlxPoint(playerTexture.x + (boomerangDirection.x*2), playerTexture.y + (boomerangDirection.y * 2)),level,levelRef,false,dialogManager);
		
				}
				
				if (thrownBoomerang)
				{
					boomerang.Update();
					boomerang.boomerang.visible = true;
					FlxG.collide(boomerang.boomerang, playerTexture, ResetDatBoomerang);
					
				}
				
				if(FlxG.keys.LEFT)
				{
					playerTexture.velocity.x = -100;
					boomerangDirection.x = -100;
					boomerangDirection.y = 0;
				}
				else if(FlxG.keys.RIGHT)
				{
					playerTexture.velocity.x = 100;
					boomerangDirection.x = 100;
					boomerangDirection.y = 0;
				}
				else
				{
					playerTexture.velocity.x = 0;
				}
				if(FlxG.keys.UP)
				{
					playerTexture.velocity.y = -100;
					boomerangDirection.y = -100;
					boomerangDirection.x = 0;
				}
				else if(FlxG.keys.DOWN)
				{
					playerTexture.velocity.y = 100;
					boomerangDirection.y = 100;
					boomerangDirection.x = 0;
				}
				else
				{
					playerTexture.velocity.y = 0;
				}
			}
			else
			{
				playerTexture.velocity = new FlxPoint(0, 0);
			}
			testText.text =  "Pos : " + playerTexture.x + " , " + playerTexture.y;
			testText.x = playerTexture.x;
			testText.y = playerTexture.y;
			
		}
	}
}