import peasy.*;
PeasyCam cam;

int numPlanets = 9;

Planet sun;

PImage[] textures = new PImage[9];
PFont SourceSansPro;
PFont Nasalization;


float[] PlanetDis = {-400, -300, -200, -100, 0, 100, 200, 300, 400};
float[] PlanetDisActu = {-2872.5 -1000, -778.6 -1000, -149.6 -1000, -57.9 -1000, 0, 108.2 +1000, 227.9 +1000, 1433.5 +1000, 4495.1 +1000};
float[] planetSizes = {20, 20, 20, 20, 20, 20, 20, 20, 20};
float[] planetSizesActu = {51.118, 142.984, 12.756, 4.879, 1000, 12.104, 6.792, 12.0536, 49.528};


class Planet{
  float radius;
  float distance;
  float angle;
  PShape globe;
  PImage img;
    
  Planet(float r, float d, PImage img){
    radius = r;
    distance = d;
    angle = 0;
    this.img = img;

    
    noFill();
    //fill(255);
    globe = createShape(SPHERE, radius);
    globe.setTexture(img);
    noStroke();
  }
}

Planet[] planets;

void setup() {
  size(800, 600, P3D);
  cam = new PeasyCam(this, 700);
  
  textures[0] = loadImage("*img/uranus.jpeg");
  textures[1] = loadImage("*img/jupiter.jpeg");
  textures[2] = loadImage("*img/earth.jpeg");
  textures[3] = loadImage("*img/mercury.jpeg");
  textures[4] = loadImage("*img/sun.jpeg");
  textures[5] = loadImage("*img/venus.jpeg");
  textures[6] = loadImage("*img/mars.jpeg");
  textures[7] = loadImage("*img/saturn.jpeg");
  textures[8] = loadImage("*img/neptune.jpeg");

  SourceSansPro = createFont("*assets/SourceSansPro-Light.ttf", 128);
  Nasalization = createFont("*assets/nasalization-rg.otf", 128);

  noFill();
  noStroke();
  
  planets = new Planet[numPlanets];
  for (int i = 0; i < numPlanets; i++) {
    planets[i] = new Planet(planetSizes[i], PlanetDis[i], textures[i]);
}
  
  //for (int i = 0; i < numPlanets; i++) {
  //  int index = int(random(0, textures.length));
  //  planets[i] = new Planet(planetSizes[i], PlanetDis[i], textures[index]);
  //}
  
}

void draw() {
  background(0);
  lights();
  
  for (int i = 0; i < numPlanets; i++) {
    push();
    translate(PlanetDis[i], 0, 0);
    noStroke();
    shape(planets[i].globe);
    sphere(planetSizes[i]);
    pop();
  }
  
  translate(0, 0);
  textFont(Nasalization);
  textSize(48);
  text("Solar System", -170, -200); 
  textFont(SourceSansPro);
  textSize(24);
  text("Click and reveal actual sizes and distances", -120, -170); 
}

void keyPressed() {
  if (key == '0') {
    cam.setDistance(cam.getDistance() - 300);
  }
  if (key == '1') {
    cam.setDistance(cam.getDistance() + 300);
  }
}

//void mousePressed () {
//  text("Press, then drag, the mouse in the brown area (rooftop) to begin to Press, then drag, the mouse in the brown area (rooftop) to begin", 0, 0);
//}

void mouseClicked() {
  for (int i = 0; i < numPlanets; i++) {
    planets[i] = new Planet(planetSizesActu[i], PlanetDisActu[i], textures[i]);
    planetSizes[i] = planetSizesActu[i];
    PlanetDis[i] = PlanetDisActu[i];
    cam = new PeasyCam(this, 5000);
    redraw();
  }
}
