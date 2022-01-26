class DataCalculations {
  double distanceSinceDTC = 0;
  double totalDistanceDriven = 0;
  double engineOilKM = 0;
  double breakOilChangeKM = 0;
  double wheelAlignmentKM = 0;
  int timeSinceDTC = 0;
  DataCalculations(double distanceSince, double totalDistanceDriven) {
    distanceSinceDTC = distanceSince;
    this.totalDistanceDriven = totalDistance(totalDistanceDriven);
    engineOilKM = engineOil();
    breakOilChangeKM = breakOil();
    wheelAlignmentKM = wheelAlignment();
    timeSinceDTC = timeSinceDTCCodesCleared();
  }

  double totalDistance(total) {
    return (total += distanceSinceDTC);
  }

  double engineOil() {
    return (5000 - (distanceSinceDTC % 5000));
  }

  double breakOil() {
    return (20000 - (distanceSinceDTC % 20000));
  }

  double wheelAlignment() {
    return (5000 - (distanceSinceDTC % 5000));
  }

  int timeSinceDTCCodesCleared() {
    return DateTime.now()
        .subtract(Duration(days: 20))
        .difference(DateTime.now())
        .inDays
        .abs();
  }
}
