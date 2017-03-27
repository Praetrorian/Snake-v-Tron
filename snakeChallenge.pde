Snake p1 = new Snake(true);
Snake p2 = new Snake(false);
Apple apple = new Apple();
color back = #092E0A;
int score1 = 0, score2 = 0;

void setup() {
  size(600, 600);
  background(back);
}

void draw() {
  background(back);
  showScore();
  
  apple.show();


  p1.eat(apple);
  p1.update();
  p1.show();

  p2.eat(apple);
  p2.update();
  p2.show();

  if (p1.hitSnake(p2)) {
    reset();
    score2++;
  }
  if (p2.hitSnake(p1)) {
    reset();
    score1++;
  }
}