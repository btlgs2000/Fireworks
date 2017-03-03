PVector gravity;
ArrayList<Firework> fireworks;
PImage particleImage;
color[] colors = {color(255, 30, 30),
                  color(30, 255, 30),
                  color(30, 30, 255)};
int particleRadius = 15;
int particleNumber = 500;
float meanSpeed = 1.8;
float sigmaSpeed = 0.1; 
int meanLive = 400;
float sigmaLiveDuration = 100;

void setup(){
  fullScreen(P2D);
  blendMode(ADD);
  particleImage = createParticleShape(particleRadius);
  gravity = new PVector(0, 0.01);
  fireworks = new ArrayList<Firework>();
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
  fireworks.add(new Firework(particleImage, new PVector(mouseX, mouseY), particleNumber, randomColor(), meanSpeed, sigmaSpeed, meanLive, sigmaLiveDuration));
}

//color randomColor() {
//  int indice = floor(random(colors.length));
//  return colors[indice];
//}

color randomColor() {
  return color(floor(random(256)), floor(random(256)), floor(random(256)));
}
//void setup(){
//  fullScreen();
//  blendMode(ADD);
//  particleImage = createParticleShape(particleRadius);
//  background(0);
//  image(particleImage, 50, 50);
//}