package ie.lit.jb.Dungeon 
{
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Joseph Bentley
	 */
	public class Teleporter extends FlxSprite
	{
		[Embed(source = "../Assets/teleporter.png")]public var teleporterTex:Class;
		public function Teleporter(pos : FlxPoint) 
		{
			super(pos.x, pos.y, teleporterTex);
			this.immovable = true;
			this.color = 0x00ff00;
			this.alpha = 1;
		}
		
	}

}