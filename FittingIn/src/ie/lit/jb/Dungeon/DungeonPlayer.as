package ie.lit.jb.Dungeon 
{
	import org.flixel.FlxSprite;
	import org.flixel.*;
	import ie.lit.jb.*;
	/**
	 * ...
	 * @author Joseph Bentley
	 */
	public class DungeonPlayer extends FlxSprite 
	{
		[Embed(source = "../Assets/trail.png")]public var TrailTexture:Class;
		[Embed(source = "../Assets/sword.png")]private var swordSprite:Class;
		[Embed(source = "../Assets/boomerangMini.png")]public var BoomTexture:Class;
		
        private var weaponSelect : Array = new Array(false, false, false, false);
		public var playerTexture: FlxSprite;
		public static var thrownBoomerang : Boolean = false;
		private var dialogManager : DialogManager;
		public  var boomerang : Boomerang = null;
		private var boomerangDirection : FlxPoint = new FlxPoint(0, 0);
		private var level:FlxState;
		private var levelRef : FlxTilemap;
		private var throwTimer : Number = 0;
		private var darkness : FlxSprite;
		public function DungeonPlayer(level:FlxState, texture:Class,convoManager : DialogManager,levelRef : FlxTilemap,darkness : FlxSprite,playerStart : FlxPoint) 
		{
			this.darkness = darkness;
			this.levelRef = levelRef;
			dialogManager = convoManager;
			super(playerStart.x,playerStart.y, texture);
			
		    level.add(playerTexture);
			this.level = level;
			boomerang = new Boomerang(BoomTexture,this,new FlxPoint(0,0),this.level,levelRef,true,dialogManager,50,darkness);
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
		public function Update():void
		{
			
			if (dialogManager.displayText == false)
			{
				if (FlxG.keys.C && !thrownBoomerang && dialogManager.Has("Boomerang"))
					{
						throwTimer = 0;
						thrownBoomerang = true;
						
						boomerang = new Boomerang(BoomTexture, this, new FlxPoint(this.x + (boomerangDirection.x), this.y + (boomerangDirection.y )),level,levelRef,true,dialogManager,50,darkness);
			
					}
				
				if (thrownBoomerang)
				{
					boomerang.Update();
					boomerang.boomerang.visible = true;
					throwTimer += .1
					
					if (FlxU.getDistance(new FlxPoint(this.x, this.y), new FlxPoint(boomerang.boomerang.x, boomerang.boomerang.y)) < 10 && throwTimer >1)
					{
						ResetDatBoomerang(null, null);
						throwTimer = 0;
					}
				}
				
				if(FlxG.keys.LEFT)
				{
					this.velocity.x = -100;
					boomerangDirection.x = -100;
					boomerangDirection.y = 0;
				}
				else if(FlxG.keys.RIGHT)
				{
					this.velocity.x = 100;
					boomerangDirection.x = 100;
					boomerangDirection.y = 0;
				}
				else
				{
					this.velocity.x = 0;
				}
				if(FlxG.keys.UP)
				{
					this.velocity.y = -100;
					boomerangDirection.y = -100;
					boomerangDirection.x = 0;
				}
				else if(FlxG.keys.DOWN)
				{
					this.velocity.y = 100;
					boomerangDirection.y = 100;
					boomerangDirection.x = 0;
				}
				else
				{
					this.velocity.y = 0;
				}
			}
		
			else
			{
				this.velocity = new FlxPoint(0, 0);
			}
		}
	}
}