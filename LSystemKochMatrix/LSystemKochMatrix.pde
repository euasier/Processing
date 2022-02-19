String lSystem;

void setup() {
  size(900,800);
  String[] lines = loadStrings("Koch3.txt");
  lSystem = lines[0];
  println("LSystem: " + lSystem);
}


void drawVector(int[] v) {
  line(v[0],v[1],v[2],v[3]);
}

void draw() {
  int[] vector2 = {0,0,20,0};
  int i = 0;
  
  translate(100,300);
  
  while (i<lSystem.length()) {
    char step = lSystem.charAt(i);


    if(step=='F') {
      translate(20, 0);
      drawVector(vector2);
    }
        
    if(step=='L') {
      translate(20,-20);
      rotate(radians(90));
   }

    if(step=='R') {
      translate(20,20);
      rotate(radians(-90));
    }
    
       
    i = i + 1;
  }
  
}
