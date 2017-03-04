import java.util.Iterator;
 
class Firework{
  PVector position;
  int particlesNumber; 
  color color_;
  float meanSpeed; 
  float sigmaSpeed;
  int meanLive;
  float sigmaLiveDuration;
  ArrayList<Particle> particles;
  PImage particleImage;
  // oggetto PGraphics su cui viene disegnato il fuoco d'artificio
  PGraphics pGraphics;
  
  Firework(PImage particleImage, PGraphics pGraphics, PVector position, int particlesNumber, color color_, float meanSpeed, float sigmaSpeed, int meanLive, float sigmaLiveDuration) {
    this.position = position;
    this.particlesNumber = particlesNumber;
    this.color_ = color_;
    this.meanSpeed = meanSpeed;
    this.sigmaSpeed = sigmaSpeed;
    this.meanLive  = meanLive;
    this.sigmaLiveDuration = sigmaLiveDuration;
    this.particleImage = particleImage;
    this.pGraphics = pGraphics;
    
    this.pGraphics.beginDraw();
    this.pGraphics.blendMode(blendMode);
    this.pGraphics.endDraw();
    particles = createParticles();
  }
  
  int getAliveParticlesNumber() {
    return this.particles.size();
  }
  
  void update() {
    Iterator<Particle> particleIterator= particles.iterator();
    while(particleIterator.hasNext()) {
      Particle particle = particleIterator.next();
      // controlla l'età della particella. Se è troppo vecchia eliminala, altrimenti aggiornala
      // eliminala anche se è fuori dallo schermo
      if(particle.age > particle.liveDuration || !particle.isOnScreen()) {
        // la particella è vecchia
        particleIterator.remove();
      } else {
        // la particella è giovane
        particle.update();
      }
    }
  }
  
  PImage draw() {
    pGraphics.beginDraw();
    pGraphics.clear();
    for(Particle particle: particles) {     
      particle.draw();
    }
    pGraphics.endDraw();
    return pGraphics;
  }
  
  // crea l'array iniziale di particelle
  ArrayList<Particle> createParticles() {
    ArrayList<Particle> particles = new ArrayList<Particle>(this.particlesNumber);
    for(int i = 1; i <= this.particlesNumber; i++) {
      particles.add(createParticle());
    }
    return particles;
  }
  
  // crea una singola particella
  Particle createParticle() {
    Particle particle;
    PVector initialPosition = this.position.copy();
    PVector speed = getParticleSpeed();
    int lifeDuration = getLifeDuration();
    particle = new Particle(pGraphics, initialPosition, speed, gravity, color_, particleImage, lifeDuration);
    return particle;
  }
  
  PVector getParticleSpeed() {
    float speed = meanSpeed + randomGaussian()*sigmaSpeed;
    float angle = random(0, 2*PI);
    return new PVector(speed*cos(angle), speed*sin(angle));
  }
  
  int getLifeDuration() {
    return int(meanLive + randomGaussian()*sigmaLiveDuration);
  }
  
  PGraphics getPGraphics() {
    return pGraphics;
  }
}