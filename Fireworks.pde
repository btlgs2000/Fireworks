PVector gravity = new PVector(0, 0.01);
ArrayList<Firework> fireworks;
PImage particleImage;
color[] colors = {color(255, 30, 30),
                  color(30, 255, 30),
                  color(30, 30, 255)};
int particleRadius = 10;
int particleNumber = 500;
float meanSpeed = 2.8;
float sigmaSpeed = 0.6; 
int meanLive = 300;
float sigmaLiveDuration = 100;
int blendMode = ADD;
PGraphicsPool pGraphicsPool;


void setup(){
  fullScreen(P2D);
  blendMode(blendMode);
  pGraphicsPool = new PGraphicsPool(5);
  particleImage = createParticleShape(particleRadius);
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
        pGraphicsPool.free(firework.getPGraphics());       
      } else {
        // il firework è ancora valido
        firework.update();
        image(firework.draw(), 0, 0);
      }
    }
}

void mousePressed() {
  fireworks.add(new Firework(particleImage, pGraphicsPool.get(), new PVector(mouseX, mouseY), particleNumber, randomColor(), meanSpeed, sigmaSpeed, meanLive, sigmaLiveDuration));
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