ArrayList<Vertex> vertices = new ArrayList<Vertex>();
final int DEGREES=360;
final int REVOLUTIONS=150;
final float angle=DEGREES/REVOLUTIONS;
int WARNINGCLICK=2;
int SETREVOLUTION=1;
int DEFAULTDRAW=0;
int REVOLUTVIEW=3;
boolean help=false;
int mode=DEFAULTDRAW;
boolean lastRev=false;

String helpText="¡Transforma un trazo 2D a un sólido 3D!";
String help2="- Arrastra el ratón para trazar una línea";
String help3="- Pulsa espacio para convertirlo en sólido";
String help4="- Pulsa R para resetear el dibujo\n";

PShape path; // Shape of the line drawed by user
PShape solidSurface; // Shape of the surface of revolution

void setup(){
  size(900,900, P3D);
  background(0);
  fill(255);
  
}

void defScreen(){
  background(255);
  fill(0);
  textSize(20);
  line(width/2,0,width/2,height);
  textAlign(LEFT);
  text(helpText, 20,20);
  rectMode(CENTER);
  noFill();
  stroke(0);
  strokeWeight(2);
  rect(70,750,100,50);
  textAlign(CENTER);
  text("Ayuda", 70,755);
  if(help) showHelp();
}

void showProfile(){
  fill(0);
  path=createShape();
  path.beginShape();
  path.noFill();
  path.stroke(0);
  path.strokeWeight(4);
  for(int i=0; i<vertices.size();i++){
    path.vertex(vertices.get(i).posX, vertices.get(i).posY);
  }
  path.endShape();
  shape(path);
}

void showHelp(){
  textAlign(LEFT);
  fill(255,165,0);
  textSize(20);
  text(help2,20,795);
  text(help3,20,835);
  text(help4,20,875);
}

void draw(){
  if(mode==WARNINGCLICK){
    defScreen();
    textAlign(LEFT);
    fill(0);
    text("Arrastra en la parte derecha de la pantalla", 10,height/2);
    showProfile();
  }
   if (mode==DEFAULTDRAW){
       //lastRev=false;
      defScreen();
      showProfile();
   }
    if(mode == SETREVOLUTION){
      recenterProfile();
      solidSurface=createShape();
      solidSurface.beginShape(TRIANGLE_STRIP);
      solidSurface.fill(100);
      solidSurface.stroke(128,0,0);      
      solidSurface.strokeWeight(1);
      revolve(path);
      solidSurface.endShape();
      mode=REVOLUTVIEW;
    }
    
    if(mode==REVOLUTVIEW){
      defScreen();
      translate(width / 2, height / 2);
      shape(solidSurface);
      //lastRev=true;
    }
    
    //if(help==true){
    //  showHelp();
    //}
}
// Function that translates the object coodinates to the center
void recenterProfile(){
  for(int i=0;i<path.getVertexCount();i++){
    PVector point=path.getVertex(i);
    // Setting line as center
    point.x -= width/2;
    point.y -= height/2;  
    path.setVertex(i,point.x,point.y,point.z);
  }
}

// Function that takes care of rotating the vertices along the y-axis and connecting all of them
void revolve(PShape profile){
    for (int i=0; i<profile.getVertexCount()-1;i++){
      PVector v = profile.getVertex(i);
      PVector v2 = profile.getVertex(i+1);
      for (float theta=angle;theta<DEGREES;theta+=angle){
        
        solidSurface.vertex(v.x,v.y,v.z);
        float x1=v.x;
        float z1=v.z;
        v.x=x1*(float)Math.cos(theta)-z1*(float)Math.sin(theta);
        v.z=x1*(float)Math.sin(theta)+z1*(float)Math.cos(theta);
        solidSurface.vertex(v.x,v.y,v.z);
        
        solidSurface.vertex(v2.x,v2.y,v2.z);
        float x2=v2.x;
        float z2=v2.z;
        v2.x=x2*(float)Math.cos(theta)-z2*(float)Math.sin(theta);
        v2.z=x2*(float)Math.sin(theta)+z2*(float)Math.cos(theta);
        solidSurface.vertex(v2.x,v2.y,v2.z);
        
      }
    }
  }
  
 void resetToDraw(){
    vertices.clear();
    mode=DEFAULTDRAW;    
 }

void keyPressed(){
  if(key=='r'){
    resetToDraw();
  } 
  if(key==' ' && (mode!=REVOLUTVIEW && mode!=SETREVOLUTION) && path.getVertexCount()>1){
    help=false;
    mode=SETREVOLUTION;
  }
}

void mouseClicked(){
  if(mouseX<=120 && mouseX>=20 && mouseY>=725 && mouseY<=775){
    if(help) help=false;
    else help=true;
  }

}

void mouseDragged() {
    if(mouseX>=width/2 && mouseX<width){
      vertices.add(new Vertex(mouseX,mouseY));
      mode=DEFAULTDRAW;
    }else if(mouseX<width/2){
      mode=WARNINGCLICK;
    }
}
