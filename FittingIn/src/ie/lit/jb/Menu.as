package ie.lit.jb 
{
	import ie.lit.jb.CreditsScreen;
    import org.flixel.*;
 
    public class Menu extends FlxState
    {
        private var startButton:FlxButton;
		private var creditsButton:FlxButton;
		private var backgroudImage:FlxSprite;
		[Embed(source = "../jb/Assets/MenuScreen.png")]public var background:Class;
        public function Menu()
        {
        }
 
        override public function create():void
        {
            FlxG.mouse.show();
            startButton = new FlxButton(280, 90, "Start Game", fade);
			creditsButton = new FlxButton(280, 130, "Credits", creditsScreen);
			backgroudImage = new FlxSprite(0, 0, background);
			add(backgroudImage);
            add(startButton);
			add(creditsButton);
        }
		
		private function fade() : void
		{
			FlxG.camera.fade(0x000000, 1, startGame, false);
		}
        private function startGame():void
        {
            FlxG.mouse.hide();
            FlxG.switchState(new OpeningSplash);
        }
		private function creditsScreen():void
        {
            FlxG.mouse.hide();
            FlxG.switchState(new CreditsScreen);
        }
    }
}