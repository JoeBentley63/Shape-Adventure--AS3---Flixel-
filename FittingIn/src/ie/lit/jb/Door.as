package ie.lit.jb 
{
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Joseph Bentley
	 */
	public class Door 
	{
		public var door : FlxSprite;
		private var lock : FlxSprite;
		public  var locked : Boolean;
		private var levelRef : GameMain;
		private var angle : Number;
		private var doorWidth : Number;
		private var position : FlxPoint;
		public function Door(level : GameMain,position : FlxPoint,lock : Class,angle : Number,doorWidth : Number) 
		{
			this.position = position;
			this.doorWidth = doorWidth;
			this.levelRef = level;
			this.angle = angle;
			this.lock = new FlxSprite(position.x, position.y, lock);
			this.door = new FlxSprite(position.x+22, position.y+16);
			this.door.makeGraphic(20, 40, 0xff000000)
			this.door.scale.x = doorWidth/20;
			this.door.angle = angle;
			door.immovable = true;
			locked = true;
			level.add(door);
			level.add(this.lock);
		}
		
		public function Unlock() : void
		{
			if (door != null)
			{
				locked = false;
				levelRef.remove(door);
				door = null;
			}
		}
		
		public function Lock() : void
		{
			if (door == null)
			{
				locked = true;
				this.door = new FlxSprite(position.x, position.y);
				this.door.makeGraphic(doorWidth, 20, 0x000000, false, null);
				this.door.angle = angle;
			}
		}
		
	}

}