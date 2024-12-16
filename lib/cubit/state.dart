class InvoiceState {
  final bool haedproductgrid;
  final bool calculator;
  final bool settingMultiablePayment;
  final bool plutogridwidget;

  InvoiceState(
      {this.calculator = false,
      this.haedproductgrid = false,
      this.settingMultiablePayment = false,
      this.plutogridwidget = false});

  InvoiceState copyWith({
    bool? calculator,
    bool? haedproductgrid,
    bool? settingMultiablePayment,
    bool? plutogridwidget,
  }) {
    return InvoiceState(
      calculator: calculator ?? this.calculator,
      haedproductgrid: haedproductgrid ?? this.haedproductgrid,
      settingMultiablePayment:
          settingMultiablePayment ?? this.settingMultiablePayment,
      plutogridwidget: plutogridwidget ?? this.plutogridwidget,
    );
  }
}
