
Grid table;

void setup() {
  size(800, 600);

  table = new Grid();
  table.put(1, 1, "Hello");
  table.put(2, 1, "2,1");
  table.put(1, 2, "1,2");
  table.put(2, 2, "There");
  table.put(4, 4, "Last");
}


void draw() {
  background(128);

  table.draw();
  if(random(1)>.90){
    println("frameRate", frameRate);
  }
}
