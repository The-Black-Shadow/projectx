class User {
    String name;
    String email;
    int phone;
    String bio;
    String id;

    User({
        required this.name,
        required this.email,
        required this.phone,
        required this.bio,
        required this.id,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        bio: json["bio"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "phone": phone,
        "bio": bio,
        "id": id,
    };
}