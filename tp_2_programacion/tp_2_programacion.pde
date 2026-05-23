int pantalla= 0; 
int reinicioTiempo = 0;
float textoX= -300;
float textoY = 500;
float transparencia = 0;
float tamañoTexto = 1;
float shakeX = 0;
PFont miFuente; 
PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;


void setup() {
  size ( 640,480);  
  miFuente= loadFont ("Impact-48.vlw");
  textFont (miFuente); 
  
  img1= loadImage("logo.jpg");
  img2= loadImage("CJ.jpg");
  img3= loadImage("pandilla.jpg");
  img4= loadImage("mapa.jpg");
  img5= loadImage("portada.jpg");
}

void draw() {
  background(0,0,0);
  
  
  //PRIMER PANTALLA
  
   if (pantalla ==0) {
     textoX= textoX +5; 
  if(textoX>20) {
    textoX=20;
  }
    
    textoY = textoY -2;
    if(textoY < 430) {
      textoY = 430;
}
  
    image (img1, 0,0, width, 360);
    fill (255);
    textSize(40);
    text( "GTA San Andreas", textoX, 390);
    
    textSize(18);
    text(" Videojuego de accion y mundo abierto creado por Rockstar Games", 100, textoY); 
  
  }
  
  //SEGUNDA PANTALLA
  
  if( frameCount - reinicioTiempo >=181 && pantalla== 0) {
      pantalla= 1;
      textoX = 700;
     
     }

  
  
  if(pantalla==1) {
    textoX = textoX -5;
    if(textoX < 400) {
      textoX = 400;
      
     

}
   
    image (img2, 0, 0, width,360);
    fill(0);
    rect (0,360,width,120);
    fill(255);
    textSize(28);
    text("Carl Johnson", textoX, 390);
    textSize(16);
    text("La historia sigue a Carl Johnson, conocido como CJ\n quien regresa a Los Santos tras la muerte de su madre.", textoX -280 ,430);
   
  }
  
  //  TERCER PANTALLA
  
  
  if( frameCount - reinicioTiempo >= 361 && pantalla ==1) {
    pantalla= 2; 
    textoX= -300;
    transparencia=0; 
  }
  
  if (pantalla == 2) {
    
    textoX = textoX +7;
    if(textoX > 20) {
      textoX = 20;
    }
   
   transparencia = transparencia +4;
    if(transparencia > 255) {
      transparencia = 255;
}
    image(img3, 0, 0, width, 360);
    fill(0);
    rect(0, 360, width, 120);
    fill(255, transparencia);
    textSize(28);
    text("Grove Street", textoX, 390);
    textSize(16);
    text("CJ intenta recuperar el control de Grove Street\n y enfrentarse a bandas rivales y policías corruptos", 20, 430);
}


// CUARTA PANTALLA


 if( frameCount- reinicioTiempo >= 540 && pantalla==2) {
    pantalla= 3; 
    textoX= 700;
    tamañoTexto= 1; 
  }
  
   if(pantalla==3) {
    textoX = textoX -5;
    if(textoX < 400) {
      textoX = 400;
    }
      
      tamañoTexto = tamañoTexto +0.3;
      if(tamañoTexto > 16) {
        tamañoTexto = 16;
}

  
     
      image(img4, 0, 0, width, 360);
      fill(0);
      rect(0, 360, width, 120);
      fill(255);
      textSize(28);
      text("Mundo Abierto", textoX, 390);
      textSize(tamañoTexto);
      text("El juego permite recorrer ciudades, conducir vehículos\n y completar misiones en un enorme mundo abierto", 20, 430);
}

// QUINTA PANTALLA


   if( frameCount- reinicioTiempo >= 721 && pantalla == 3) {
    pantalla= 4; 
    textoX= -300;
    shakeX= 0;
  }
  
  if (pantalla == 4) {
    
      shakeX = random(-1,1);
    textoX = textoX +5;
    if(textoX > 20) {
      textoX = 20;
   
     
    }
  
    image(img5, 0, 0, width, 360);
    fill(0);
    rect(0, 360, width, 120);
    fill(255);
    textSize(28);
    text("Un Juego Historico", textoX, 390);
    textSize(16);
    text("GTA San Andreas se convirtió en uno de los videojuegos\n más famosos e influyentes de la historia.", 20 + shakeX, 430);
    
    rect(490, 430, 140, 40);
    fill(0);
    text("REINICIAR", 510, 455);
}
}
void mousePressed() {
  if (pantalla == 4) {

    if (mouseX > 490 && mouseX < 630 &&
        mouseY > 430 && mouseY < 470) {

      pantalla = 0;
      
      reinicioTiempo = frameCount;

      textoX = -300;
      textoY = 500;
      transparencia = 0;
      tamañoTexto = 1;
      shakeX = 0;
        }
  }
}
