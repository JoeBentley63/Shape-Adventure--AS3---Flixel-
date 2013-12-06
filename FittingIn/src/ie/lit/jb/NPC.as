package ie.lit.jb 
{
	import org.flixel.FlxSprite;
	import ie.lit.jb.DialogManager;
	import ie.lit.jb.NPCs.NpcConvoFixer;
	import org.flixel.*;
	/**
	 * ...
	 * @author Joseph Bentley
	 */
	public class NPC extends FlxSprite
	{
		public var conversationController : int = 1;
		public var Messages : Array  = new Array();
	
		public var name : String = "noName";
		private var path:Array;
		private var currentNode : int = 0;
		private var text : FlxText;
		protected var dialogManager : DialogManager;
		protected var placeInArray : int = 0;
		[Embed(source="../jb/Assets/Minecraftia.ttf", fontFamily="NES", embedAsCFF="false")] 	public	var	FontNES:String;
		
		public function NPC(path:Array,level : FlxState, npcTexture : Class,dialogManager : DialogManager,movable : Boolean,placeInArray : int) 
		{
			this.placeInArray = placeInArray;
			this.dialogManager = dialogManager;
			this.path = path;
			super(path[0].x, path[0].y, npcTexture);
			this.drag = new FlxPoint(1000, 1000);
			this.immovable = movable;
			text = new FlxText(0, 0, 640, name + "  " + conversationController);
			text.setFormat("NES", 12, 0xffffffff, "left");
			text.color = 0xff000000;
			level.add(text);
		}
		public function GetDialog() : Array
		{
			return new Array("Hello");
		}
		override public function update():void 
		{
			super.update();
			
			if (!dialogManager.displayText)
			{
				text.x = x;
				text.y = y - 32;
				text.text = name;
				if (path.length > 1)
				{
					if (this.x > path[currentNode].x)
					{
						this.velocity.x = -100;
					}
					if (this.x < path[currentNode].x)
					{
						this.velocity.x = 100;
					}
					
					if (this.y > path[currentNode].y)
					{
						this.velocity.y = -100;
					}
					if (this.y < path[currentNode].y)
					{
						this.velocity.y = 100;
					}
					if (FlxU.getDistance(new FlxPoint(x,y), new FlxPoint(path[currentNode].x,path[currentNode].y)) < 10)
					{
						currentNode++;
						if (currentNode >= path.length)
						{
							currentNode = 0;
						}
					}
				}
				
			}
			else
			{
				this.velocity = new FlxPoint(0, 0);
			}
		}
	}

}