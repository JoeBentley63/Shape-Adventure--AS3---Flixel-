package ie.lit.jb 
{
	import org.flixel.*;
 
  public class Light extends FlxSprite 
  {
		[Embed(source="/../jb/Assets/light.png")]
		private var LightImageClass:Class;
	 
		private var darkness:FlxSprite;
		public var on : Boolean = false; 
		public function Light(x:Number, y:Number, darkness:FlxSprite,colour : uint,scale : int,on : Boolean):void 
		{
		  this.on = on;
		  super(x, y, LightImageClass);
		  this.color = colour;
		  this.alpha = 1;
		  this.darkness = darkness;
		  this.blend = "screen"
		  this.scale = new FlxPoint(scale, scale);
		  
		}
	 
		override public function draw():void 
		{
			if (on)
			{
				var screenXY:FlxPoint = getScreenXY();
				darkness.stamp(this, screenXY.x - this.width / 2, screenXY.y - this.height / 2);
			}
		}
	}
}