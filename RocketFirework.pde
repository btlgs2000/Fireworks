class RocketFirework extends Firework{
  PVector initialPosition;
  PVector destination;
  PImage rocketShape;
  color rocketColor;
  PImage particleImage;
  int particlesNumber;
  color color_;
  float meanSpeed;
  float sigmaSpeed;
  int meanLive;
  float sigmaLiveDuration;
  boolean randomColor;
  boolean isExploded = false;
  Particle rocket;
  int rocketParticleDuration = 10000;
  Firework firework;
  
  RocketFirework(PVector initialPosition, PVector destination, PImage rocketShape, color rocketColor, PImage particleImage, int particlesNumber, color color_, float meanSpeed, 
    float sigmaSpeed, int meanLive, float sigmaLiveDuration, boolean randomColor){
      super();
    this.initialPosition = initialPosition;
    this.destination = destination;
    this.rocketShape = rocketShape;
    this.rocketColor = rocketColor;
    this.particleImage = particleImage;
    this.particlesNumber = particlesNumber;
    this.color_ = color_;
    this.meanSpeed = meanSpeed;
    this.sigmaSpeed = sigmaSpeed;
    this.meanLive = meanLive;
    this.sigmaLiveDuration = sigmaLiveDuration;
    this.randomColor = randomColor;
    
    rocket = new Particle(initialPosition, PVector.mult(PVector.sub(destination,initialPosition), 0.01), gravity, rocketColor, rocketShape, rocketParticleDuration);
  }
  
  int getAliveParticlesNumber() {
    if (!isExploded) {
      return particlesNumber;
    } else {
      return firework.getAliveParticlesNumber();
    }
  }
  
  void update() {
    if (!isExploded) {
      rocket.update();
      checkExplosion();
    } else {
      firework.update();
    }    
  }
  
  void draw() {
    if (!isExploded) {
      rocket.draw();
    } else {
      firework.draw();
    }
  }
  
  void checkExplosion() {
    if(rocket.velocity.y >= 0 || rocket.position.y <= destination.y){
      firework = new Firework(particleImage, rocket.position.copy(), particlesNumber, color_, meanSpeed, sigmaSpeed, meanLive, sigmaLiveDuration, randomColor);
      isExploded = true;
    }
  }
}