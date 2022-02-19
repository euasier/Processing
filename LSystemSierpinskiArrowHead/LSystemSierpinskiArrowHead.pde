String lSystem;

void setup() {
  size(700,700);
  String[] lines = loadStrings("SierpinskiArrowHead6.txt");
  lSystem = lines[0];
  println("LSystem: " + lSystem);
}

void printVector(String s, float[] v) {
  println(s + " " + v[0] + " " + v[1] + " " + v[2] + " " + v[3]);
}

float[] assignVector(float[] v) {
  float[] result = new float[4];
  
  for(int i=0;i<4;i++) {
    result[i] = v[i];
  }
  
  return result;
}

float[] translateVector(float[] v, float[]tr) {
  float[] result = new float[4];
  float deltaX = v[2] - v[0];
  float deltaY = v[3] - v[1];
  
  result[0] = tr[0]; 
  result[1] = tr[1];
  result[2] = result[0] + deltaX;
  result[3] = result[1] + deltaY;
  
  return result;
}

float[] addVectors(float[] v1, float[]v2) {
  float[] result = new float[4];
  
  for(int i=0;i<4;i++) {
    result[i] = v1[i]+v2[i];
  }
  
  return result;
}

float[] rotateVector(int degrees, float[] v) {
  float[] result = {0,0,0,0};

  result[2] = (float) (v[2] * cos(radians(degrees)) - v[3] * sin(radians(degrees)));
  result[3] = (float) (v[3] * cos(radians(degrees)) + v[2] * sin(radians(degrees)));
  
  return result;
}

void drawVector(float[] v) {
  line(v[0],v[1],v[2],v[3]);
}

void draw() {
  float[] tr = {0,0,0,0};
  float[] vector1 = {0,0,5,0};
  float[] vector2 = {0,0,5,0};
  int i = 0;
  
  translate(150,350);
 
  while (i<lSystem.length()) {
    char step = lSystem.charAt(i);
   
      println(i + " " + step);
    if(step=='A' || step=='B') {
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
      vector2 = rotateVector(60,vector1);
      vector1[0] = vector2[0];
      vector1[1] = vector2[1];
      vector1[2] = vector2[2];
      vector1[3] = vector2[3];
   }

    if(step=='R') {
      vector2 = rotateVector(-60,vector1);
      vector1[0] = vector2[0];
      vector1[1] = vector2[1];
      vector1[2] = vector2[2];
      vector1[3] = vector2[3];
    }
    
       
    i = i + 1;
  }
}
