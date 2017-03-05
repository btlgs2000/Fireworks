PVector gravity = new PVector(0, 0.01);
ArrayList<Firework> fireworks;
PImage particleImage;
color[] colors = {color(255, 30, 30),
                  color(30, 255, 30),
                  color(30, 30, 255)};
int particleRadius = 20;
int particleNumber = 500;
float meanSpeed = 2.8;
float sigmaSpeed = 0.6; 
int meanLive = 300;
float sigmaLiveDuration = 100;
int color_range = 100;
float particle_exponent = 0.9;
float shininess = 0.5;

void setup(){
  //fullScreen(P2D);
  size(600, 400, P2D);
  blendMode(ADD);
  particleImage = createParticleShape(particleRadius, particle_exponent);
  fireworks = new ArrayList<Firework>();
  colorMode(HSB, color_range);
}

void draw(){
  background(0);
  Iterator<Firework> fireworkIterator= fireworks.iterator();
    while(fireworkIterator.hasNext()) {
      Firework firework = fireworkIterator.next();
      // controlla se il firework contiene particelle vive. Se no eliminalo, altrimenti aggiornalo
      if(firework.getAliveParticlesNumber() == 0) {
        // il firework è esaurito
        fireworkIterator.remove();
      } else {
        // il firework è ancora valido
        firework.update();
        firework.draw();
      }
    }
}

void mousePressed() {
  //fireworks.add(new Firework(particleImage, new PVector(mouseX, mouseY), particleNumber, randomColor(), meanSpeed, sigmaSpeed, meanLive, sigmaLiveDuration, true));
  fireworks.add(new RocketFirework(new PVector(width/2, height), new PVector(mouseX, mouseY), particleImage, randomColor(), particleImage, particleNumber, randomColor(), meanSpeed, 
    sigmaSpeed, meanLive, sigmaLiveDuration, true));
}

//color randomColor() {
//  int indice = floor(random(colors.length));
//  return colors[indice];
//}

color randomColor() {
  return color(random(color_range), color_range/3, color_range);
}
//void setup(){
//  fullScreen();
//  blendMode(ADD);
//  particleImage = createParticleShape(particleRadius);
//  background(0);
//  image(particleImage, 50, 50);
//}