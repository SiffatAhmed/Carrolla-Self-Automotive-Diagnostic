class UpdateRepairEventRec {
  var engineOilChanged;
  var breakOilChanged;
  var oilFiltersChanged;
  var airFiltersChanged;
  var sparkPlugsChanged;
  var completeMaintenance;
  UpdateRepairEventRec({
    this.engineOilChanged = 0,
    this.breakOilChanged = 0,
    this.oilFiltersChanged = 0,
    this.airFiltersChanged = 0,
    this.sparkPlugsChanged = 0,
    this.completeMaintenance = 0,
  });
  void setEngineOil(int number) {
    this.engineOilChanged = number;
  }

  void setBreakOil(int number) {
    this.breakOilChanged = number;
  }

  void setoilFiltersChanged(int number) {
    this.oilFiltersChanged = number;
  }

  void airFilters(int number) {
    this.oilFiltersChanged = number;
  }

  void sparkPlugs(int number) {
    this.sparkPlugsChanged = number;
  }

  void setMajorMaintenance(int number) {
    this.completeMaintenance = number;
  }

  // UpdateRepairEventRec.saveToJSON() {
  //   Map<String, dynamic> toJSON() => {
  //         'engineOilChanged': engineOilChanged,
  //         'breakOilChanged': breakOilChanged,
  //         'oilFiltersChanged': oilFiltersChanged,
  //         'airFiltersChanged': airFiltersChanged,
  //         'sparkPlugsChanged': sparkPlugsChanged,
  //         'completeMaintenance': completeMaintenance,
  //       };
  // }
}
