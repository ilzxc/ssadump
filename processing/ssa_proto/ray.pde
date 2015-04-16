class Ray {
  float azimuth, angle;
  final float radius = 300.f;
  PVector ray;
  color ray_color;
  
  Ray(float azi, float ang) {
    azimuth = radians(azi - 90.);
    angle   = radians(ang);
    computeRay();
    ray_color = color(255, 0, 0);
  }
  
  void setColor(int r, int g, int b) {
    ray_color = color(r, g, b);
  }
  
  void computeRay() {
    ray = new PVector( radius * cos(angle) * cos(azimuth),
                       radius * cos(angle) * sin(azimuth),
                       radius * sin(angle) );
  }
  
  void moveBy(float azi_off, float ang_off) {
    azimuth += radians(azi_off);
    angle   += radians(ang_off);
    computeRay();
  }
  
  void draw() {
    stroke(ray_color);
    strokeWeight(5);
    noFill();
    line(0, 0, 0, ray.x, ray.y, ray.z);
  }
  
}
