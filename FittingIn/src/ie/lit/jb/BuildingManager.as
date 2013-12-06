package ie.lit.jb 
{
	import org.flixel.FlxGroup;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import org.flixel.*;
	/**
	 * ...
	 * @author Joseph Bentley
	 */
	public class BuildingManager 
	{
		private var buildings :FlxGroup;
		private var playerRef : Player;
		
		
		
		
		public function BuildingManager() 
		{
			buildings = new FlxGroup(100);
		}
		
		public function AddBuilding(building : Class, placement : FlxPoint,colour :uint) : void
		{
			var temp : FlxSprite = new FlxSprite(placement.x, placement.y, building);
			temp.color = colour;
			temp.alpha = 1;
			temp.immovable = true;
			buildings.add(temp);
			
		}
		public function FinishedAddingBuildings(level : GameMain,player : Player) : void
		{
			playerRef = player;
			level.add(buildings);
		}
		public function Update() : void
		{
			FlxG.collide(playerRef.playerTexture, buildings);
		}
	}

}