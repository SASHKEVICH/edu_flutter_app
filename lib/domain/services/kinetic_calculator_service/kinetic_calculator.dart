class KineticCalculator {
  static KineticCalculator shared = KineticCalculator();

  double calculate(double weight, double speed) {
    return weight * speed * speed / 2;
  }
}