package;

import flixel.FlxSprite;
import flixel.FlxState;

class PlayState extends FlxState
{
	override public function create()
	{
		super.create();
		add(new FlxSprite(0, 0, "assets/images/pixel-grid.png"));
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
