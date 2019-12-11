
Table table;

void setup() {
  size(800, 600);

  table = new Table();
  table.put(1, 1, "Hello");
  table.put(2, 2, "There");
}


void draw() {
  background(128);

  table.draw();
}
