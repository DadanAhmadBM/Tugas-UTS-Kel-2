class User {
  final int id;
  final String name;
  final String username;
  final String email;
  final String? profilePhoto;
  final String? phoneNumber;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    this.profilePhoto,
    this.phoneNumber,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map["id"],
      name: map["name"],
      username: map["username"],
      email: map["email"],
      profilePhoto: map["profile_photo"],
      phoneNumber: map["phone_number"],
    );
  }

  factory User.dummy() {
    return User(
      id: 001,
      name: "Diar Nur Rizky",
      username: "diarn",
      email: "diarn@email.com",
      profilePhoto:
          "https://cdn.idntimes.com/content-images/community/2020/09/104967619-2451390651819718-4934284928595035666-n-2fc82b7325949c7d003c1c58e17d48b7.jpg",
      phoneNumber: "085123456789",
    );
  }
}
