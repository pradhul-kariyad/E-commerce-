class EBanner {
  String? id;
  String? image;
  String? description;
  bool? isActive;
  int? v;
  String? first;
  String? second;

  EBanner({
    this.id,
    this.image,
    this.description,
    this.isActive,
    this.v,
    this.first,
    this.second,
  });

  factory EBanner.fromJson(Map<String, dynamic> json) => EBanner(
        id: json['_id'] as String?,
        image: json['image'] as String?,
        description: json['description'] as String?,
        isActive: json['isActive'] as bool?,
        v: json['__v'] as int?,
        first: json['first'] as String?,
        second: json['second'] as String?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'image': image,
        'description': description,
        'isActive': isActive,
        '__v': v,
        'first': first,
        'second': second,
      };
}
