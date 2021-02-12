void setup(){
 size(1000,500);
 smooth();
 
}

void draw(){
  rect(0,0,1000,500);  //border
  rect(20,20,600,450);  //screen
  rect(665,20, 300,400);  //ui
  //number buttons
  rect(690, 40, 250,50);
  rect(690, 100, 50, 50);
  rect(750, 100, 50, 50);
  rect(810, 100, 50, 50);
  rect(690, 160, 50, 50);
  rect(750, 160, 50, 50);
  rect(810, 160, 50, 50);
  rect(690, 220, 50, 50);
  rect(750, 220, 50, 50);
  rect(810, 220, 50, 50);
  rect(750, 280, 50, 50);
  
  //shortcuts
  circle(910, 125, 50);
  circle(910, 185, 50);
  circle(910, 245, 50);
  circle(910, 305, 50);
  
}
