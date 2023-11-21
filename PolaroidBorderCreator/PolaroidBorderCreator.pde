//Created by Gavin Morrisseau
//Specify scanned Polaroid's file name in program and program will output photo with border made from input photo.

final int BORDER_OFFSET = 100; //default 100
final int BACKGROUND_OFFSET = 700; //default 700
String fileName;
PImage foreground, background;

void settings() {
  size(800,1000); //CHANGE AS NEEDED FOR THE PICTURE (default 800,1000)
}

void setup() {
   newPic();
}

void newPic() {
  fileName = getFileName();
  initImage(fileName);
  process();
  output();
}

String getFileName() {
  fileName = getString("File Name: ");
  if(fileName == null || fileName == "")
    System.exit(0);
  return fileName;
}

void initImage(String fileName) {
  try {
    foreground = loadImage(fileName);
    background = loadImage(fileName);
    if(foreground == null || background == null) {
      newPic();
    }
  }
  catch(NullPointerException e) {
    println("Error!");
  }
}

void process() {
  background.resize(width+BACKGROUND_OFFSET,height+BACKGROUND_OFFSET);
  foreground.resize(width-50,height-100);
  image(background,-width/3,-height/3);
  image(foreground,BORDER_OFFSET/4,BORDER_OFFSET/2);
}

void output() {
  saveFrame(fileName + ".JPG");
  println("Saved!");
  newPic();
}