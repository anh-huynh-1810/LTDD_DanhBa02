//full
class ContactObject {
  final int? id;
  final String name;
  final String phone;
  final String email;
  final String picture;

  ContactObject(this.id, this.name, this.email, this.phone, this.picture);
  ContactObject.fromJson(Map<String, dynamic> res)
      : id = res["id"],
        name = res["name"],
        email = res["email"],
        phone = res["phone"],
        picture = res["picture"];
}
