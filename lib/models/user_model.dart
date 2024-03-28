// ignore_for_file: public_member_api_docs, sort_constructors_first

class UserModel {
  String? uid;
  String name;
  String surname;
  String? description;
  String? web;
  String? stackof;
  String? github;
  String? linkedin;
  String? medium;
  String email;
  String userName;
  String? profilePhoto;
  UserModel({
    this.uid,
    required this.name,
    required this.surname,
    this.description,
    this.web,
    this.stackof,
    this.github,
    this.linkedin,
    this.medium,
    required this.email,
    required this.userName,
    this.profilePhoto,
  });

  UserModel copyWith({
    String? uid,
    String? name,
    String? surname,
    String? description,
    String? web,
    String? stackof,
    String? github,
    String? linkedin,
    String? medium,
    String? email,
    String? userName,
    String? profilePhoto,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      surname: surname ?? this.surname,
      description: description ?? this.description,
      web: web ?? this.web,
      stackof: stackof ?? this.stackof,
      github: github ?? this.github,
      linkedin: linkedin ?? this.linkedin,
      medium: medium ?? this.medium,
      email: email ?? this.email,
      userName: userName ?? this.userName,
      profilePhoto: profilePhoto ?? this.profilePhoto,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'name': name,
      'surname': surname,
      'description': description,
      'web': web,
      'stackof': stackof,
      'github': github,
      'linkedin': linkedin,
      'medium': medium,
      'email': email,
      'userName': userName,
      'profilePhoto': profilePhoto,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] != null ? map['uid'] as String : null,
      name: map['name'] as String,
      surname: map['surname'] as String,
      description:
          map['description'] != null ? map['description'] as String : null,
      web: map['web'] != null ? map['web'] as String : null,
      stackof: map['stackof'] != null ? map['stackof'] as String : null,
      github: map['github'] != null ? map['github'] as String : null,
      linkedin: map['linkedin'] != null ? map['linkedin'] as String : null,
      medium: map['medium'] != null ? map['medium'] as String : null,
      email: map['email'] as String,
      userName: map['userName'] as String,
      profilePhoto:
          map['profilePhoto'] != null ? map['profilePhoto'] as String : null,
    );
  }

  @override
  String toString() {
    return 'UserModel(uid: $uid, name: $name, surname: $surname, description: $description, web: $web, stackof: $stackof, github: $github, linkedin: $linkedin, medium: $medium, email: $email, userName: $userName, profilePhoto: $profilePhoto)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.uid == uid &&
        other.name == name &&
        other.surname == surname &&
        other.description == description &&
        other.web == web &&
        other.stackof == stackof &&
        other.github == github &&
        other.linkedin == linkedin &&
        other.medium == medium &&
        other.email == email &&
        other.userName == userName &&
        other.profilePhoto == profilePhoto;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        name.hashCode ^
        surname.hashCode ^
        description.hashCode ^
        web.hashCode ^
        stackof.hashCode ^
        github.hashCode ^
        linkedin.hashCode ^
        medium.hashCode ^
        email.hashCode ^
        userName.hashCode ^
        profilePhoto.hashCode;
  }
}
