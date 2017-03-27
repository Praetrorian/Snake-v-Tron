class Apple{
  PVector pos;
  
  Apple(){
    pos = new PVector(random(width), random(height));
  }
  
  void show(){
    fill(20,220,20);
   ellipse(pos.x, pos.y,20,20); 
    
  }
  
}