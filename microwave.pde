int x = 0, mX = 0, mY = 0, st = 0,ct = 0, msg = 0;
String message = "Hello";
boolean doorStatus = false;

color keypad = color(215,234,240);
color outerLayer = color(0);
color numbers = color(0);
color lighton = color(211,216,66);
color lightoff = color(170,170,161);
color utilities = color(112,125,134);
color door = color(166,182,193);
color numberpad = color(87);

int choice = -1;
PImage img;
PImage power;

void setup(){
  size(1200,900);
  st = millis()/1000;
  smooth();
  img = loadImage("chicken.jpg");
  power = loadImage("power.png");
  frameRate(300);
}

void draw(){
  background(255);
  fill(outerLayer);
  rect(50,50,1080,830); //outer layer
  
  if(x == 0){
    fill(lightoff);
  }else{
     
    fill(lighton);
    
  }
  
  
 
  rect(90,80, 1000,500); // box
  
  
  fill(numberpad);
  rect(500,600,185,280);
  
  //keypad
  fill(keypad);
  rect(520,680,40,40);
  rect(570,680,40,40);
  rect(620,680,40,40);
  rect(520,730,40,40);
  rect(570,730,40,40);
  rect(620,730,40,40);
  rect(520,780,40,40);
  rect(570,780,40,40);
  rect(620,780,40,40);
  rect(570,830,40,40);
  
  
  rect(900,700,160,100);  //open/close
  
  fill(utilities);
  rect(100,620,200,250);
  
  //utilities
  fill(keypad);
  ellipse(150,660,80,50);
  ellipse(150,720,80,50);
  ellipse(150,780,80,50);
  ellipse(150,840,80,50);
  ellipse(250,660,80,50);
  ellipse(250,720,80,50);
  ellipse(250,780,80,50);
  ellipse(250,840,80,50);
  
  
  circle(780,670,70);  //Start
  circle(780,750,70);  //Stop
  circle(780,830,70);  //30s
  
  fill(0);
  rect(500,590,180,80);  //display
  
  if(doorStatus == true){
    image(img, 230,180, 600,330);
  
  }
  
  
  
  
  strokeWeight(45);
  stroke(#A6B6C1);
  line(90,80,1085,80); //hinge
  line(90,80, 90-x,580-x); //left
  line(1085,80,1085+x,580-x); //right
  line(90-x,580-x,1085+x,580-x);  //down
  strokeWeight(1);
  
  fill(90,183,30);
  textSize(32);
  text(message, 510,640);
  fill(255);
  
  
  
  fill(numbers);
  text("1", 525,715);
  text("2", 575, 715);
  text("3", 625,715);
  text("4", 525,765);
  text("5", 575, 765);
  text("6", 625,765);
  text("7", 525,815);
  text("8", 575, 815);
  text("9", 625,815);
  text("0", 575, 865);
  
  textSize(20);
  text("Start", 757,675);
  text("Stop", 757, 755);
  text("30s", 757, 835);
  textSize(16);
  text("Popcorn", 112,665);
  text("Potato", 215,665);
  text("Defrost", 112, 725);
  text("Pizza", 220,725);
  text("Beverage", 112,783);
  text("Fn1", 215, 783);
  text("Fn2", 130, 840);
  text("Fn3", 220,845);
  
  image(power, 350,700,100,100);
  
  message = String.valueOf(hour()) + ":" + String.valueOf(minute()) + ":" + String.valueOf(second());
  
  textSize(32);
 if(doorStatus == false){
   text("Open", 940, 755);
 }else{
   text("Close", 940, 755);
 }
  
  if(doorStatus == true && x < 300){
    x++;
  }else if(doorStatus == false && x > 0){
    x--;
  }
  
  if(choice >= 0 && choice <9 && msg >0){
    
   message = String.valueOf(msg);
   
  }
  if(choice == 11){
    startTimer(msg*60);
    
  }
  if(choice == 12){
    st = millis()/1000;
  }
  if(choice == 13){
    startTimer(30);
  }
  
  
  
 
  
}

void startTimer(int n){
  ct = millis()/1000 - st;
  if(n-ct > 0){
    message = String.valueOf(n-ct) + "s rem";
  }else{
    message = "Ready";
    msg = 0;
  }
  
}

void mousePressed(){
 mX = mouseX;
 mY = mouseY;
 
 if(mX >= 900 && mX < 1060 && mY >=700 && mY < 800){
   choice = 10;  //open/close
   doorStatus ^= true;
 }
 if(mX >= 520 && mX < 560 && mY >= 680 && mY < 720){
   choice = 1;
 }
  if(mX >= 570 && mX < 610 && mY >= 680 && mY < 720){
   choice = 2;
 }
 if(mX >= 620 && mX < 660 && mY >= 680 && mY < 720){
   choice = 3;
 }
 if(mX >= 520 && mX < 560 && mY >= 730 && mY < 770){
   choice = 4;
 }
  if(mX >= 570 && mX < 610 && mY >= 730 && mY < 770){
   choice = 5;
 }
 if(mX >= 620 && mX < 660 && mY >= 730 && mY < 770){
   choice = 6;
 }
  if(mX >= 520 && mX < 560 && mY >= 780 && mY < 820){
   choice = 7;
 }
  if(mX >= 570 && mX < 610 && mY >= 780 && mY < 820){
   choice = 8;
 }
 if(mX >= 620 && mX < 660 && mY >= 780 && mY < 820){
   choice = 9;
 }
 if(mX >= 570 && mX < 610 && mY >= 830 && mY < 870){
   choice = 0;
 }
 
 if(mX >= 745 && mX < 815 && mY >= 635 && mY < 705){
   choice = 11; //Start
 }
 if(mX >= 745 && mX < 815 && mY >= 715 && mY < 785){
   choice = 12; //Stop
   msg = 0;
   
 }
 if(mX >= 745 && mX < 815 && mY >= 795 && mY < 865){
   choice = 13; //30s
 }
 if(choice >=0 && choice <10){
   msg = msg*10 +choice;
 }
 
 
}
