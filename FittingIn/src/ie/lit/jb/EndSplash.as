package ie.lit.jb 
{
	import ie.lit.jb.Menu;
    import org.flixel.*;
 
    public class EndSplash extends FlxState
    {
        private var backButton:FlxButton;
		private var control : int = 1;
		private var tweening : Boolean = false;
		private var images : FlxGroup = new FlxGroup(3);
		private var strings : FlxGroup = new FlxGroup(3);
		
		[Embed(source = "../jb/Assets/image4.png")]public var image1Texture:Class;
		[Embed(source = "../jb/Assets/image5.png")]public var image2Texture:Class;
		[Embed(source = "../jb/Assets/image6.png")]public var image3Texture:Class;
		[Embed(source="../jb/Assets/Minecraftia.ttf", fontFamily="NES", embedAsCFF="false")] 	public	var	FontNES:String;
		
		
        public function EndSplash()
        {
			FlxG.bgColor = 0xff1a1a1a;
			
			images.add(new FlxSprite(30, 11, image1Texture));
			images.add(new FlxSprite(340, 120, image2Texture));
			images.add(new FlxSprite(30, 245, image3Texture));
			for (var i : int = 0; i < 3; i ++)
			{
				var yes : FlxSprite = images.members[i];
				yes.scale = new FlxPoint(0.9, 0.9)
			}
			for ( i  = 1; i < 3; i ++)
			{
				var temp : FlxSprite = images.members[i];
				
				temp.alpha = 0;
			}
			strings.add(new FlxText(50, 230, 300, "He had travelled long, he had travelled hard. And here he wa..", true));
			strings.add(new FlxText(380, 340, 250, "Honey?... what are you doing in here alone? Its time for dinner,come on ", true));
			strings.add(new FlxText(30, 445, 400, "...Just playing with my shapes dad...I'll be right there. \n The End", true));
			
			for ( i = 0; i < 3; i ++)
			{
				var No : FlxText = strings.members[i];
				No.setFormat("NES", 10, 0xffffffff, "left");
			}
			
			for ( i = 1; i < 3; i ++)
			{
				var temptext : FlxText = strings.members[i];
				temptext.alpha = 0;
			}
        }
 
        override public function create():void
        {
            FlxG.mouse.show();
            backButton = new FlxButton(550, 440, "next", click);
			add(images);
			this.add(strings);
			add(backButton);
			if (FlxG.music != null)
			{
				FlxG.music.stop();
			}
        }
		override public function update():void 
		{
			super.update();
			
		}
      
		private function click():void
        {
			if(control < 3 )
			{
				images.members[control].alpha = 1;
				strings.members[control].alpha = 1;
			}
			control ++;
			if (control >= 4)
			{
				FlxG.mouse.hide();
				FlxG.switchState(new CreditsScreen);
			}
        }
    }
}