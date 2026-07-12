https://youtu.be/E6_8oVSXMlA
PImage fotoOriginal; //guardo la imagen
int divisiones = 22; // 22x22

float inclinacionOriginal = 4.5; // inclinacion mas parecida
float gradoInclinacion; // varia con el mouse       
float temblequeX = 0.0;   

void setup() {
  size(800, 400); 
  
  fotoOriginal = loadImage("18.jpg"); 
  
  gradoInclinacion = inclinacionOriginal; // para q ya  aparezca inclinado 4.3
}


void draw() {
 
  background(185, 138, 77); // fondo dorado
  image(fotoOriginal, 0, 0, 400, 400); 
  
  
  if (mouseX >= 400 && mouseX <= 800) {
    gradoInclinacion = map(mouseX, 400, 800, 0.0, 7.0);  //map cambia los pixeles a num mas pequeños
  }
 
  pushMatrix(); //guardo el estado de la pantalla 
  translate(400, 0); 
  
  //funcion prop
  
  dibujarRombos(divisiones, divisiones, gradoInclinacion);
  popMatrix(); //rastauro la pantalla a la posicion original
}

//composicion
void dibujarRombos(int f, int c, float deformacion) {
  float anchoModulo = 400.0 / f; // .0 xq float f:22
  float mitadGrilla = f / 2.0; 
 
 for (int i = 0; i < f; i++) { //filas. i=0 arranca en la fila 0, i< f: (22) mientras i sea menor a 22 segui. osea de 0 a 21. i++: sumarle 1 a variable i para cuando termina el renglon pase al siguiente
 
 for (int j = 0; j < c; j++) { // columnas
      
      
      int numAnillo = buscarCapa(i, j, f); //pintar
      
      
      float tono = 0;
      if (numAnillo <= 1) {
        tono = 24;  //egro
      } else if (numAnillo >= 2 && numAnillo <= 3) {
        tono = 130;  //gris
      } else if (numAnillo >= 4 && numAnillo <= 6) {
        tono = 252; //blanco
      } else if (numAnillo >= 7 && numAnillo <= 8) {
        tono = 85; //gris 
      } else {
        tono = 24; //negro
      }
      
      
      
      //inter
      float posX = (j + 0.5) * anchoModulo;  // mueve el punto de origen para que se expanda desde el centro 
      float posY = (i + 0.5) * anchoModulo;
     
      float distanciaMouse = dist(mouseX - 400, mouseY, posX, posY);
      float multiplicadorLupa = 1.0;
      if (distanciaMouse < 60) {
        multiplicadorLupa = map(distanciaMouse, 0, 60, 1.5, 1.0);
      }
      
      
      float baseW = anchoModulo * 0.45;
      float baseH = anchoModulo * 0.45;
      float ladoX = (j + 0.5 < mitadGrilla) ? -1.0 : 1.0;
      float ladoY = (i + 0.5 < mitadGrilla) ? -1.0 : 1.0;
      
      //traduje la posición a radianes en rX y rY para poder usar la función seno (sin) --->no usan grados comunes
      float rX = ((float)j / (f - 1)) * PI;
      float rY = ((float)i / (c - 1)) * PI;
      float curva = sin(rX) * sin(rY) * deformacion * multiplicadorLupa;
      float desplazamiento = -curva * (ladoX * ladoY);
      
     
      float randomX = random(-temblequeX, temblequeX);
      float randomY = random(-temblequeX, temblequeX);
      float anchoFinal = baseW - (abs(desplazamiento) * 0.15);
      
     
      stroke(185, 138, 77); 
      strokeWeight(0.6);
      fill(tono);
      pushMatrix();
      translate(posX + randomX, posY + randomY); 
      rotate(randomX * 0.05); 
      
      
      beginShape(); // creo el "rombo"
      vertex(-anchoFinal + desplazamiento, -baseH); 
      vertex(anchoFinal + desplazamiento, -baseH);  
      vertex(anchoFinal - desplazamiento, baseH);   
      vertex(-anchoFinal - desplazamiento, baseH);  
      endShape(CLOSE);
      
      popMatrix();
    }
  }
}

  int buscarCapa(int fila, int col, int total) {
  
  int centro = total / 2; 
  int distFila = abs(fila - centro); // cant de casilleros de distancia esta la filarespecto al centro. abs:Valorabsoluto, num negativo lo deja en positivo
  if (fila >= centro) distFila = abs(fila - (centro - 1)); // el centro es la linea entre la fila 10 y 11, parra q mida la misma distacia de ambos laods 
  int distCol = abs(col - centro);
  if (col >= centro) distCol = abs(col - (centro - 1));
  int perimetro = max(distFila, distCol);  // max copara dos valores y se queda con el mas grande. 
  return perimetro;
}

// interaccion n n n n nnn nn nn 
void keyPressed() {
  // Con espacio vibra
  if (key == ' ') {
    temblequeX = 3.5; 
  }
  
  // reinicio
  if (key == 'r' || key == 'R' || keyCode == ENTER) {
    gradoInclinacion = inclinacionOriginal;
    temblequeX = 0.0;
  }
}
 
void keyReleased() {
  if (key == ' ') {
    temblequeX = 0.0;
  }
}
