// ignore_for_file: file_names

class SearchModel {
  List<Searchitem>? searchitems;

  SearchModel({this.searchitems});

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        searchitems: (json['searchitems'] as List<dynamic>?)
            ?.map((e) => Searchitem.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'searchitems': searchitems?.map((e) => e.toJson()).toList(),
      };
}

class Searchitem {
  String? id;
  String? name;
  String? image;
  String? description;
  int? price;
  int? qty;
  String? category;
  int? v;

  Searchitem({
    this.id,
    this.name,
    this.image,
    this.description,
    this.price,
    this.qty,
    this.category,
    this.v,
  });

  factory Searchitem.fromJson(Map<String, dynamic> json) => Searchitem(
        id: json['_id'] as String?,
        name: json['name'] as String?,
        image: json['image'] as String?,
        description: json['description'] as String?,
        price: json['price'] as int?,
        qty: json['qty'] as int?,
        category: json['category'] as String?,
        v: json['__v'] as int?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'image': image,
        'description': description,
        'price': price,
        'qty': qty,
        'category': category,
        '__v': v,
      };
}
