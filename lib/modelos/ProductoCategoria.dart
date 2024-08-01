class ProductoCategory {
  int? idProductCategory;
  String? name;

  ProductoCategory({this.idProductCategory, this.name});

  ProductoCategory.fromJson(Map<String, dynamic> json) {
    idProductCategory = json['IdProductCategory'];
    name = json['Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IdProductCategory'] = this.idProductCategory;
    data['Name'] = this.name;
    return data;
  }
}