// clase de disparo contiene la coordenada 'x' y 'y'
// tiene variable del estado del disparo si impacto en barco o no para mostrar en la matriz de cada jguador
class Disparo {

  String state;
  String coords;

  Disparo(String status, String cords) {
    this.state = status;
    this.coords = cords;
  }

  public void setStatus(String stat) {
    state = stat;
  }
  public String getStatus() {
    return state;
  }
  public void setDisparo(String cord) {
    coords = cord;
  }
  public String getDisparo() {
    return coords;
  }
}
