
/*
PERLIN NOISE
Jeff Thompson | 2017 | jeffreythompson.org

In 1983, frustrated by the "machine-like" look of randomness in 
computer graphics (like Brownian motion), Ken Perlin invented 
the now-famous Perlin noise algorithm. It has since been used in
countless feature films and videogames to create realistic smoke,
clouds, and other textures (and the terrain in the game Minecraft).
In 1997, Perlin won an Academy Award for the algorithm.

We can use Perlin noise for more realistic textures, like in this
example, but also motion – see the PerlinMotion example for more
on that.

You can read more about the math behind Perlin noise here:
https://en.wikipedia.org/wiki/Perlin_noise
http://flafla2.github.io/2014/08/09/perlinnoise.html

CHALLENGES:
1. A 3rd parameter (what could be thought of as the Z or "time"
   dimension) can be added so the noise can be fluidly animated.
   Can you move our noise function to the draw() loop and make
   it change over time? (Hint: you'll need a variable for Z and
   some way to change it every frame. See the noise() documentation
   for more details.)

*/


float detail =    0.6;      // amount of detail in the noise (0-1)
float increment = 0.002;    // how quickly to move through noise (0-1) 


void setup() {
  size(800,800);
  
  // settings for noise() – these change the amount of
  // detail or blurriness that results
  // the details are kind of mathy, but you can read more
  // in the noiseDetail() doc page
  noiseDetail(8, detail);
  
  // set each pixel onscreen from noise()
  loadPixels();
  for (int x=0; x<width; x+=1) {
    for (int y=0; y<height; y+=1) {
      
      // noise() returns a value 0-1, so multiply
      // by 255 to get a number we can use for color
      float gray = noise(x*increment, y*increment) * 255;
      
      // set the current pixel to the value from noise()
      pixels[y*width + x] = color(gray);
    }
  }
  updatePixels();
}