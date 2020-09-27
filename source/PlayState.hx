package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.util.FlxColor;
import openfl.filters.ShaderFilter;

class PlayState extends FlxState
{
	var isFilterEnabled:Bool;

	override public function create()
	{
		super.create();
		isFilterEnabled = true;
		setFilter();

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

	function setFilter()
	{
		if (isFilterEnabled)
		{
			FlxG.camera.setFilters([new ShaderFilter(new PixelScaleShader())]);
		}
		else
		{
			FlxG.camera.setFilters([]);
		}
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		if (FlxG.keys.justPressed.F)
		{
			isFilterEnabled = !isFilterEnabled;
			setFilter();
		}
	}
}
