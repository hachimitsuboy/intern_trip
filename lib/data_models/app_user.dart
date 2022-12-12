class AppUser {
  final String userId;
  final String displayName;
  final String inAppUserName;
  final String photoUrl;
  final String mail;
  final String university;
  final String grade;
  final String age;

//<editor-fold desc="Data Methods">

  const AppUser({
    required this.userId,
    required this.displayName,
    required this.inAppUserName,
    required this.photoUrl,
    required this.mail,
    required this.university,
    required this.grade,
    required this.age,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppUser &&
          runtimeType == other.runtimeType &&
          userId == other.userId &&
          displayName == other.displayName &&
          inAppUserName == other.inAppUserName &&
          photoUrl == other.photoUrl &&
          mail == other.mail &&
          university == other.university &&
          grade == other.grade &&
          age == other.age);

  @override
  int get hashCode =>
      userId.hashCode ^
      displayName.hashCode ^
      inAppUserName.hashCode ^
      photoUrl.hashCode ^
      mail.hashCode ^
      university.hashCode ^
      grade.hashCode ^
      age.hashCode;

  @override
  String toString() {
    return 'User{' +
        ' userId: $userId,' +
        ' displayName: $displayName,' +
        ' inAppUserName: $inAppUserName,' +
        ' photoUrl: $photoUrl,' +
        ' mail: $mail,' +
        ' university: $university,' +
        ' grade: $grade,' +
        ' age: $age,' +
        '}';
  }

  AppUser copyWith({
    String? userId,
    String? displayName,
    String? inAppUserName,
    String? photoUrl,
    String? mail,
    String? university,
    String? grade,
    String? age,
  }) {
    return AppUser(
      userId: userId ?? this.userId,
      displayName: displayName ?? this.displayName,
      inAppUserName: inAppUserName ?? this.inAppUserName,
      photoUrl: photoUrl ?? this.photoUrl,
      mail: mail ?? this.mail,
      university: university ?? this.university,
      grade: grade ?? this.grade,
      age: age ?? this.age,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': this.userId,
      'displayName': this.displayName,
      'inAppUserName': this.inAppUserName,
      'photoUrl': this.photoUrl,
      'mail': this.mail,
      'university': this.university,
      'grade': this.grade,
      'age': this.age,
    };
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      userId: map['userId'] as String,
      displayName: map['displayName'] as String,
      inAppUserName: map['inAppUserName'] as String,
      photoUrl: map['photoUrl'] as String,
      mail: map['mail'] as String,
      university: map['university'] as String,
      grade: map['grade'] as String,
      age: map['age'] as String,
    );
  }

//</editor-fold>
}