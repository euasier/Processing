String lSystem;

void setup() {
  size(900,800);
  String[] lines = loadStrings("Koch5.txt");
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
  int[] tr = {0,0,0,0};
  int[] vector1 = {0,0,2,0};
  int[] vector2 = {0,0,2,0};
  int i = 0;
  
  translate(100,300);
 
  while (i<lSystem.length()) {
    char step = lSystem.charAt(i);
   
      println(i + " " + step);
    if(step=='F') {
      printVector("Vector 2:", vector2);
      printVector("Tr:", tr);
      vector2 = translateVector(vector2, tr);
      printVector("Vector 2 tr:", vector2);
      drawVector(vector2);
      tr[0] = vector2[2];
      tr[1] = vector2[3];
      tr[2] = 0;
      tr[3] = 0;
      printVector("Tr:", tr);
    }
        
    if(step=='L') {
      vector2 = rotateVector(90,vector1);
      vector1[0] = vector2[0];
      vector1[1] = vector2[1];
      vector1[2] = vector2[2];
      vector1[3] = vector2[3];
   }

    if(step=='R') {
      vector2 = rotateVector(-90,vector1);
      vector1[0] = vector2[0];
      vector1[1] = vector2[1];
      vector1[2] = vector2[2];
      vector1[3] = vector2[3];
    }
    
       
    i = i + 1;
  }
}
