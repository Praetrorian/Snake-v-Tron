void keyPressed() {
  if (keyCode == RIGHT) {
    p1.turnLeft = false;
    p1.turn = true;
  }  

  if (keyCode == LEFT) {
    p1.turnLeft = true;
    p1.turn = true;
  }
  if (key == 'd' || key == 'D') {
    p2.turnLeft = false;
    p2.turn = true;
  }  
  if (key == 'a' || key == 'A') {
    p2.turnLeft = true;
    p2.turn = true;
  }
}

void keyReleased() {
  if (keyCode == RIGHT) {
    p1.turn = false;
  }  

  if (keyCode == LEFT) {
    p1.turn = false;
  }
  if (key == 'd' || key == 'D') {
    p2.turn = false;
  }  
  if (key == 'a' || key == 'A') {
    p2.turn = false;
  }
}

void reset() {
  p1 = new Snake(true);
  p2 = new Snake(false);
  apple = new Apple();
}

void showScore() {
  textAlign(CENTER);
  textSize(40);
  fill(50, 180, 50);
  text(score1, width/2 - 50, 50); 
  text(score2, width/2 + 50, 50);
}