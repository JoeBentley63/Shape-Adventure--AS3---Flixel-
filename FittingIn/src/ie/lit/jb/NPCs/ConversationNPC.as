package ie.lit.jb.NPCs 
{
	import ie.lit.jb.NPC;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	
	import ie.lit.jb.DialogManager;
	import org.flixel.FlxState;
	/**
	 * ...
	 * @author Joseph Bentley
	 */
	public class ConversationNPC extends NPC 
	{
		public function ConversationNPC(path:Array,level : FlxState, npcTexture : Class,name : String,messages:Array,colour :uint,dialogManager : DialogManager,movable : Boolean,placeInArray : int) 
		{
			
			color=colour;
			this.alpha = 1;
			super(path,level,npcTexture,dialogManager,movable,placeInArray);
			Messages = messages;
			this.name = name;
		}
		override public function GetDialog():Array 
		{
			return Messages;
		}
	}

}