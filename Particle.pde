class Particle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  color tint;
  int alpha = 255;
  PImage particleImage;
  int liveDuration;
  int age = 0;
  
  Particle(PVector initialPosition, PVector initialVelocity, PVector initialAcceleration, color tint, PImage particleImage, int liveDuration){
    this.position = initialPosition;
    this.velocity = initialVelocity;
    this.acceleration = initialAcceleration;
    this.tint = tint;
    this.particleImage = particleImage;
    this.liveDuration = liveDuration;
  }
  
  // aggiorna le caratteristiche della particella
  void update(){
    position.add(velocity);
    velocity.add(acceleration);
    age++;
  }
  
  // disegna la particella
  void draw(){
    imageMode(CENTER);
    alpha = int(255 - 255.*float(age)/liveDuration);
    tint(red(tint), green(tint), blue(tint), alpha);
    image(particleImage, position.x, position.y);
  }
  
  int getAge() {
    return this.age;
  }
  
  int getLiveDuration() {
    return this.liveDuration;
  }
}