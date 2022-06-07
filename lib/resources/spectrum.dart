import 'dart:math';

class RandomGenerator {
  static final Random randomGenerator = Random();

  static int getRandomInt(int min, int max) {
    return min + randomGenerator.nextInt(max - min);
  }

  static double getRandomDouble(double min, double max) {
    return min + randomGenerator.nextDouble() * (max - min);
  }
}

class IntegerSpectrum {
  int min;
  int max;

  IntegerSpectrum(this.min, this.max);

  int getRandomFromSpectrum() {
    return RandomGenerator.getRandomInt(min, max);
  }
}

class DoubleSpectrum {
  double min;
  double max;

  DoubleSpectrum(this.min, this.max);

  double getRandomFromSpectrum() {
    return RandomGenerator.getRandomDouble(min, max);
  }
}
