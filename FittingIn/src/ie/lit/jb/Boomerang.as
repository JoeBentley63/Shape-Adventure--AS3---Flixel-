package ie.lit.jb 
{
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import org.flixel.FlxTilemap;
	import org.flixel.*;
	/**
	 * ...
	 * @author Joseph Bentley
	 */
	public class Boomerang 
	{
		
		private var target : FlxPoint;
		private var player : FlxSprite;
		public var boomerang : FlxSprite;
		private var velocity : FlxPoint = new FlxPoint(0,0);
		private var hitTarget : Boolean = false;
		public var trailRender : TrailRenderer;
		public var time : Number = 0;
		public var moveAmount : Number = 0.3;
		private var distance : Number = 100;
		private var levelRef : FlxTilemap;
		private var light : Light;
		private var hasLight : Boolean = false;
		private var dialogMan : DialogManager;
		public function Boomerang(BoomerangText : Class,playerRef : FlxSprite,target : FlxPoint,level : FlxState,levelRef : FlxTilemap,hasLight : Boolean,dialogMan : DialogManager,distance : Number = 100,darkness : FlxSprite = null) 
		{
			this.dialogMan = dialogMan;
			this.hasLight = hasLight;
			if (hasLight)
			{
				light = new Light(playerRef.x, playerRef.y, darkness, 0xffffff, 1, true);
			}
			this.levelRef = levelRef;
			this.distance = distance;
			
			player = playerRef;
			boomerang = new FlxSprite(player.x, player.y, BoomerangText);
			this.target = target;
			this.boomerang.elasticity = 1;
			trailRender = new TrailRenderer(level, boomerang, BoomerangText);
			level.add(boomerang);
			//FlxG.play(SoundEffect);
			
		}
		public function Update(/*npcs : FlxGroup*/) : void
		{
			if (boomerang != null)
			{
				if (hasLight)
				{
					light.x = boomerang.x;
					light.y = boomerang.y;
					light.draw();
				}
				if (FlxU.getDistance(new FlxPoint(this.player.x, this.player.y), new FlxPoint( boomerang.x,boomerang.y) )< 200 && boomerang.overlaps(levelRef) == false&& boomerang.x > 0 && boomerang.y > 0)
				{
					if (dialogMan.Has("Teleport Power"))
					{
						this.boomerang.color = 0x008800;
						if(FlxG.keys.V )
						{
						this.player.x = boomerang.x;
						this.player.y = boomerang.y;
						time = 50;
						}
					}
					else
					{
						this.boomerang.color = 0x803300;
					}
				}
				else
				{
					this.boomerang.color = 0x803300;
				}
			
			if (time > 20)
			{
				moveAmount = .8;
				
			}
			if (time > 50 && time < 51)
			{
				this.boomerang.x = player.x;
				this.boomerang.y = player.y;
				this.velocity = new FlxPoint(0, 0);
				
			}
			time += 0.1;
			trailRender.Update(boomerang.angle);
			
			if (boomerang.x < target.x)
			{
				velocity.x += moveAmount;
			}
			if (boomerang.x > target.x)
			{
				velocity.x -= moveAmount;
			}
			
			if (boomerang.y < target.y)
			{
				velocity.y += moveAmount;
			}
			if (boomerang.y > target.y)
			{
				velocity.y -= moveAmount;
			}
			boomerang.x += velocity.x;
			boomerang.y += velocity.y;
			var temp : Number = velocity.x + velocity.y;
			if (temp < 0)
			{
				boomerang.angle -= temp
			}
			else
			{
				boomerang.angle += temp
			}
			if (FlxU.getDistance(new FlxPoint(boomerang.x , boomerang.y), target) < distance)
			{
				hitTarget = true;
				
			}
			if (hitTarget)
			{
				target = new FlxPoint(player.x, player.y);
			}
			}
		}
		
	}

}