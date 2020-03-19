//represents the x, y, and z positions of an object
public class TranslateVals {
  public float x;
  public float y;
  public float z;

  TranslateVals(float x, float y, float z) {
    this.x = x;
    this.y = y;
    this.z = z;
  }

  float getX() {
    return this.x;
  }

  float getY() {
    return this.y;
  }

  float getZ() {
    return this.z;
  }

  void incrementX(float add) {
    this.x = this.x + add;
  }

  void incrementY(float add) {
    this.y = this.y + add;
  }

  void incrementZ(float add) {
    this.z = this.z + add;
  }

  void setX(float num) {
    this.x = num;
  }

  void setY(float num) {
    this.y = num;
  }

  void setZ(float num) {
    this.z = num;
  }
}
