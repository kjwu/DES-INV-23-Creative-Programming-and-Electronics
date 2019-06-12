/*
While Processing includes lots of fancy ways to draw
shapes, modify images, and make cool artworks, the basics
are very simple: color, outline, and shape.
*/

void setup(){
  // we'll almost always use the size() command first
  // it sets the size of our window in pixels
  // try changing and see what happens!

  size(400,400);
  
  // colors are (by default) set to red, green, blue (RGB)
  // with these values (0–255) we can create any color
  // the background() command fills the entire screen with
  // a color – try changing the RGB values below

  background(0); // single values = grayscale!
  
  // mixing in RGB can take some getting used to – try
  // Tools > Color Selector... for an interactive tool
  
  // we can set colors for shapes using fill (inside color) and
  // stroke (outline color)

  fill(#3DA748);  
  // rectangles are drawn with four arguments: start X and Y
  // position, then width and height (in pixels)

  rect(0,0,random(1,2)*width/4,height); //rect(x,y,width,height)
  
  // ellipses (including cirlces) also take four arguments,
  // but are drawn from the center X and Y
  ellipse(50,50, 100,100);
      
  fill(#48AECB);
  // and we can turn off stroke and fill

  noStroke();
  rect(random(1,2)*width/3,0,width/2,height); //rect(x,y,width,height)
  
    
  fill(#EDEDED);

  // other shape types include triangles...

  triangle(random(width), height, random(width), height, random(width), 0);

  // the thickness of stroke can be set (default = 1px)

  strokeWeight(2);
  stroke(#FFC903);
  float lineHeight = random(height);
  line(0, lineHeight, width, lineHeight); // args = start X/Y and end X/Y
  
  noFill();
  strokeWeight(20);
  stroke(255);
  rect(0,0,width,height);


  // and more complex shapes
  fill(0,150,150, 150);
  beginShape();
  vertex(140,140);    // a vertex is a point
  vertex(160,140);    // string them together to draw complex shapes
  vertex(170,120);
  vertex(150,120);
  endShape();
  
  // for more info on a command, right-click it in the code and
  // click "Find in Reference..." to look it up


  noStroke();
  fill(255);
  beginShape();
  endShape(CLOSE);
  save("test.png");
    
}

void draw(){
}
