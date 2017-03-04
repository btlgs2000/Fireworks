class PGraphicsPool {
  ArrayList<PGraphics> pGraphicsArray;
  
  // initialNumber è il numero di PGraphics inizialmente
  PGraphicsPool(int initialNumber) {
    pGraphicsArray = new ArrayList<PGraphics>(initialNumber);
    for(int i = 1; i <= initialNumber; i++) {
      pGraphicsArray.add(createGraphics(width, height, P2D));
    }
  }
  
  PGraphics get() {
    PGraphics p;
    
    if(!pGraphicsArray.isEmpty()) {
      // ci sono oggetti PGraphics disponibili
      println("get");
      p = pGraphicsArray.get(0);
      pGraphicsArray.remove(p);
    } else {
      // crea un nuovo oggetto PGraphics
      p = createGraphics(width, height, P2D);
    }
    
    return p;
  }
  
  void free(PGraphics pGraphics) {
    pGraphicsArray.add(pGraphics);
  }
}