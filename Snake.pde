class Snake {
  PVector head;
  ArrayList<PVector> bodies = new ArrayList<PVector>();
  float r = 10;
  boolean player1;

  PVector dir;
  float speed = 1;
  float turnSpeed = 0.05;
  boolean turn = false;
  boolean turnLeft = false;

  Snake(boolean p1) {
    player1 = p1;
    if (p1) {
      dir = new PVector(speed, 0);
      head = new PVector(100, 300);
      bodies.add(new PVector(80, 300));
    } else {
      dir = new PVector(-speed, 0);
      head = new PVector(500, 300);
      bodies.add(new PVector(520, 300));
    }
  }

  void eat(Apple a) {
    PVector position = new PVector(head.x%width, head.y%height);
    if (position.x < 0)
      position.x += width;
    if (position.y < 0)
      position.y += height;

    if (PVector.dist(position, a.pos) < 10) {
      apple = new Apple();
      PVector newBody = bodies.get(bodies.size()-1).copy();
      bodies.add(newBody);
      speed+= 0.2;
      dir.setMag(speed);
    }
  }
  boolean hitTail() {
    for (PVector b : bodies) {
      if (PVector.dist(b, head) < r){
        if(player1){
         score2++; 
        } else {
         score1++; 
        }
        return true;
      }
    }

    return false;
  }
  boolean hitSnake(Snake p) {
    for (PVector b : p.bodies) {
      if (PVector.dist(b, head) < r)
        return true;
    }

    return false;
  }
  void update() {
    for (int i = bodies.size()-1; i > 0; i--) {
      PVector direction = new PVector(bodies.get(i-1).x - bodies.get(i).x, bodies.get(i-1).y - bodies.get(i).y);
      if (direction.mag() > 2*r) {
        bodies.get(i).add(direction.setMag(speed));
      }
    }
    PVector direction =  new PVector(head.x - bodies.get(0).x, head.y - bodies.get(0).y);
    if (direction.mag() > 2*r)
      bodies.get(0).add(direction.setMag(speed));
    head.add(dir);

    if (turn) {
      if (turnLeft) {
        dir.rotate(-turnSpeed);
      } else {
        dir.rotate(+turnSpeed);
      }
    }
    if (hitTail()) {
      reset();
    }
  }


  void show() {
    noStroke();
    if (player1) {
      fill(220, 20, 20);
    } else {
      fill(20, 20, 220);
    }
    ellipseMode(CENTER);
    PVector position = new PVector(head.x%width, head.y%height);
    if (position.x < 0)
      position.x += width;
    if (position.y < 0)
      position.y += height;

    ellipse(position.x, position.y, 2*r, 2*r);
    int i = 0;
    for (int j = 0; j < bodies.size(); j++) {
      if (player1) {
        fill(220, 20 + 10*i, 20+ 10*i);
      } else {
        fill(20+ 10*i, 20+ 10*i, 220);
      }
      position = new PVector(bodies.get(j).x%width, bodies.get(j).y%height);

      if (position.x < 0)
        position.x += width;
      if (position.y < 0)
        position.y += height;
      ellipse(position.x, position.y, 2*r, 2*r);
      i++;
    }
  }
}