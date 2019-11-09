class Population{
  Dot[] dots;
  float fitnessSum;
  int generation = 1;
  int bestDotIndex;
  int minStep = 500;
  
  Population(int size){
    dots = new Dot[size];
    for(int i = 0; i < size; i++){
      dots[i] = new Dot();
    }
  }
  
  void showPopulation(){
    for(int i = 1;i < dots.length; i++){
      dots[i].showDot();
    }
    dots[0].showDot();
  }
  
  void updatePopulation(){
     for(int i = 0;i < dots.length; i++){
       if(dots[i].brain.step > minStep){
         dots[i].dead = true;
       }else{
         dots[i].updateDot();
       }
    }
  }
  
  void calculateFitness(){
    for(int i = 0; i < dots.length; i++){
      dots[i].calculateFitness();
    }
  }
  
  boolean isAllDotsDead(){
    for(int i = 0; i < dots.length; i++){
      if(!dots[i].dead && !dots[i].hasReachedGoal){
        return false;
      }
    }
    return true;
  }
  
  void naturalSelection(){
    Dot[] newDots = new Dot[dots.length];
    selectBestDot();
    calculateFitnessSum();
    
    newDots[0] = dots[bestDotIndex].getChild();
    newDots[0].isBest = true;
    for(int i =1;i< newDots.length; i++){
      Dot parent = selectParent();
      newDots[i] = parent.getChild();
    }
    
    dots = newDots.clone();
    generation++;
  }
  
  void calculateFitnessSum(){
    fitnessSum = 0.0;
    for(int i=0;i<dots.length; i++){
      fitnessSum += dots[i].fitness;
    }
  }
  
  Dot selectParent(){
    float randomSum = random(fitnessSum);
    float runningSum = 0;
    
    for(int i=0;i< dots.length;i++){
      runningSum += dots[i].fitness;
      
      if(runningSum > randomSum){
        return dots[i];
      }
    }
    
    return null;
  }
  
  void mutateChildren(){
    for(int i=1;i<dots.length; i++){
      dots[i].brain.mutate();
    }
  }
  
  void selectBestDot(){
    float max = 0;
    int maxIndex = 0;
    for(int i=0;i< dots.length;i++){
      if(dots[i].fitness > max){
        max = dots[i].fitness;
        maxIndex = i;
      }
    }
    bestDotIndex = maxIndex;
    
    if(dots[bestDotIndex].hasReachedGoal){
      minStep = dots[bestDotIndex].brain.step;
      println("Generation::"+generation+" --- Best Step::" + minStep);
    }
  }

}
