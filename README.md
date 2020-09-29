# haxeflixel-pixel-scaling-shader
multiplying pixels with gl

This repo contains shader code to scale pixels up with custom shader code in haxeflixel.

It uses algorithms for filtering the texture as described in this blog post - https://csantosbh.wordpress.com/2014/01/25/manual-texture-filtering-for-pixelated-games-in-webgl/

In it's current state the shader only really useful for adding as a filter to a camera.

If it is used on a game that uses mouse positions they will need to be scaled in line with the shader scale factor.

## Demo

There is an HTML5 build of this repo here - https://jobf.github.io/haxeflixel-pixel-scaling-shader/

 - press f key to toggle between unscaled and scaled.
 - press up to double the scale factor.
 - press down to halve the scale factor.
