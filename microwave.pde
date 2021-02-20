// Program to demonstrate microwave interface using processing.
// Name: Hardik Poudel
// Class: CS 4331-006 Spring 2021 Special Topics in Computer Science: Human Computer Interaction.




int st =0, ct =0, turn = 0, timer = 0, num = -1, j = 0;
boolean doorOpen = false, powerOn = false, running = false, start = false;

color lightOn = color(198,142,28);
color lightOff= color(124,114,95);

PImage user_interface, openbutton, closebutton;

String message = "";
String choice = "";

void setup(){
  size(1200, 900);
  smooth();
  user_interface = loadImage("interface.png");
  openbutton = loadImage("open.png");
  closebutton = loadImage("Close.png");
}

void draw(){
  background(255);
  st = second();
  
  //////////////////////////////////////////////////////////////////INTERFACE////////////////////////////////////////
  fill(127);
  rect(50,60,1100,870); //outerlay
  if(running == false){
    fill(lightOff);
  }
   else{
     fill(lightOn);
   }
  rect(80,80,1045,500);  //food box;
  
  strokeWeight(30);
  stroke(#4D3C34);
  line(80,80,1120,80); //hinge
  line(80,80,80-turn,580-turn); // left
  line(1120,80,1120+turn,580-turn); // right
  line(80-turn,580-turn,1120+turn,580-turn); //down
  stroke(0);
  strokeWeight(10);

  image(user_interface, 100,600);
  user_interface.resize(1000,300);
  
  fill(72,185,36);
  textSize(26);
  text(message, 120,670);
  /////////////////////////////////////////////////////////////////////////////////////////////////////
  
  
/////////////////////////////////////DOOR SETUP///////////////////////////////////////////////
  if(doorOpen == false){
    image(openbutton, 945,765);
    openbutton.resize(120,120);
  }
  else{
    image(closebutton, 945,765);
    closebutton.resize(120,120);
  }
  
///////////////////////////////MOVE DOOR////////////////////////////////////
  if(doorOpen == true && turn < 300){
    turn ++;
    
  }else if(doorOpen == false && turn > 0){
    turn --;
  }
 
 if(turn > 0){
   running = true;
 }else if(turn == 0 && start == false){
   running = false;
 }
  
 
  
  ///////////////////////////////////////////////TIMER SETUP///////////////////////////////////////////////////////
  
  if(powerOn == true){
    
    if(start == true && timer > 0){
         timer = startTimer(timer);
       }
       else{
        
         if(choice.equals("time") && timer > 0){
           message = String.valueOf(timer);
         }else{
            message = choice;
         }
       }
     
    
    
  }else{
    message = "OFF";
    choice = "";
    timer = 0;
  }
  


    
  if(choice.equals("clock")){
    message = String.valueOf(hour()) + ":" + String.valueOf(minute()) + ":" + String.valueOf(second());
  }
  
  if(choice.equals("stop")){
    reset();
    }
  
  if(choice.equals("30s")){
    start = true;
   timer = startTimer(timer);
  }
  

  //////////////////////////////////////////////////////////////////////////////////////////////////

}


void mousePressed(){
  
  println(mouseX, mouseY);
  if(mouseX >= 140 && mouseX <270 && mouseY >= 730 && mouseY < 875){
    choice = "on";
    powerOn ^= true;
  }
  
  if(mouseX >=400 && mouseX <435 && mouseY >=635 && mouseY < 685){
    choice = "popcorn";
    timer = 120;
  }
  if(mouseX >=470 && mouseX <540 && mouseY >=635 && mouseY < 710){
    choice = "pizza";
    timer = 240;
  }
  if(mouseX >=375 && mouseX <440 && mouseY >= 755 && mouseY <790){
    choice = "potato";
    timer = 180;
  }
  if(mouseX >= 475 && mouseX <530 && mouseY >= 715 && mouseY <795){
    choice = "beverage";
    timer = 90;
  }
  
  if(mouseX >=375 && mouseX <430 && mouseY >= 800 && mouseY <875){
    choice = "defrost";
    timer = 300;
  }
  
  if(mouseX >= 475 && mouseX <530 && mouseY >= 804 && mouseY < 870){
    choice = "clock";
  }
  
  if(mouseX >= 675 && mouseX <720 && mouseY >=650 && mouseY <690){
    choice = "time";
    timer = timer*10+1;
  }
  if(mouseX >= 740 && mouseX <780 && mouseY >=645 && mouseY <690){
    choice = "time";
    timer = timer*10+2;
  }
  if(mouseX >= 800 && mouseX <845 && mouseY >=645 && mouseY <690){
    choice = "time";
    timer = timer*10+3;
  }
  if(mouseX >= 680 && mouseX <722 && mouseY >=710 && mouseY <750){
    choice = "time";
    timer = timer*10+4;
  }
  if(mouseX >= 740 && mouseX <785 && mouseY >=710 && mouseY <750){
    choice = "time";
    timer = timer*10+5;
  }
  if(mouseX >= 805 && mouseX <850 && mouseY >=710 && mouseY <750){
    choice = "time";
    timer = timer*10+6;
  }
  if(mouseX >= 680 && mouseX <722 && mouseY >=770 && mouseY <810){
    choice = "time";
    timer = timer*10+7;
  }
   if(mouseX >= 740 && mouseX <785 && mouseY >=774 && mouseY <810){
    choice = "time";
    timer = timer*10+8;
  }
  if(mouseX >= 805 && mouseX <845 && mouseY >=765 && mouseY <810){
    choice = "time";
    timer = timer*10+9;
  }
   if(mouseX >= 740 && mouseX <785 && mouseY >=825 && mouseY <865){
   choice = "time";
    timer = timer*10+0;
  }
   if(mouseX >= 930 && mouseX <985 && mouseY >=640 && mouseY <695){
    start = true;
  }
   if(mouseX >= 1015 && mouseX <1074 && mouseY >=640 && mouseY <690){
    choice = "stop";
    
  }
   if(mouseX >= 970 && mouseX <1025 && mouseY >=708 && mouseY <760){
    choice = "30s";
    timer = 30;
  }
   if(mouseX >= 955 && mouseX <1055 && mouseY >=775 && mouseY <885){
    choice = "door";
    doorOpen ^= true;
  }
   
}

int startTimer(int n){
  if(st > j){
    message = choice + '\n' + String.valueOf(timer) + "s rem";  
    n -= 1;
    running = true;
  }
  if(n == 0){
    choice = "READY";
    start = false;
    running = false;
  }
  j = st;
  return n;
}

void reset(){
 choice = "";
 timer = 0;
 running = false;
 start = false;
}
