package ie.lit.jb 
{
	import ie.lit.jb.GameMain;
	import org.flixel.*;
	import org.flixel.system.FlxList;

	/**
	 * ...
	 * @author Joseph Bentley
	 */
	public class DialogManager 
	{
		public var displayText : Boolean;
		protected var health : Number = 100;
		protected var text : FlxText;
		protected var dialogBox : FlxSprite;
		protected var HUDBox : FlxSprite;
		protected var healthMeter : FlxSprite;
		protected var Messages : Array;
		private var talkBool : Boolean;
		protected var advanceTextBool : Boolean;
		protected var nextButton : FlxText;
		protected var scale : FlxPoint = new FlxPoint(1, 1);
		protected var shrink : Boolean = true;
		protected var levelRef : FlxState;
		public static var inventory : Array	= new Array("Nothing!!");
		
		[Embed(source="../jb/Assets/Minecraftia.ttf", fontFamily="NES", embedAsCFF="false")] 	public	var	FontNES:String;
		
		
		public function DialogManager(level:FlxState, dialogBoxTexture:Class, HUDBoxTexture:Class) 
		{
		
			healthMeter = new FlxSprite(-160,0);
			healthMeter.makeGraphic(320,64,0xffaa1111);
			healthMeter.scrollFactor = new FlxPoint(0, 0);
			HUDBox = new FlxSprite(0, 0, HUDBoxTexture);
			HUDBox.scrollFactor = new FlxPoint(0, 0);
			HUDBox.immovable = true;
			levelRef = level;
			advanceTextBool = false;
			Messages = new Array();
			dialogBox = new FlxSprite(0, 360, dialogBoxTexture);
			dialogBox.scrollFactor = new FlxPoint(0, 0);
			displayText = false;
			text = new FlxText(20, 380, 600, "");
			text.setFormat("NES", 12, 0xffffffff, "left");
			nextButton = new FlxText(550, 440, 110, "press X");
			nextButton.setFormat("NES", 12, 0xffffffff, "left");
			nextButton.color = 0xff000000;
			text.color = 0xff000000;
			text.scrollFactor = new FlxPoint(0, 0);
			nextButton.scrollFactor = new FlxPoint(0, 0);
			dialogBox.immovable = true;
			
			
		}
		public function AddHud() : void
		{
			
			levelRef.add(healthMeter);
			levelRef.add(HUDBox);
		}
		public function AddDialogBox() : void
		{
			levelRef.add(dialogBox);
			levelRef.add(text);
			levelRef.add(nextButton);
		}
		public function Has(item : String) : Boolean
		{
			
			for (var i :int = 0; i < inventory.length; i++)
			{
					if (inventory[i] == item)
					{
						return true;
					}
			}
			return false;
		}
		public function AddMessage(message : String) : void
		{
			Messages.push(message);
		}
		public function Update(): void
		{
			healthMeter.scale.x = health / 100;
			if (health < 0)
			{
				health = 0;
			}
			if (Messages[0] != null)
			{
				text.text = Messages[0];
			}			
			if (FlxG.keys.X && advanceTextBool == false && displayText)
			{
				//remove from messages...some how
				Messages.splice(0, 1);
				
				
				advanceTextBool = true;
			}
			else if (!FlxG.keys.X )
			{
				advanceTextBool = false;
			}
			if (Messages.length > 0)
			{
				displayText = true;
				if (scale.x > 1.5)
				{
					shrink = true;
				}
				if (scale.x < 1)
				{
					shrink = false;
				}
				if (shrink)
				{
					scale.x -= .01;
					scale.y -= .01;
				}
				else
				{
					scale.x += .01;
					scale.y += .01;
				}
				nextButton.scale = scale;
			}
			else
			{
				displayText = false;
			}
			if (displayText)
			{
				text.visible = true;
				dialogBox.visible = true;
				nextButton.visible = true;
			}
			else
			{
				text.visible = false;
				dialogBox.visible = false;
				nextButton.visible = false;
				if (FlxG.keys.I)
				{
					var inventoryString : String = "You are currently Carrying : "
					for (var i : int = 0; i < inventory.length; i ++)
					{
						inventoryString += "[" +inventory[i] + "] , "; 
					}
				
					Messages.push(inventoryString);
				}
			}
		}
		
	}

}