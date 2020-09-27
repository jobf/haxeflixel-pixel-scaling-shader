import flixel.system.FlxAssets.FlxShader;

class PixelScaleShader extends FlxShader
{
	@:glFragmentSource("
	#pragma header

	const float scale = 4.0;
	float incrementX = 1.0 / openfl_TextureSize.x;
	float incrementY = 1.0 / openfl_TextureSize.y;
	
	float roundDown(float toRound, float multiple)
	{
		return toRound - mod(toRound, multiple);
    }
    
	void main()
	{
		float x = roundDown(openfl_TextureCoordv.x / scale, incrementX);
		float y = roundDown(openfl_TextureCoordv.y / scale, incrementY);
        
        gl_FragColor = texture2D(bitmap, vec2(x, y));
	}
    ")
	public function new()
	{
		super();
	}
}
