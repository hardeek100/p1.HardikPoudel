// Program to demonstrate microwave interface using processing.
// Name: Hardik Poudel
// Class: CS 4331-006 Spring 2021 Special Topics in Computer Science: Human Computer Interaction.




int st =0, ct =0, turn = 0, timer = 0, num = -1, j = 0;
boolean doorOpen = false, powerOn = false, running = false, start = false;

color lightOn = color(198,142,28);
color lightOff= color(124,114,95);

PImage user_interface, user_interfaceon, openbutton, closebutton, food, pizza, potato, popcorn, broc;

String message = "";
String choice = "";

void setup(){
  size(1690, 900);
  smooth();
  user_interface = loadImage("interface.png");

  openbutton = loadImage("open.png");
  closebutton = loadImage("Close.png");
  pizza = loadImage("pizza.png");
  potato = loadImage("potato.png");
  popcorn = loadImage("popcorn.png");
  broc = loadImage("food.png");
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
   else if(choice.equals("")){
     food = broc;
   }

  
  
  
  
  if(running == false){
    fill(lightOff);
  }
   else{
     fill(lightOn);
   }
   rect(300,80,1100,500);  //food box;
  
  if(doorOpen == true){
    
  image(food, 300,80);
  food.resize(1100,500);
  
  } 
  
  
  strokeWeight(30);
  stroke(#0A1324);
  line(300,80,1400,80); //hinge
  line(300,80,300-turn,580-turn); // left
  line(1400,80,1400+turn,580-turn); // right
  line(300-turn,580-turn,1400+turn,580-turn); //down
  stroke(0);
  strokeWeight(10);

  image(user_interface, 300,600);
  user_interface.resize(1100,300);
  
  fill(72,185,36);
  textSize(26);
  text(message, 365,660);
  /////////////////////////////////////////////////////////////////////////////////////////////////////
  
  
/////////////////////////////////////DOOR SETUP///////////////////////////////////////////////
  if(doorOpen == false){
    image(openbutton, 1225,765);
    openbutton.resize(120,120);
  }
  else{
    image(closebutton, 1225,765);
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
    
    if(start == true && timer > 0 && doorOpen == false){
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


//int[] X = new int[4];
//int[] Y = new int[4];
//int xsz = 0 , ysz = 0;


  
void mousePressed(){
  //X[xsz++] = mouseX;
  //Y[ysz++] = mouseY;
  
  //if(xsz==4){
  // println("REES", min(X), max(X), min(Y), max(Y)); 
  //}
  

  println(mouseX, mouseY);
  if(mouseX >= 350 && mouseX <488 && mouseY >= 741 && mouseY < 877){
    choice = "on";
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
  
  if(mouseX >= 935 && mouseX <980 && mouseY >=650 && mouseY <695){
    choice = "time";
    timer = timer*10+1;
  }
  if(mouseX >= 1005 && mouseX <1050 && mouseY >=650 && mouseY <690){
    choice = "time";
    timer = timer*10+2;
  }
  if(mouseX >= 1075  && mouseX <1125 && mouseY >=650 && mouseY <690){
    choice = "time";
    timer = timer*10+3;
  }
  if(mouseX >= 940 && mouseX <985 && mouseY >=710 && mouseY <755){
    choice = "time";
    timer = timer*10+4;
  }
  if(mouseX >= 1010 && mouseX <1050 && mouseY >=710 && mouseY <750){
    choice = "time";
    timer = timer*10+5;
  }
  if(mouseX >= 1075 && mouseX <1125 && mouseY >=715 && mouseY <750){
    choice = "time";
    timer = timer*10+6;
  }
  if(mouseX >= 940 && mouseX <985 && mouseY >=775 && mouseY <805){
    choice = "time";
    timer = timer*10+7;
  }
   if(mouseX >= 1010 && mouseX <1050 && mouseY >=770 && mouseY <815){
    choice = "time";
    timer = timer*10+8;
  }
  if(mouseX >= 1075 && mouseX <1120 && mouseY >=770 && mouseY <810){
    choice = "time";
    timer = timer*10+9;
  }
   if(mouseX >= 1010 && mouseX <1050 && mouseY >=830 && mouseY <865){
   choice = "time";
    timer = timer*10+0;
  }
   if(mouseX >= 1215 && mouseX <1270 && mouseY >=640 && mouseY <690){
    start = true;
  }
   if(mouseX >= 1315 && mouseX <1370 && mouseY >=640 && mouseY <690){
    choice = "stop";
    
  }
   if(mouseX >= 1260 && mouseX <1320 && mouseY >=710 && mouseY <755){
    choice = "30s";
    timer = 30;
  }
   if(mouseX >= 1240 && mouseX <1330 && mouseY >=780 && mouseY <880){
    choice = "door";
    doorOpen ^= true;
  }
   println(choice);
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
