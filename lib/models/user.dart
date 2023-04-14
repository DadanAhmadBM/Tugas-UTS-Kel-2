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
      name: "Ilham Ahmad Putra Aziz Eden",
      username: "iapa",
      email: "iapa@email.com",
      profilePhoto:
          "https://assets.promediateknologi.id/crop/0x0:0x0/750x500/webp/photo/jawapos/2019/01/menang-pilkada-bandung-barat-hengky-kurniawan-bentuk-tim-transisi_m_226841.jpg",
      phoneNumber: "085123456789",
    );
  }
}
