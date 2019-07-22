// Color swatch
color c0 = color(73, 81, 208);
color c1 = color(243, 240, 114);
color c2 = color(125, 222, 227);
color c3 = color(245, 91, 85);

PFont font;

boolean switchLight = true;

void setup () {
  // set the window size:
  size(600, 600);
  background(255);

  font = loadFont("MuseoSansRounded-300-48.vlw");
  textAlign(CENTER, CENTER);
  textFont(font, 30);

  //callMovuino("127.0.0.1", 3000, 3001);
  //callMovuino("150.10.147.44", 7400, 7401);
  callMovuino("192.168.43.29", 7400, 7401);
  
  noStroke();
  fill(c0);
  rect(0, 0, width/2, height/2);
  fill(c1);
  rect(width/2, 0, width/2, height/2);
  fill(c2);
  rect(0, height/2, width/2, height/2);
  fill(c3);
  rect(width/2, height/2, width/2, height/2);
}

void draw(){
}

void mousePressed() {
  color c = get(mouseX, mouseY);
  movuino.setNeopix(c);
}

void keyPressed() {
  if (keyCode == ENTER) {
    println("Light ON =", switchLight);
    switchLight = !switchLight;
    movuino.lightNow(switchLight);
  }
  
  if (key == CODED) {
    if (keyCode == UP) {
      movuino.setBrightness(movuino.brightness + 1);
    } 
    if (keyCode == DOWN) {
      movuino.setBrightness(movuino.brightness - 1);
    }
  }
}
