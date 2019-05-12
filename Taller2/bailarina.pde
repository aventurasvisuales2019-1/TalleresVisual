
PShape s, s2;
int desplsamientoConteo = 0;
boolean Subiendo = true;
float velocidadSubidaBajada = 0.2;
float velocidadRotacion = 0.11;

void drawBailarina() {
  background(204);
  //Renderizar modelos
  shape(s, 500, 610, 400, 400);
  shape(s2, 500, 360, 400, 400);
  //Subir y bajar modelos
  if (Subiendo) {
    s.translate(0, -velocidadSubidaBajada);
    s2.translate(0, velocidadSubidaBajada);
  } else {
    s.translate(0, velocidadSubidaBajada);
    s2.translate(0, -velocidadSubidaBajada);
  }
  if (desplsamientoConteo > 20) {
    desplsamientoConteo = 0;
    Subiendo = !Subiendo;
  }
  desplsamientoConteo++;
  //Hacer girar los modelos
  s.rotateY(velocidadRotacion);   
  s2.rotateY(-velocidadRotacion);
}
