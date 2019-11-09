Population population;
PVector goal;
Obstacle obstacle;

void setup(){
  size(1300,800);
  goal = new PVector(1250,400);
  population = new Population(2000);
  obstacle = new Obstacle();
}

void draw(){
  background(255);
  fill(255,0,0);
  ellipse(goal.x, goal.y, 10, 10);
  
  obstacle.showObstacles();
  
  if(population.isAllDotsDead()){
    population.calculateFitness();
    population.naturalSelection();
    population.mutateChildren();
  }else{
    population.updatePopulation();
    population.showPopulation();
  }
}
