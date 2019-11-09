class Obstacle{
  void showObstacles(){
    fill(0,0,255);
    rect(200,100,10,600);
    
    rect(400,00,10,300);
    
    rect(400,400,10,600);
    
     rect(900,100,10,600);
  }
  
  boolean isHitObstacle(float x, float y){
    if(x > 200 && x < 210 && y > 100 && y < 700 ){
      return true;
    }
    if(x > 400 && x < 410 && y > 00 && y < 300 ){
      return true;
    }
    if(x > 400 && x < 410 && y > 400 && y < 1000 ){
      return true;
    }
    if(x > 900 && x < 910 && y > 100 && y < 700 ){
      return true;
    }
    return false;
  }
}
