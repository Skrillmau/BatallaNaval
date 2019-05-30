// clase barco con variables de posicion tamaño variable para una o dos pociciones
// posee metodos getter y setter y metodos para impactar casilla
class Barco {
  String pos1;
  String pos2;
  String cords;
  boolean impact1 = false;
  boolean impact2 = false;

  Barco() {;
    this.pos1 = "";
    this.pos2 = "";
  }

  public void setCoord1(String pos) {
    pos1 = pos;
  }

  public String getCord1() {
    return pos1;
  }

  public void setCoord2(String pos) {
    pos2 = pos;
  }

  public String getCord2() {
    return pos2;
  }

  public void setImpacto1(boolean impact) {
    impact1 = impact;
  }

  public boolean getImpacto1() {
    return impact1;
  }

  public void setImpacto2(boolean impact) {
    impact2 = impact;
  }

  public boolean getImpacto2() {
    return impact2;
  }

  public void setCoords(String cord) {
    cords = cord;
  }

  public String getCoords() {
    return (pos1+","+pos2);
  }
}
