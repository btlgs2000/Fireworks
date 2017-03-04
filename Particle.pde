class Particle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  color tint;
  int alpha = 255;
  PImage particleImage;
  int liveDuration;
  int age = 0;
  // oggetto pGraphics sul quale viene disegnata la particella
  PGraphics pGraphics;
  
  Particle(PGraphics pGraphics, PVector initialPosition, PVector initialVelocity, PVector initialAcceleration, color tint, PImage particleImage, int liveDuration){
    this.position = initialPosition;
    this.velocity = initialVelocity;
    this.acceleration = initialAcceleration;
    this.tint = tint;
    this.particleImage = particleImage;
    this.liveDuration = liveDuration;
    this.pGraphics = pGraphics;
  }
  
  // aggiorna le caratteristiche della particella
  void update(){
    position.add(velocity);
    velocity.add(acceleration);
    age++;
  }
  
  // disegna la particella
  void draw(){
    pGraphics.imageMode(CENTER);
    alpha = int(255 - 255.*float(age)/liveDuration);
    pGraphics.tint(red(tint), green(tint), blue(tint), alpha);
    pGraphics.image(particleImage, position.x, position.y);
  }
  
  int getAge() {
    return this.age;
  }
  
  int getLiveDuration() {
    return this.liveDuration;
  }
  
  PVector getPosition() {
    return position;
  }
  
  boolean isOnScreen() {
    return position.x >= -particleRadius && position.x <= pGraphics.width+particleRadius &&
      position.y >= -particleRadius && position.y <= pGraphics.height+particleRadius;
  }
}