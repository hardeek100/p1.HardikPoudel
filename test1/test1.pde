

int mX =0;
int mY = 0;
color outerlayer = color(0,0,0);
color door = color(255,100,0);
color window = color(100,200,140);
color handle = color(255,50,0);
color menu = color(92, 152,175);
color display = color(0,0,0);
color doorswitch = color(100,200,140);
color numberpad = color(97,120,165);
color startbutton = color(97,120,165);
color thirty = color(97,120,165);
color light;

int x =0;
boolean openDoor = false;


int choice = -1;

int msg = 0;
String message = "";
int st = 0, ct =0;


void setup(){
  size(1080,1000);
  st = millis()/1000;
}


void draw(){
  
  background(255);
  fill(190);
  rect(50,200, 940,600);    //outer layer
  
  if(openDoor == true){
    light = color(201, 132, 28);
  }
  else{
    light =  color(93,75,49);
  }
  
  fill(light);
  rect(120,260,565,470);    //in box
  
  strokeWeight(40);
  line(100,240, 100,750); //hinge
  line(100,240, 700-x, 240-x); //up
  line(700-x,240-x, 700-x,750+x);  //side
  line(100, 750, 700-x,750+x);  //down
  
  strokeWeight(1);
  
  
  fill(menu);
  rect(720, 250, 230,500);  //menu
  
  fill(display);
  rect(730, 270,210,80);  //display
  fill(63,144,32);
  textSize(32);
  text(message, 755, 320);
  
  noFill();
  rect(730, 360, 210, 120, 7);  //utilities border
  
   ellipse(767, 390, 65,45);
   ellipse(767, 447, 65,45);
   ellipse(836, 390, 65,45);
   ellipse(836, 447, 65,45);
   ellipse(905, 390, 65,45);
   ellipse(905, 447, 65,45);

  fill(doorswitch);
  rect(730, 690, 210,55);  //door switch
  
  fill(0);
  textSize(32);
  if(openDoor == false){
    text("Open", 780,728);
  }else{
   text("Close", 780, 728); 
  }
  //keypad
  fill(numberpad);
  rect(750, 490, 40,40);
  rect(800, 490, 40,40);
  rect(850, 490, 40,40);
  rect(750, 540, 40,40);
  rect(800, 540, 40,40);
  rect(850, 540, 40,40);
  rect(750, 590, 40,40);
  rect(800, 590, 40,40);
  rect(850, 590, 40,40);
  rect(800, 640, 40,40);
  
  //start button
  fill(thirty);
  circle(755, 660, 50);
  
  fill(startbutton);
  circle(880, 660, 50);
  
  textSize(32);
  fill(255);
  text("1", 760,520);
  text("2", 810, 520);
  text("3", 860, 520);
  text("4", 760,570);
  text("5", 810, 570);
  text("6", 860, 570);
  text("7", 760,620);
  text("8", 810, 620);
  text("9", 860, 620);
  text("0", 810, 670);
  
  textSize(16);
  text("30s", 743, 665);
  textSize(12);
  text("Start/\nStop", 865,655);
  
  
  if(openDoor == true && x <= 150){
    x++;
  }
  else if(openDoor == false && x!=0){
    x--;
    
  }
  
  if(choice >-1 && choice <10){
     
     message =  String.valueOf(msg);
  }
  else if(choice == 30){
    setTimer(30);
    
  }

  else{
    message = String.valueOf(hour()) + ":" +String.valueOf(minute()) + ":" + String.valueOf(second());
    msg = 0;
    st = millis()/1000;
  }
  
  
}

void setTimer(int n){
   ct = millis()/1000-st;
   if(n-ct > 0){
    message = String.valueOf(n-ct); 
   }
   else{
     message = "Ready";
     
   }
}



void mouseClicked(){
  mX = mouseX;
  mY = mouseY;
  //print(mX, mY);
  if(mX >= 730 && mX <= 940 && mY >= 690 && mY <= 745){
    openDoor ^= true;
    choice = -1;
  }
  if(mX >= 750 && mX < 790 && mY >= 490 && mY < 530){
    choice = 1;
  }
  if(mX >= 800 && mX < 840 && mY >= 490 && mY < 530){
    choice = 2;
  }
  if(mX >= 850 && mX < 890 && mY >= 490 && mY < 530){
    choice = 3;
  }
  if(mX >= 750 && mX <= 790 && mY >= 540 && mY <580){
    choice = 4;
  }
  if(mX >= 800 && mX < 840 && mY >= 540 && mY < 580){
    choice = 5;
  }
  if(mX >= 850 && mX < 890 && mY >= 540 && mY < 580){
    choice = 6;
  }
  if(mX >= 750 && mX < 790 && mY >= 590 && mY < 640){
    choice = 7;
  }
  if(mX >= 800 && mX < 840 && mY >= 590 && mY < 640){
    choice = 8;
  }
  if(mX >= 850 && mX < 890 && mY >= 590 && mY < 640){
    choice = 9;
  }
  if(mX >= 800 && mX < 840 && mY >= 640 && mY < 680){
    choice = 0;
  }
  
  if(mX >= 730 && mX <= 780 && mY >= 635 && mY <= 685){
   choice = 30;   
  }
  if(mX >= 855 && mX <= 930 && mY >= 635 && mY <= 685){
   choice = 100; 
  
  }
  msg = msg*10+choice;
  print(choice);
}
