// One Map
PImage backgroundMap;
int[] pointsX = {-10, 160, 160, 360, 360, 630, 630, 1010};
int[] pointsY = {360, 360, 170, 170, 425, 425, 310, 310};

//Lists
ArrayList<Monster> monsters = new ArrayList<Monster>();
ArrayList<Tower> towers = new ArrayList<Tower>();

Tower t;

void setup() {
  size(1000, 670);
  backgroundMap = loadImage("back.png");
  background(backgroundMap);
  
  t = new Tower(440, 350, loadImage("tower.png"), 80, 2, 200);
  towers.add(t);
}

void draw() {
  background(backgroundMap);
  allMonstersTick(monsters);
  drawMonsters();
  
  image(t.image, t.x-(t.size/2), t.y-(t.size/2), t.size, t.size);
}

void keyPressed() {
  if (key == '1') monsters.add(new Monster(300, (int)random(1, 3), loadImage("monster_pink.png"), 65));
  if (key == '2') monsters.add(new Monster(1000, (int)random(2, 5), loadImage("monster_blue.png"), 70));
  if (key == '3') monsters.add(new Monster(2500, (int)random(3, 7), loadImage("monster_green.png"), 60));
}

void drawMonsters() {
  for (Monster a : monsters) {
    if (a != null && a.visible == true) {
      image(a.image, a.x-(a.size/2), a.y-(a.size/2), a.size, a.size);
      
      fill(170);  // Health Bar (Background)
      stroke(80);
      strokeWeight(2);
      rect(a.x-30, a.y-50, 60, 6, 5);
      
      fill(210, 30, 30);  // Health Bar (Red)
      stroke(80);
      strokeWeight(2);
      double f = (double)a.hp / (double)a.hpmax * 60.0;
      rect(a.x-30, a.y-50, (int)f, 6, 5);
      
      textSize(20);
      fill(10);
      textAlign(CENTER, CENTER);
      text(a.hp, a.x, a.y-50);
    }
  }
}
