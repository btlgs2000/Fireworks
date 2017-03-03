PImage createParticleShape(int radius) {
  
  // l'altezza e la larghezza sono di un numero dispari di pixel, per avere un pixel centrale
  int width_ = 2*radius+1;
  int height_ = 2*radius+1;
  PImage particleImage = createImage(width_, height_, ARGB);
  
  // centro dell'immagine
  PVector center = new PVector(radius, radius);
  
  // comincia la costruzione dell'immagine
  particleImage.loadPixels();
  
  for(int i = 0; i < particleImage.pixels.length; i++) {
    PVector point = imageCoordinatesFromIndex(i, width_, height_);
    float distance = PVector.sub(point, center).mag();
    particleImage.pixels[i] = getColorByDistanceFromCenter(distance, radius);
  }
  
  particleImage.updatePixels();
  
  return particleImage;
}

PVector imageCoordinatesFromIndex(int index, int width_, int height_) {
  int x = index % width_;
  int y = index / width_;
  return new PVector(x, y);
}

// ritorna il colore in base alla distanza dal centro e al raggio della particella
int getColorByDistanceFromCenter(float distanceFromCenter, int radius) {
  int alpha = int(255 - (distanceFromCenter/radius)*255);
  return color(255, 255, 255, alpha);
}