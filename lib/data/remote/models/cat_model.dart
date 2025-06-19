class CatModel {
  String? created_at;
  String? id;
  String? name;
  String? status;
  String? updated_at;

  CatModel({
    required this.name,
    required this.status,
    required this.updated_at,
    required this.created_at,
    required this.id,
  });

  factory CatModel.fromJson(Map<String, dynamic> json) =>
      CatModel(
        name: json['name'],
        status: json['status'],
        updated_at: json['updated_at'],
        created_at: json['created_at'],
        id: json['id'],
      );
}

class CatDataModel {
  String? message;
  bool? status;
  List<CatModel>? data;

  CatDataModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory CatDataModel.fromJson(Map<String, dynamic> json) =>
      CatDataModel(
          status: json['status'],
          message: json['message'],
          data: List<CatModel>.from(json['data'].map((e) => CatModel.fromJson(e))),
      );
}
