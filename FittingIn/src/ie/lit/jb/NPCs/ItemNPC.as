package ie.lit.jb.NPCs 
{
	import ie.lit.jb.NPC;
	import ie.lit.jb.Player;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import ie.lit.jb.GameMain;
	import ie.lit.jb.DialogManager;
	/**
	 * ...
	 * @author Joseph Bentley
	 */
	public class ItemNPC extends NPC 
	{
		private var ItemNeeded : String;
		private var ItemGiven : String;
		private var secondMessage : Array;
		private var incorrectMessage : Array;
		public function ItemNPC(path:Array,level : GameMain, npcTexture : Class,name : String,messages:Array,secondMessages:Array,incorrectMessage : Array ,colour :uint,dialogManager : DialogManager,movable : Boolean,itemNeed : String,itemGiven : String,placeInArray : int) 
		{
			super(path, level, npcTexture, dialogManager, movable,placeInArray);
			this.secondMessage = secondMessages;
			this.incorrectMessage = incorrectMessage;
			Messages = messages;
			ItemNeeded = itemNeed;
			ItemGiven = itemGiven;
			this.dialogManager = dialogManager;
			this.name = name;
			color = colour;
			conversationController = NpcConvoFixer.values[placeInArray];
		}
		override public function GetDialog():Array 
		{
			if (conversationController == 1)
			{
				var contains : Boolean = false;
				for (var i :int = 0; i < DialogManager.inventory.length; i++)
				{
						if (DialogManager.inventory[i] == ItemNeeded)
						{
							contains = true;
							var start : Boolean = false;
							if (DialogManager.inventory[i] == "Nothing!!")
							{
								start = true;
							}
							DialogManager.inventory.splice(i, 1);
							if (start == true)
							{
								DialogManager.inventory.push("Apple Seeds!");
							}
							DialogManager.inventory.push(ItemGiven);
							conversationController++;
							NpcConvoFixer.values[placeInArray] = conversationController;
							Messages.push("[" + ItemGiven + " has been added to your inventory]");
						}
				}
				if (contains == false)
				{
					return incorrectMessage;
				}
				return Messages;
			}
			else
			{
				return secondMessage;
			}
			return Messages;
		}
	}

}