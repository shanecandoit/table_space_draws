
// GridView has data just for ui, position, or col width stuff
// A Grid should be viewable with two different GridViews
class GridView {


  public GridView() {
    //int rowH=20;
    //int colW=60;
    this.x=100;
    this.y=100;
    this.w=4*60;
    this.h=4*20;
  }

  private int x;
  public int getX() {
    return x;
  }
  private int y;
  public int getY() {
    return y;
  }
  private int w;
  public int getW() {
    return w;
  }
  private int h;
  public int getH() {
    return h;
  }
}
