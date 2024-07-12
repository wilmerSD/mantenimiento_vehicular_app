class ReponseListProfileComboBox {
  List<DatumSelect2Combo>? data;

  ReponseListProfileComboBox({
    this.data,
  });

  factory ReponseListProfileComboBox.fromJson(Map<String, dynamic> json) =>
      ReponseListProfileComboBox(
        data: List<DatumSelect2Combo>.from(
            json["data"].map((x) => DatumSelect2Combo.fromJson(x))),
      );
}
class DatumSelect2Combo {
    int? value;
    String? text;
    int? additionalValue1;

    DatumSelect2Combo({
        this.value,
        this.text,
        this.additionalValue1,
    });

    factory DatumSelect2Combo.fromJson(Map<String, dynamic> json) => DatumSelect2Combo(
        value: json["value"],
        text: json["text"],
        additionalValue1: json["additionalValue1"],
    );

}