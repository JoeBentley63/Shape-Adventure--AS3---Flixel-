package ie.lit.jb 
{
	import ie.lit.jb.Menu;
    import org.flixel.*;
 
    public class CreditsScreen extends FlxState
    {
        private var backButton:FlxButton;
		private var text : FlxText;
		[Embed(source="../jb/Assets/Minecraftia.ttf", fontFamily="NES", embedAsCFF="false")] 	public	var	FontNES:String;
		
        public function CreditsScreen()
        {
        }
 
        override public function create():void
        {
            FlxG.mouse.show();
            backButton = new FlxButton(280, 290, "back", creditsScreen);
			text = new FlxText(50, 25, 540, "A game by Joseph Bentley (SeppyB63) \n Music by the talented Terracorrupt ", true);
			text.setFormat("NES", 10, 0xffffffff, "center");
			add(backButton);
			add(text);
        }
 
      
		private function creditsScreen():void
        {
            FlxG.mouse.hide();
            FlxG.switchState(new Menu);
        }
    }
}