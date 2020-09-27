package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.util.FlxColor;
import openfl.filters.ShaderFilter;

class PlayState extends FlxState
{
	override public function create()
	{
		super.create();
		FlxG.camera.setFilters([new ShaderFilter(new PixelScaleShader())]);
		add(new FlxSprite(0, 0, "assets/images/pixel-grid.png"));

		var sqSize = 4;
		var colors = [FlxColor.RED, FlxColor.GREEN, FlxColor.BLUE, FlxColor.WHITE];
		for (y in 0...1)
		{
			for (x in 0...4)
			{
				var pixel = new FlxSprite(x * sqSize, y);
				pixel.makeGraphic(sqSize, sqSize, colors[x]);
				add(pixel);
			}
		}
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
