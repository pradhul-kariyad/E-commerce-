// ignore_for_file: no_leading_underscores_for_local_identifiers

class CategorizedProducts {
  
  List<Fasion>? fasion;
  List<Electronics>? electronics;
  List<Jwellery>? jwellery;
  List<Fancy>? fancy;

  CategorizedProducts(
      {this.fasion, this.electronics, this.jwellery, this.fancy});

  CategorizedProducts.fromJson(Map<String, dynamic> json) {
    if (json["fasion"] is List) {
      fasion = json["fasion"] == null
          ? null
          : (json["fasion"] as List).map((e) => Fasion.fromJson(e)).toList();
    }
    if (json["electronics"] is List) {
      electronics = json["electronics"] == null
          ? null
          : (json["electronics"] as List)
              .map((e) => Electronics.fromJson(e))
              .toList();
    }
    if (json["jwellery"] is List) {
      jwellery = json["jwellery"] == null
          ? null
          : (json["jwellery"] as List)
              .map((e) => Jwellery.fromJson(e))
              .toList();
    }
    if (json["fancy"] is List) {
      fancy = json["fancy"] == null
          ? null
          : (json["fancy"] as List).map((e) => Fancy.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (fasion != null) {
      _data["fasion"] = fasion?.map((e) => e.toJson()).toList();
    }
    if (electronics != null) {
      _data["electronics"] = electronics?.map((e) => e.toJson()).toList();
    }
    if (jwellery != null) {
      _data["jwellery"] = jwellery?.map((e) => e.toJson()).toList();
    }
    if (fancy != null) {
      _data["fancy"] = fancy?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Fancy {
  String? id;
  String? name;
  String? image;
  String? description;
  int? price;
  int? qty;
  String? category;
  int? v;

  Fancy(
      {this.id,
      this.name,
      this.image,
      this.description,
      this.price,
      this.qty,
      this.category,
      this.v});

  Fancy.fromJson(Map<String, dynamic> json) {
    if (json["_id"] is String) {
      id = json["_id"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["image"] is String) {
      image = json["image"];
    }
    if (json["description"] is String) {
      description = json["description"];
    }
    if (json["price"] is int) {
      price = json["price"];
    }
    if (json["qty"] is int) {
      qty = json["qty"];
    }
    if (json["category"] is String) {
      category = json["category"];
    }
    if (json["__v"] is int) {
      v = json["__v"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    _data["name"] = name;
    _data["image"] = image;
    _data["description"] = description;
    _data["price"] = price;
    _data["qty"] = qty;
    _data["category"] = category;
    _data["__v"] = v;
    return _data;
  }
}

class Jwellery {
  String? id;
  String? name;
  String? image;
  String? description;
  int? price;
  int? qty;
  String? category;
  int? v;

  Jwellery(
      {this.id,
      this.name,
      this.image,
      this.description,
      this.price,
      this.qty,
      this.category,
      this.v});

  Jwellery.fromJson(Map<String, dynamic> json) {
    if (json["_id"] is String) {
      id = json["_id"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["image"] is String) {
      image = json["image"];
    }
    if (json["description"] is String) {
      description = json["description"];
    }
    if (json["price"] is int) {
      price = json["price"];
    }
    if (json["qty"] is int) {
      qty = json["qty"];
    }
    if (json["category"] is String) {
      category = json["category"];
    }
    if (json["__v"] is int) {
      v = json["__v"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    _data["name"] = name;
    _data["image"] = image;
    _data["description"] = description;
    _data["price"] = price;
    _data["qty"] = qty;
    _data["category"] = category;
    _data["__v"] = v;
    return _data;
  }
}

class Electronics {
  String? id;
  String? name;
  String? image;
  String? description;
  int? price;
  int? qty;
  String? category;
  int? v;

  Electronics(
      {this.id,
      this.name,
      this.image,
      this.description,
      this.price,
      this.qty,
      this.category,
      this.v});

  Electronics.fromJson(Map<String, dynamic> json) {
    if (json["_id"] is String) {
      id = json["_id"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["image"] is String) {
      image = json["image"];
    }
    if (json["description"] is String) {
      description = json["description"];
    }
    if (json["price"] is int) {
      price = json["price"];
    }
    if (json["qty"] is int) {
      qty = json["qty"];
    }
    if (json["category"] is String) {
      category = json["category"];
    }
    if (json["__v"] is int) {
      v = json["__v"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    _data["name"] = name;
    _data["image"] = image;
    _data["description"] = description;
    _data["price"] = price;
    _data["qty"] = qty;
    _data["category"] = category;
    _data["__v"] = v;
    return _data;
  }
}

class Fasion {
  String? id;
  String? name;
  String? image;
  String? description;
  int? price;
  int? qty;
  String? category;
  int? v;

  Fasion(
      {this.id,
      this.name,
      this.image,
      this.description,
      this.price,
      this.qty,
      this.category,
      this.v});

  Fasion.fromJson(Map<String, dynamic> json) {
    if (json["_id"] is String) {
      id = json["_id"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["image"] is String) {
      image = json["image"];
    }
    if (json["description"] is String) {
      description = json["description"];
    }
    if (json["price"] is int) {
      price = json["price"];
    }
    if (json["qty"] is int) {
      qty = json["qty"];
    }
    if (json["category"] is String) {
      category = json["category"];
    }
    if (json["__v"] is int) {
      v = json["__v"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    _data["name"] = name;
    _data["image"] = image;
    _data["description"] = description;
    _data["price"] = price;
    _data["qty"] = qty;
    _data["category"] = category;
    _data["__v"] = v;
    return _data;
  }
}
