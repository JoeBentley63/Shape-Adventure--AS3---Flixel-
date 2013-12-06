package ie.lit.jb.Dungeon 
{
	import ie.lit.jb.Light;
	import org.flixel.*;
 
  public class ToggleSwitch extends FlxSprite 
  {
		[Embed(source="/../Assets/toggle.png")]
		private var LightImageClass:Class;
	 
		private var darkness:FlxSprite;
		public var On : Boolean = false;
		private var timer : Number = 0; 
		private var light : Light;
		public function ToggleSwitch(level : FlxState,posX:Number, posY:Number, darkness:FlxSprite):void 
		{
		  super(posX, posY, LightImageClass);
		  this.alpha = 1;
		  this.darkness = darkness;
		  this.blend = "screen";
		  this.scale = new FlxPoint(1, 1);
		  this.immovable = true;
		  On = false;
		  light = new Light(this.x, this.y, darkness, 0x008000, 1,false);
		  level.add(light);
		}
	 
		public override function update():void 
		{
			super.update();
			if (On)
			{
				this.color = 0xff00ff00;
		
				light.on = true;
				timer += 0.1;
				if (timer > 20)
				{
					timer = 0;
					On = false;
				}
			}
			else
			{
				this.color = 0xffffffff;
				light.on = false;
			}
			
		}
	}
}