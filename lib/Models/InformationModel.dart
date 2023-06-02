class Information {
  int id;
  String lienGithub;
  String entreprise;
  String langagePrefere;
  int userId;

  Information({
    required this.id,
    required this.lienGithub,
    required this.entreprise,
    required this.langagePrefere,
    required this.userId,
  });

  factory Information.fromJson(Map<String, dynamic> json) {
    return Information(
      id: json['id'],
      lienGithub: json['lienGithub'],
      entreprise: json['entreprise'],
      langagePrefere: json['langagePrefere'],
      userId: json['userId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'lienGithub': lienGithub,
      'entreprise': entreprise,
      'langagePrefere': langagePrefere,
      'userId': userId,
    };
  }
}
