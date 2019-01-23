void setup(){
  size(800,800);
  background(255,255,255);
  fill(#D6D6B3);
  noStroke();
  ellipse(400,400,500,700);
  stroke(255);

  strokeWeight(10);
  line(400,300, 400, 600);
  
  rect(200,200, 100,50);
  rect(500,200, 100,50);
  
  stroke(0);
  fill(255,0,0);
  rectMode(CENTER);

  translate(500,500);
  rotate(PI/2);
  beginShape();
  vertex(30, 20);
  bezierVertex(180, 50, 180, 175, 130, 175);
  bezierVertex(250, 280, 160, 125, 130, 120);
  endShape();

}
