// Program to demonstrate microwave interface using processing.
// Name: Hardik Poudel
// Class: CS 4331-006 Spring 2021 Special Topics in Computer Science: Human Computer Interaction.
// Date: 2/28/2020

// global variables
int st =0, ct =0, turn = 0, timer = 0, num = -1, j = 0;
boolean doorOpen = false, powerOn = false, running = false, start = false;
String message = "";
String choice = "";

PImage user_interface,  openbutton, closebutton, food, pizza, potato, popcorn, empty;  // Image variables

void setup(){
  size(1690, 900);
  smooth();
  user_interface = loadImage("../medias/interface.png");
  openbutton = loadImage("../medias/open.png");
  closebutton = loadImage("../medias/Close.png");
  pizza = loadImage("../medias/pizza.png");
  potato = loadImage("../medias/potato.png");
  popcorn = loadImage("../medias/popcorn.png");
  empty = loadImage("../medias/food.png");
}


void draw(){
  background(255);
  st = second();
  
  //////////////////////////////////////////////////////////////////INTERFACE////////////////////////////////////////
  fill(127);
  rect(300,60,1100,870); //outerlay
   if(choice.equals("popcorn")){
     food = popcorn;
   }
   else if(choice.equals("pizza")){
     food = pizza;
   }
   else if(choice.equals("potato")){
     food = potato;
   }
   else{
     food = empty;
   }

  if(running == true ){
    
  image(food, 300,80);
  food.resize(1100,500);
  
  } else{
      image(food, 300,80);
      food.resize(1100,500);
      filter(GRAY);
  }
  
  // DOOR
  strokeWeight(30);
  stroke(#0A1324);
  line(300,80,1400,80); //hinge
  line(300,80,300-turn,580-turn); // left
  line(1400,80,1400+turn,580-turn); // right
  line(300-turn,580-turn,1400+turn,580-turn); //down
  stroke(0);
  strokeWeight(10);

  image(user_interface, 300,600);      //User Interface
  user_interface.resize(1100,300);
  
  fill(72,185,36);
  if(running == true){
    textSize(20);
    text("******Running******** \n   " + message + "\n**********************\n", 315,640);
  }else{
    
  textSize(26);
  text("**************** \n     " + message + "\n****************\n", 315,640);
  }
  
  /////////////////////////////////////////////////////////////////////////////////////////////////////
  
  
/////////////////////////////////////DOOR SETUP///////////////////////////////////////////////
  if(doorOpen == false){
    image(openbutton, 1195,765);
    openbutton.resize(205,130);
  }
  else{
    image(closebutton, 1195,765);
    closebutton.resize(205,130);
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
    if(choice.equals("stop")){
      reset();
      }
    
    if(choice.equals("30s")){
      start = true;
     timer = startTimer(timer);
    }
    
    if(start == true && timer > 0 && doorOpen == false){
         timer = startTimer(timer);
       }
       else{
        
         if(choice.equals("timer") && timer > 0){
           message = String.valueOf(timer);
         }else if(choice.equals("clock")){
            message = String.valueOf(hour()) + ":" + String.valueOf(minute()) + ":" + String.valueOf(second());
          }else{
               
                  message = choice;
             }
          }
    
  }else{
    message = "OFF";
    choice = "----";
    timer = 0;
  }
  
  //////////////////////////////////////////////////////////////////////////////////////////////////

}

// To calculate the button size uncomment this to change button interface. 
//int[] X = new int[4];
//int[] Y = new int[4];
//int xsz = 0 , ysz = 0;
void mousePressed(){
  //X[xsz++] = mouseX;
  //Y[ysz++] = mouseY;
  
  //if(xsz==4){
  // println("POINTS", min(X), max(X), min(Y), max(Y)); 
  //}
 //-------------------------------Extra buttons-----------------------
  if(mouseX >= 350 && mouseX <488 && mouseY >= 741 && mouseY < 877){
    choice = "ON";
    powerOn ^= true;
  }
  if(mouseX >=590 && mouseX <675 && mouseY >=640 && mouseY < 715){
    choice = "popcorn";
    timer = 120;
  }
  if(mouseX >=710 && mouseX <775 && mouseY >=645 && mouseY < 715){
    choice = "pizza";
    timer = 240;
  }
  if(mouseX >=715 && mouseX <780 && mouseY >= 730 && mouseY <795){
    choice = "potato";
    timer = 180;
  }
  if(mouseX >= 600 && mouseX <650 && mouseY >= 815 && mouseY <875){
    choice = "beverage";
    timer = 90;
  }
  if(mouseX >=595 && mouseX <650 && mouseY >= 740 && mouseY <805){
    choice = "defrost";
    timer = 300;
  }
  if(mouseX >= 710 && mouseX <780 && mouseY >= 810 && mouseY < 870){
    choice = "clock";
  }
  
  //----------------------------number keypad---------------------------
  if(mouseX >= 935 && mouseX <980 && mouseY >=650 && mouseY <695){
    choice = "timer";
    timer = timer*10+1;
  }
  if(mouseX >= 1005 && mouseX <1050 && mouseY >=650 && mouseY <690){
    choice = "timer";
    timer = timer*10+2;
  }
  if(mouseX >= 1075  && mouseX <1125 && mouseY >=650 && mouseY <690){
    choice = "timer";
    timer = timer*10+3;
  }
  if(mouseX >= 940 && mouseX <985 && mouseY >=710 && mouseY <755){
    choice = "timer";
    timer = timer*10+4;
  }
  if(mouseX >= 1010 && mouseX <1050 && mouseY >=710 && mouseY <750){
    choice = "timer";
    timer = timer*10+5;
  }
  if(mouseX >= 1075 && mouseX <1125 && mouseY >=715 && mouseY <750){
    choice = "timer";
    timer = timer*10+6;
  }
  if(mouseX >= 940 && mouseX <985 && mouseY >=775 && mouseY <805){
    choice = "timer";
    timer = timer*10+7;
  }
   if(mouseX >= 1010 && mouseX <1050 && mouseY >=770 && mouseY <815){
    choice = "timer";
    timer = timer*10+8;
  }
  if(mouseX >= 1075 && mouseX <1120 && mouseY >=770 && mouseY <810){
    choice = "timer";
    timer = timer*10+9;
  }
   if(mouseX >= 1010 && mouseX <1050 && mouseY >=830 && mouseY <865){
   choice = "timer";
    timer = timer*10+0;
  }
  //------------------------------------------------------------------------
  
  //------------------------------------- Controls----------------------
   if(mouseX >= 1200 && mouseX <1405 && mouseY >=690 && mouseY <765){
    start = true;
  }
   if(mouseX >= 1195  && mouseX <1300 && mouseY >=615 && mouseY <695){
    choice = "stop";
    
  }
   if(mouseX >= 1300 && mouseX <1400 && mouseY >=620 && mouseY <690){
    choice = "30s";
    timer = 30;
  }
   if(mouseX >= 1195 && mouseX <1400 && mouseY >=770 && mouseY <890){
    choice = "door";
    doorOpen ^= true;
  }
  //---------------------------------------------------------------------
  
}

int startTimer(int n){
  char[] s = {'|', '/', '-', '\\'};        //Se
  if(st > j){
    message =  choice + s[n%4] + ' ' + String.valueOf(timer) + "s rem";  
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
  
  
 choice = "-------";
 timer = 0;
 running = false;
 start = false;
}
