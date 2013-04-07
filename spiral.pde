class Spiral{
  int spSize = 10;
  int seed;
  int[] spiralF;
  float s; // scale
  
  Spiral(int scaledW){
    seed = (scaledW)/(spSize*10);
    s = 1;
    spiralF = new int[spSize];
    // populate the array with the golden spiral
    for (int i = 0; i < spiralF.length; i++){
      if (i < 2){
        spiralF[i] = seed;
      }
      else {
        spiralF[i] = spiralF[i-1] + spiralF[i-2];
      }
    }
  }
  
  void display(color spColor){
      translate(0, spiralF[spSize-1]*s);
      rotate(radians(-90));
      for (int i = spiralF.length-1; i > 0; i--){
        if (i < spiralF.length-1){
         translate(spiralF[i+1]*s, 0);
          rotate(radians(90));
          translate(spiralF[i+1]*s, 0);
        }
        noFill();
        stroke(spColor);
        rect(0, 0, spiralF[i]*s, spiralF[i]*s);
//        fill(0, 255, 0);
//        ellipse(0, 0, 10, 10);
        line(0, 0, spiralF[i], spiralF[i]);
      }
   }
}
