class Dot{

  PVector position;
  PVector velocity;
  PVector acceleration;
  Brain brain;
  boolean dead = false;
  float fitness = 0;
  boolean hasReachedGoal = false;
  boolean isBest = false;
  
  Dot(){
    position = new PVector(width - 1250, height/2);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    brain = new Brain(500);
  }
  
  
  void showDot(){
    if(isBest){
       fill(0,255,0);
       ellipse(position.x, position.y, 8,8);
    }else{
      fill(0);
      ellipse(position.x, position.y, 4,4);
    }

  }
  
  void updateDot(){
    
    if(!dead && !hasReachedGoal){
      moveDot();
      if(position.x < 5 || position.y < 5 || position.x > width - 8 || position.y > height - 8){
        dead = true;
       }else if(dist(position.x, position.y, goal.x, goal.y) < 5){
         hasReachedGoal = true;
       }else if(obstacle.isHitObstacle(position.x, position.y)){
         dead = true;
       }
     }
  }
  
  void moveDot(){
    
    if(brain.directions.length > brain.step){
      acceleration = brain.directions[brain.step];
      brain.step++;
    }else{
      dead = true;
    }
    velocity.add(acceleration);
    velocity.limit(10);
    position.add(velocity);
  
  }
  
  void calculateFitness(){
    if(hasReachedGoal){
      fitness = 1.0/16.0 +  10000.0 / (float) (brain.step * brain.step);
    }else{
      float distanceToGoal = dist(position.x, position.y, goal.x, goal.y);
      fitness = 1.0 / (distanceToGoal * distanceToGoal);
    }
  }
  
   Dot getChild(){
    Dot child = new Dot();
    child.brain = brain.clone();
    return child;
  }

}
