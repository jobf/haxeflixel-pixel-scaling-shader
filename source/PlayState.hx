package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import openfl.filters.ShaderFilter;

class PlayState extends FlxState
{
	override public function create()
	{
		super.create();
		FlxG.camera.setFilters([new ShaderFilter(new PixelScaleShader())]);
		add(new FlxSprite(0, 0, "assets/images/pixel-grid.png"));
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
