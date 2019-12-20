
import java.util.Set;

// Grid just has data no ui, position, or col width stuff
// was named Table 
// but processing has built in Table
// https://processing.org/reference/Table.html
class Grid {

  public void draw() {

    // rect background
    int tx = this.tableView.getX();
    int ty = this.tableView.getY();
    int w = this.tableView.getW();
    int h = this.tableView.getH();
    fill(255);
    rect(tx, ty, w, h);
    //if(1<2){return;}

    // header
    fill(30);
    rect(tx-2, ty, w+4, 20);
    fill(255);
    text("table header", tx+2, ty+20);
    fill(255);

    // text
    int rowH=20;
    int colW=60; //<>//
    Set<Integer> rowKeys = tableRows.keySet();
    for (Integer x : rowKeys) {
      int rowI = x;
      //println("draw",x);
      HashMap<Integer, String> row = tableRows.get(x);
      for (Integer y : row.keySet()) {
        int colI = y;
        String t = row.get(y);
        println("cell", colI, rowI, t);
        stroke(0);
        fill(255);
        //int x1=x-1;
        int xdest =(tx)+rowI*colW-colW;
        int ydest =ty+y*rowH;
        println("xdest",xdest," ydest",ydest);
        rect(xdest, ydest, colW, rowH);
        // text
        fill(0);
        text(t, xdest+2, ydest+20-2);
      }
    }
    /*
    cell 2 3 cell 2 4 cell 3 1 cell 3 2 cell 3 3 cell 3 4 
     cell 4 1 cell 4 2 cell 4 3 cell 4 4 
     cell 5 1 cell 5 2 cell 5 3 cell 5 4
     */

    // footer?
  }
  public Grid() {
    this.cols=4;
    this.rows=4;

    this.tableView = new GridView();
    tableRows = new HashMap();
    for (int r=1; r<rows; r++) {
      HashMap<Integer, String> row = new HashMap<Integer, String>();
      for (int c=1; c<=cols; c++) {
        row.put(c, "");
      }
      tableRows.put(r+1, row);
    }
  }

  // the table data
  private HashMap<Integer, HashMap<Integer, String>> tableRows = new HashMap();
  public void put(int colX, int rowY, String text) {
    if (colX<=0||rowY<=0) {
      println("must put to 1,1 or greater", colX, rowY);
      return;
    }
    // TODO flip the x and y
    int x = colX;
    int y = rowY;
    if (tableRows.containsKey(x)) {
      HashMap row = tableRows.get(x);
      if (row==null) {
        println("new row", x, y);
        row = new HashMap<Integer, String>();
      }
      row.put(y, text);
      return;
    } else {
      HashMap row = new HashMap<Integer, String>();
      row.put(y, text);
      tableRows.put(x, row);
    }
  }

  public void toFile(String name) {
    // TODO save the table to file
    /*
    table = new Table();
     table.addColumn("id");
     table.addColumn("species");
     table.addColumn("name");
     TableRow newRow = table.addRow();
     newRow.setInt("id", table.getRowCount() - 1);
     newRow.setString("species", "Panthera leo");
     newRow.setString("name", "Lion");
     saveTable(table, "data/new.csv");
     */
  }

  // Table owns a table view
  private GridView tableView;

  private final int cols;
  private final int rows;
}
