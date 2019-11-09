class Brain{

  PVector[] directions;
  int step = 0;

  Brain(int size){
   directions = new PVector[size];
   getRandomSize();
  }
 
  void getRandomSize(){
    for(int i=0;i<directions.length;i++){
      float randomAngle = random(2*PI);
      directions[i] = PVector.fromAngle(randomAngle);
    }
  }
  
  Brain clone(){
    Brain cloneBrain = new Brain(directions.length);
    
    for(int i=0;i<directions.length;i++){
      cloneBrain.directions[i] = directions[i].copy();
    
    }
   return cloneBrain;
  }
  
  void mutate(){
    float mutationRate = 0.01;
    for(int i=0;i<directions.length;i++){
      float random = random(1);
      if(random < mutationRate){
         float randomAngle = random(2*PI);
         directions[i] = PVector.fromAngle(randomAngle);
      }
    }
  }
  
}
