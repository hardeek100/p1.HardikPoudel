void setup(){
  size(1080,1000);
  
}

int x =0;
int y = 0;
color outerlayer = color(0,0,0);
color door = color(255,100,0);
color window = color(100,200,140);
color handle = color(255,50,0);
color menu = color(92, 152,175);
color display = color(0,0,0);
color doorswitch = color(100,200,140);
color numberpad = color(97,120,165);
color startbutton = color(97,120,165);
color stopbutton = color(97,120,165);



String message = "";




void draw(){
  
  
  fill(outerlayer);
  rect(80,200, 900,600);    //outer layer
  fill(door);
  rect(100, 250, 600,500);  //door
  fill(window);
  rect(125, 300, 480,400);  //window
  fill(handle);
  rect(620, 350,50,300);    //handle
  fill(menu);
  rect(720, 250, 230,500);  //menu
  
  fill(display);
  rect(730, 270,210,80);  //display
  fill(255);
  textSize(32);
  text(message, 740, 300);
  
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
  text("Open", 780,728);
  
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
  fill(startbutton);
  circle(755, 660, 40);
  
  fill(stopbutton);
  circle(880, 660, 40);

 if(x >= 730 && x <= 730+210 && y >= 690 && y <= 690+55){
    doorswitch = color(159,75,191);
    message = "Door open";
  } 
 
 if(x >= 800 && x<= 840 && y >= 640 && y <= 700){
   int s = second();
   message = Integer.toString(s);
 }


   
  
  
  
}


void mouseClicked(){
  x = mouseX;
  y = mouseY;
  print(x,y);
}
