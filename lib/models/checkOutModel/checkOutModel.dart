// ignore_for_file: unnecessary_new, prefer_collection_literals, unnecessary_this, unnecessary_question_mark, prefer_void_to_null

class CheckOutModel {
  Cart? cart;
  int? totalamount;
  int? count;

  CheckOutModel({this.cart, this.totalamount, this.count});

  CheckOutModel.fromJson(Map<String, dynamic> json) {
    cart = json['cart'] != null ? new Cart.fromJson(json['cart']) : null;
    totalamount = json['totalamount'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cart != null) {
      data['cart'] = this.cart!.toJson();
    }
    data['totalamount'] = this.totalamount;
    data['count'] = this.count;
    return data;
  }
}

class Cart {
  String? sId;
  String? user;
  List<Items>? items;
  int? totalPrice;
  Null? coupencode;
  Null? discount;
  Null? discountprice;
  int? iV;

  Cart(
      {this.sId,
      this.user,
      this.items,
      this.totalPrice,
      this.coupencode,
      this.discount,
      this.discountprice,
      this.iV});

  Cart.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    totalPrice = json['totalPrice'];
    coupencode = json['coupencode'];
    discount = json['discount'];
    discountprice = json['discountprice'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['user'] = this.user;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['totalPrice'] = this.totalPrice;
    data['coupencode'] = this.coupencode;
    data['discount'] = this.discount;
    data['discountprice'] = this.discountprice;
    data['__v'] = this.iV;
    return data;
  }
}

class Items {
  Product? product;
  int? quantity;
  String? size;
  String? sId;

  Items({this.product, this.quantity, this.size, this.sId});

  Items.fromJson(Map<String, dynamic> json) {
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
    quantity = json['quantity'];
    size = json['size'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    data['quantity'] = this.quantity;
    data['size'] = this.size;
    data['_id'] = this.sId;
    return data;
  }
}

class Product {
  String? sId;
  String? name;
  String? image;
  String? description;
  int? price;
  int? qty;
  String? category;
  int? iV;

  Product(
      {this.sId,
      this.name,
      this.image,
      this.description,
      this.price,
      this.qty,
      this.category,
      this.iV});

  Product.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    image = json['image'];
    description = json['description'];
    price = json['price'];
    qty = json['qty'];
    category = json['category'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['image'] = this.image;
    data['description'] = this.description;
    data['price'] = this.price;
    data['qty'] = this.qty;
    data['category'] = this.category;
    data['__v'] = this.iV;
    return data;
  }
}
