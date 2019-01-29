
/*
BASIC RECURSION
Jeff Thompson | 2017 | jeffreythompson.org

Recursion, like iteration, is a fundamental idea in 
programming and creates a repeating structure. A
recursive function calls itself, running until a
condition is met and the function stops.

A recursive function requires:
+ An initial value(s)
+ An exit condition (called a "base case")

Lots more on the topic of recursion can be found here:
https://en.wikipedia.org/wiki/Recursion_(computer_science)
https://www.khanacademy.org/computing/computer-science/algorithms/
recursive-algorithms/a/properties-of-recursive-algorithms

CHALLENGES:
+ Try changing the code that updates x in the recursive
  function below – what happens if you multiply or divide
  x by a number, instead of add?

*/


void setup() {
  size(600,600);
  background(255);
  
  // here's some code that draws
  // vertical lines using iteration
  for (int x=0; x<width; x+=10) {
    line(x,0, x,height);
  }
  
  // ...and the same code using recursion
  recursiveLine(0);     // 0 is our starting point 
}


void recursiveLine(int x) {
  
  // changing our input value
  // (in this case incrementing by 10)
  x += 10;
  
  // exit condition to stop recursion
  // (this is necessary, or it will go on forever!)
  if (x > width) {    // continue until x is greater than width
    return;
  }
  
  // draw a line at the current position
  // and call the function again
  line(x, 0, x, height);
  recursiveLine(x);
}