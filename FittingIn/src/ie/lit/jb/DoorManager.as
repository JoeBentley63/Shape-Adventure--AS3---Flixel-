package ie.lit.jb 
{
	import org.flixel.FlxGroup;
	import org.flixel.*
	/**
	 * ...
	 * @author Joseph Bentley
	 */
	public class DoorManager 
	{
		private var switches : FlxGroup = new FlxGroup(100);
		private var doors : FlxGroup = new FlxGroup(100);
		private var playerRef : Player;
		private var level : GameMain;
		public function DoorManager(player : Player,level : GameMain ) 
		{
			
			this.playerRef = player;
			this.level = level;
			
		}
		
		public function AddSwitchAndDoor(door : Door, theSwitch : Switch) : void
		{
			doors.add(door.door);
			theSwitch.SetDoor(door);
			switches.add(theSwitch);
		}
		public function FinishedAdding() : void
		{
			level.add(switches);
		}
		
		public function Update() : void 
		{
			FlxG.collide(playerRef.boomerang.boomerang, switches, ToggleDoor);
			FlxG.collide(playerRef.playerTexture, doors);
			FlxG.collide(playerRef.playerTexture, switches);
		}
		
		public function ToggleDoor(object1 : FlxObject,object2 : FlxObject ) :void
		{
			var objectOfFocus : FlxObject = null;
			
			if (object1 == playerRef.boomerang.boomerang && object2 != playerRef.boomerang.boomerang)
			{
				objectOfFocus = object2;
			}
			else
			{
				objectOfFocus = object1;
			}
			
			var activatedSwitch: Switch = null;
			activatedSwitch = objectOfFocus as Switch;
			if (activatedSwitch != null)
			{
				activatedSwitch.toggleDoor();
			}
		}
	}

}