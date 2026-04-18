PImage arco;

void setup() {
  size(800, 400);
arco= loadImage ("arco.jpg");
}
void draw() {
  
background(200, 220, 255); // cielo
image (arco, 0, 0, 400, 400);
  // piso
  fill(180);
  rect(400, 300, 400, 100);

  //  cuerpo
  fill(220, 220, 220);
  rect(500, 100, 200, 200); // bloque 
  
  //hueco
  fill( 200, 220, 255) ;
  rect(550, 200, 100, 100); // hueco rectangular

  
  
   // columnas laterales
  fill(200);
  rect(500, 100, 40, 200);
  rect(660, 100, 40, 200);

  

  // PARTE SUPERIOR
  fill(200);
  rect(500, 70, 200, 40); // techo

  //  DETALLES SIMPLES 
  fill(180);
  rect(540, 140, 40, 40); // detalle izquierdo
  rect(620, 140, 40, 40); // detalle derecho
}
