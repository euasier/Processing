String lSystem;

void setup() {
  size(900,1100);
  String[] lines = loadStrings("FractalPlant6.txt");
  lSystem = lines[0];
  println("LSystem: " + lSystem);
}

void printVector(String s, int[] v) {
  println(s + " " + v[0] + " " + v[1] + " " + v[2] + " " + v[3]);
}

int[] assignVector(int[] v) {
  int[] result = new int[4];
  
  for(int i=0;i<4;i++) {
    result[i] = v[i];
  }
  
  return result;
}

int[] translateVector(int[] v, int[]tr) {
  int[] result = new int[4];
  int deltaX = v[2] - v[0];
  int deltaY = v[3] - v[1];
  
  result[0] = tr[0]; 
  result[1] = tr[1];
  result[2] = result[0] + deltaX;
  result[3] = result[1] + deltaY;
  
  return result;
}

int[] addVectors(int[] v1, int[]v2) {
  int[] result = new int[4];
  
  for(int i=0;i<4;i++) {
    result[i] = v1[i]+v2[i];
  }
  
  return result;
}

int[] rotateVector(int degrees, int[] v) {
  int[] result = {0,0,0,0};

  result[2] = (int) (v[2] * cos(radians(degrees)) - v[3] * sin(radians(degrees)));
  result[3] = (int) (v[3] * cos(radians(degrees)) + v[2] * sin(radians(degrees)));
  
  return result;
}

void drawVector(int[] v) {
  line(v[0],v[1],v[2],v[3]);
}

void draw() {
  int vLength = 4;
  int[] vector2 = {0,0,vLength,0};
  int i = 0;
  
  translate(300,700);
  rotate(radians(-90));
  
  while (i<lSystem.length()) {
    char step = lSystem.charAt(i);


    if(step=='F') {
//      translate(vLength, 0);
      drawVector(vector2);
      translate(vLength, 0);
    }
        
    if(step=='L') {
//      translate(vLength,-vLength);
      rotate(radians(25));
   }

    if(step=='R') {
//      translate(vLength,vLength);
      rotate(radians(-25));
    }
    
    if(step=='U') {
      pushMatrix();
    }
    if(step=='O') {
      popMatrix();
    }
    
    i = i + 1;
  }
  
}
