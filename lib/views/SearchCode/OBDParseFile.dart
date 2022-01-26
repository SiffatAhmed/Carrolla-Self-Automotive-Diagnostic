import 'dart:convert';

Parser parserFromJson(String str) => Parser.fromJson(json.decode(str));

String parserToJson(Parser data) => json.encode(data.toJson());

class Parser {
  Parser({
    this.codes,
  });

  List<Code> codes;

  String search(String inputtedCode) {
    int index =
        codes.indexWhere((inputtedCode) => codes.contains(inputtedCode));
    Code temp = codes.elementAt(index);
    return temp.description;
  }

  factory Parser.fromJson(Map<String, dynamic> json) => Parser(
        codes: List<Code>.from(json["codes"].map((x) => Code.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "codes": List<dynamic>.from(codes.map((x) => x.toJson())),
      };
}

class Code {
  Code({
    this.code,
    this.description,
  });

  String code;
  String description;

  factory Code.fromJson(Map<String, dynamic> json) => Code(
        code: json["code"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "description": description,
      };
}
