int len = 63;
float scl = 1;
int maxY;

ArrayList<Toothpick> picks;

void setup() {
  size(800, 800);
  picks = new ArrayList<Toothpick>();
  picks.add(new Toothpick(0, 0, 1));
  frameRate(15);
  maxY = height/2;
}

void draw() {

  background(255);
  translate(width/2, height/2);

  scl =  (width/2) / float(maxY);
  scale(scl);

  ArrayList<Toothpick> next = new ArrayList<Toothpick>();

  for (Toothpick t : picks) {
    t.show();
    if (t.newPick) {
      Toothpick nextA = t.createA(picks);
      Toothpick nextB = t.createB(picks);
      if (nextA != null) {
        next.add(nextA);
      }
      if (nextB != null) {
        next.add(nextB);
      }
      t.newPick = false;
    }
    if (t.by+63 > maxY) {
      maxY = t.by+63;
      //println(maxY);
    }
    if(t.ay+63 > maxY) {
      maxY = t.ay+63;
    }
  }

  picks.addAll(next);
}
