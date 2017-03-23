//G_in_Sunglasses.pde

//XML xml;
int c = 0;
String s;
int page = 1;
//String svgFile = "Starbucks_Corporation_Logo.svg";
//String svgFile = "Seal_of_the_Central_Intelligence_Agency.svg";
//String svgFile = "Flag_of_the_United_Kingdom.svg";
//String svgFile = "Flag_of_the_United_States.svg";
//String svgFile = "billy-bookcase-page1.svg";
//String svgFile = "me.svg";
String svgFile = "G_in_Sunglasses.svg";

PShape logo;
void setup() {
  size(1200, 1600);
  background(255);
  String lines[] = loadStrings(svgFile);
  // XML[] children = xml.getChildren("g");

  for ( int i = 60; i < lines.length; i++) {
    int x = int(random(2, 6));
    int y = int(random(2, 6));
    String xx = str(x);
    String yy = str(y);
    lines[i] = lines[i].replace(xx, yy);
  } 


  saveStrings("s.svg", lines);
  //println(lines);
  logo = loadShape("s.svg");
  shape(logo, 0, 0, width, height);
}



void draw() {
  c++;
  if (c % 6 == 0) {
    background(255);

    shape(logo, 0, 0, width, height);
    thread("redraw");
  }
}


void redraw() {
  println("redrawing " + page);
  String lines[] = loadStrings(svgFile);


  for ( int i = 60; i < lines.length - 2; i++) {
    int x = int(random(2, 7));
    int y = int(random(2, 7));
    String xx = str(x);
    String yy = str(y);


    lines[i] = lines[i].replace(xx, yy);
  } 

  
  if (page < 186) {
    saveStrings(page + ".svg", lines);
    //save(page + ".png");
    page ++;
  } else {
    exit();
  }

  logo = loadShape(page + ".svg");

  //println(lines);
}