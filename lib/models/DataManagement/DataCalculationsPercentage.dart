class DataCalculationsPercentage {
  double totalDistanceDrivenPercent = 0;
  double engineOilKMPercent = 0;
  double breakOilChangeKMPercent = 0;
  double wheelAlignmentKMPercent = 0;
  DataCalculationsPercentage(totalDistanceDrivenPercent, engineOilKMPercent,
      breakOilChangeKMPercent, wheelAlignmentKMPercent) {
    this.totalDistanceDrivenPercent = totalDist(totalDistanceDrivenPercent);
    this.engineOilKMPercent = engOil(engineOilKMPercent);
    this.breakOilChangeKMPercent = breakOil(breakOilChangeKMPercent);
    this.wheelAlignmentKMPercent = wheelAlign(wheelAlignmentKMPercent);
  }

  double totalDist(double totalDist) {
    return (totalDist % 50000) / 50000;
  }

  double engOil(double engOil) {
    return 1 - (engOil / 5000);
  }

  double breakOil(double breakOil) {
    return 1 - (breakOil / 20000);
  }

  double wheelAlign(double wheelAlign) {
    return 1 - (wheelAlign / 5000);
  }
}
