
/*
SIERPINSKI CARPET
Jeff Thompson | 2017 | jeffreythompson.org

The Sierpinski carpet, described by mathematician
Wacław Sierpiński in 1916, is a recusive pattern
that makes smaller and smaller copies of itself.

In this classic example, we draw a square, then draw
eight smaller squares around it. The process repeats,
getting smaller each time but more tightly packed.

More about the Sierpinski carpet here:
https://en.wikipedia.org/wiki/Sierpinski_carpet

And, if in 3D, this shape becomes the Menger sponge:
https://en.wikipedia.org/wiki/Menger_sponge

CHALLENGES:
1. Can you draw other shapes instead of just
   squares? What shapes would be interesting with
   the Sierpinski carpet's self-replicating copies?
2. Try playing with the formula for the new size and 
   see what different images you can create. (Keep
   in mind that the result is a float, so try non-whole
   numbers too!)

*/


int maxRecursions = 4;    // how many steps to run?


void setup() {
  size(800,800);
  background(255);
 
  rectMode(CENTER);
  noStroke();
  fill(255,150,0, 200);
  carpet(0, width/2, height/2, 400);
}


// to draw the carpet, we pass in the current recursion
// count, an x/y position, and the size of the square
void carpet(int n, float x, float y, float s) {
  
  // draw a square in the current location 
  rect(x, y, s, s);
  
  // run until we've reached the specified
  // number of steps
  if (n < maxRecursions) {
    
    // update the step count
    n += 1;
    
    // calculate a new size for the squares
    // try changing this and see what happens!
    float newSize = s/3;
    
    // draw in 8 directions
    // for each, we move over by the old size
    
    carpet(n, x-s, y-s, newSize);      // upper L
    carpet(n, x,   y-s, newSize);      // up
    carpet(n, x+s, y-s, newSize);      // upper R
    carpet(n, x+s, y,   newSize);      // L
    carpet(n, x+s, y+s, newSize);      // lower R
    carpet(n, x,   y+s, newSize);      // down
    carpet(n, x-s, y+s, newSize);      // lower L
    carpet(n, x-s, y,   newSize);      // R
  }
}