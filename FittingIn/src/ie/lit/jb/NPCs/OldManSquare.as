package ie.lit.jb.NPCs 
{
	import ie.lit.jb.NPC;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import ie.lit.jb.GameMain;
	import ie.lit.jb.DialogManager;
	/**
	 * ...
	 * @author Joseph Bentley
	 */
	public class OldManSquare extends NPC 
	{
		
		
		public function OldManSquare(path:Array,level : GameMain, npcTexture : Class,dialogManager : DialogManager,movable : Boolean,placeInArray : int) 
		{
			
			super(path, level, npcTexture,dialogManager,movable,placeInArray);
			Messages.push("Hmm? what!? who are you...? WHAT are you?....");
			Messages.push("You some kinda new fangled hexamajigger? You a line with an identity problem?...well? answer me!");
			Messages.push("...");
			Messages.push("Silent type aye?...Nevermind...");
			Messages.push("Now WHAT are you? Can't rightly say I've seen one'a you 'round these parts before... ");
			Messages.push("OHH!! you must be one of those new fangled circles the kids are on about.Rumour is they can be found up the mountains.Your gonna have to pass through the Sqauare and Triangle kingdoms though,can't rightly say anyone there would'a seen any a' your type round these parts neither, but it wouldnt harm to ask...");
			Messages.push("The Square kingdom is first, their just up East a' here. Now git you kiddo, and let me sleep....zzzz [snore]");
			
			
			
			name = "Old Man Square";
			conversationController = NpcConvoFixer.values[placeInArray];
			
		}
		override public function GetDialog():Array 
		{
			
			if (conversationController == 1)
			{
				conversationController++;
				NpcConvoFixer.values[placeInArray] = conversationController;
				return Messages;
			}
			else
			{
				return new Array("...zzzzz......[snore]");
			}
		}
		override public function update():void 
		{
			super.update();
			
			
		}
	}

}