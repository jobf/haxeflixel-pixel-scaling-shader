package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.util.FlxColor;
import openfl.filters.ShaderFilter;

class PlayState extends FlxState
{
	var isFilterEnabled:Bool;
	var shader:PixelScaleShader;
	var scale = 4;
	var minScale = 2;
	var maxScale = 128;

	override public function create()
	{
		super.create();
		shader = new PixelScaleShader();
		isFilterEnabled = true;
		setFilter();

		add(new FlxSprite(0, 0, "assets/images/pixel-grid.png"));

		var transparentSprite = new FlxSprite(8, 8, "assets/images/yellow+.png");
		transparentSprite.angularVelocity = 5;
		add(transparentSprite);

		var transparentSpriteDiagonal = new FlxSprite(8, 32, "assets/images/yellowX.png");
		transparentSpriteDiagonal.angularVelocity = 5;
		add(transparentSpriteDiagonal);

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
			FlxG.camera.setFilters([new ShaderFilter(shader)]);
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
		if (FlxG.keys.justPressed.UP)
		{
			if (scale < maxScale)
			{
				scale = scale * 2;
			}
			shader.setScale(scale);
		}
		if (FlxG.keys.justPressed.DOWN)
		{
			if (scale > minScale)
			{
				scale = Math.round(scale / 2.0);
			}
			shader.setScale(scale);
		}
	}
}
