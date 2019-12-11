
import java.util.Set;

// Table just has data
class Table {

  public void draw() {

    // rect background
    int tx = this.tableView.getX();
    int ty = this.tableView.getY();
    int w = this.tableView.getY();
    int h = this.tableView.getY();
    fill(255);
    rect(tx, ty, w, h);

    // text
    int rowH=20;
    int colW=60;
    Set<Integer> colKeys = tableCols.keySet();
    for (Integer y : colKeys) {
      //println("draw",y);
      HashMap<Integer, String> col = tableCols.get(y);
      for (Integer x : col.keySet()) {
        String t = col.get(x);
        if (t.length()<1) {
          continue;
        }
        //println("draw",x,t);
        // cell
        stroke(0);
        fill(255);
        rect(tx+x*colW, ty+y*rowH, colW, rowH);
        // text
        fill(0);
        text(t, tx+x*colW+2, ty+y*rowH+20-2);
      }
    }
  }
  public Table() {
    this.cols=4;
    this.rows=4;

    this.tableView = new TableView();
  }

  // the table data
  private HashMap<Integer, HashMap<Integer, String>> tableCols = new HashMap();
  public void put(int x, int y, String text) {
    if (tableCols.containsKey(y)) {
      HashMap col = tableCols.get(x);
      if (col==null) {
        println("new col", y, x);
        col = new HashMap<Integer, String>();
      }
      col.put(x, text);
      return;
    } else {
      HashMap col = new HashMap<Integer, String>();
      col.put(x, text);
      tableCols.put(y, col);
    }
  }

  // Table owns a table view
  private TableView tableView;

  private int border=1;
  private int cols=0;
  private int rows=0;
}
