package ie.lit.jb 
{
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import org.flixel.*
	/**
	 * ...
	 * @author Joseph Bentley
	 */
	public class Switch extends FlxSprite
	{
		
				
		private var levelRef : GameMain;
		private var angle : Number;
		private var position : FlxPoint;
		private var door : Door;
		public function Switch(level : GameMain,position : FlxPoint,switchTex : Class,angle : Number) 
		{
			this.position = position;
			this.levelRef = level;
			this.angle = angle;
			super(position.x, position.y, switchTex);
			this.immovable = true;
		}
		
		public function SetDoor(door : Door) :void
		{
			this.door = door;
		}
		
		public function toggleDoor() : void
		{
				if (door.locked == true)
				{
					door.Unlock();
				}
				else
				{
					door.Lock();
				}
				FlxG.camera.shake();
		}
		
	}

}