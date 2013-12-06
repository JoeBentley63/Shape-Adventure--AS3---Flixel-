package ie.lit.jb.Assets 
{
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	/**
	 * ...
	 * @author Joseph Bentley
	 */
	public class Entrance extends FlxSprite
	{
		public var level : FlxState
		
		public function Entrance(pos : FlxPoint,level : FlxState,doorTex : Class) 
		{
			this.level = level;
			super(pos.x, pos.y, doorTex);
			
		}
		
	}

}