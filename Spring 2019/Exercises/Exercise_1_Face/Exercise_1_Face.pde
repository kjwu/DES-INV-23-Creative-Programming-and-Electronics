/*
Basic Drawing
Kuan-Ju Wu 2019
While Processing includes lots of fancy ways to draw
shapes, modify images, and make cool artworks, the basics
are very simple: color, outline, and shape.
*/

void setup(){
  // we'll almost always use the size() command first
  // it sets the size of our window in pixels
  // try changing and see what happens!
  size(800,800);
  
  // colors are (by default) set to red, green, blue (RGB)
  // with these values (0–255) we can create any color
  // the background() command fills the entire screen with
  // a color – try changing the RGB values below
  background(255,255,255);
  
  // mixing in RGB can take some getting used to – try
  // Tools > Color Selector... for an interactive tool
  // we can set colors for shapes using fill (inside color)
  fill(#D6D6B3);
  
  // and we can turn off stroke and fill
  noStroke();
  
  // ellipses (including cirlces) also take four arguments,
  // but are drawn from the center X and Y
  ellipse(400,400,500,700);
  
  // stroke (outline color)
  stroke(255);

  // the thickness of stroke can be set (default = 1px)
  strokeWeight(10);
  // args = start X1,Y1 and end X2,Y2
  line(400,300, 400, 600);
  
  // rectangles are drawn with four arguments: start X and Y
  // position, then width and height (in pixels)

  rect(200,200, 100,50);
  rect(500,200, 100,50);
  
  stroke(0);
  fill(255,0,0);
  rectMode(CENTER);

  // We can move and rotate the canvas to draw in different position/orientation
  translate(500,500);
  rotate(PI/2); //rotate function take the degree argument in radius

  // and more complex shapes
  beginShape();
  vertex(30, 20); // a vertex is a point
  bezierVertex(180, 50, 180, 175, 130, 175); // string them together to draw complex shapes
  bezierVertex(250, 280, 160, 125, 130, 120);
  endShape();
  
  // for more info on a command, right-click it in the code and
  // click "Find in Reference..." to look it up


}
