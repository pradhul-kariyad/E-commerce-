// ignore_for_file: file_names

class User {
  final String img;
  final String category;
  // final String status;

  User(this.img, this.category);
}

List user = [
  User(
    "assets/images/headSet.PNG",
    "Electronics",
  ),
  User(
    "assets/images/headSet.PNG",
    "Fasion",
  ),
  User(
    "assets/images/headSet.PNG",
    "Jwellry",
  ),
  User(
    "assets/images/headSet.PNG",
    "Fancy",
  ),
  // User(
  //   "assets/images/headSet.PNG",
  //   "Book",
  // ),
];

class Users {
  final String name;
  final String review;
  final String pic;
  final String subName;
  final String price;

  Users(this.name, this.review, this.pic, this.subName, this.price);
}

List users = [
  Users("Nike", "3.3", "assets/images/hoodie.PNG", "subName", "1,800"),
  Users("Sony", "5.5", "assets/images/cameraa2.PNG", "subName", "1,600"),
  Users("Puma", "5.5", "assets/images/headSet.PNG", "subName", "9,000"),
  Users("name", "5.5", "assets/images/cameraa2.PNG", "subName", "10,000"),
];
