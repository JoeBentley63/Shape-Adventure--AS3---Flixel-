package ie.lit.jb 
{
	import org.flixel.FlxGroup;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	/**
	 * ...
	 * @author Joseph Bentley
	 */
	public class Gate extends FlxSprite
	{
		[Embed(source="/../jb/Assets/gate.png")]	private var texture:Class;
		private var switches : FlxGroup;
		private var gateOn : Boolean = false;
		public function Gate(pos : FlxPoint,switches : FlxGroup) 
		{
			super(pos.x, pos.y, texture);
			this.immovable = true
			this.switches = switches;
		}
		
		public function Update() : Boolean
		{
			if (gateOn == true && y < 500)
			{
				y += 10;
			}
			for (var i : int = 0; i < switches.members.length; i ++)
			{
				if (switches.members[i] != null)
				{
					if (switches.members[i].On == false)
					{
						
						return false;
					}
				}
			}
			
			gateOn = true;
			return true;
		}
	}

}