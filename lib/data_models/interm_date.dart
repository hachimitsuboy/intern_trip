class Intern {
  final String company;
  final String eventName;
  final String eventContents;
  final DateTime startDate;
  final DateTime endDate;
  final String industry;
  final String occupation;
  final String venue;

//<editor-fold desc="Data Methods">

  const Intern({
    required this.company,
    required this.eventName,
    required this.eventContents,
    required this.startDate,
    required this.endDate,
    required this.industry,
    required this.occupation,
    required this.venue,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Intern &&
          runtimeType == other.runtimeType &&
          company == other.company &&
          eventName == other.eventName &&
          eventContents == other.eventContents &&
          startDate == other.startDate &&
          endDate == other.endDate &&
          industry == other.industry &&
          occupation == other.occupation &&
          venue == other.venue);

  @override
  int get hashCode =>
      company.hashCode ^
      eventName.hashCode ^
      eventContents.hashCode ^
      startDate.hashCode ^
      endDate.hashCode ^
      industry.hashCode ^
      occupation.hashCode ^
      venue.hashCode;

  @override
  String toString() {
    return 'Intern{' +
        ' company: $company,' +
        ' eventName: $eventName,' +
        ' eventContents: $eventContents,' +
        ' startDate: $startDate,' +
        ' endDate: $endDate,' +
        ' industry: $industry,' +
        ' occupation: $occupation,' +
        ' venue: $venue,' +
        '}';
  }

  Intern copyWith({
    String? company,
    String? eventName,
    String? eventContents,
    DateTime? startDate,
    DateTime? endDate,
    String? industry,
    String? occupation,
    String? venue,
  }) {
    return Intern(
      company: company ?? this.company,
      eventName: eventName ?? this.eventName,
      eventContents: eventContents ?? this.eventContents,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      industry: industry ?? this.industry,
      occupation: occupation ?? this.occupation,
      venue: venue ?? this.venue,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'company': this.company,
      'eventName': this.eventName,
      'eventContents': this.eventContents,
      'startDate': this.startDate,
      'endDate': this.endDate,
      'industry': this.industry,
      'occupation': this.occupation,
      'venue': this.venue,
    };
  }

  factory Intern.fromMap(Map<String, dynamic> map) {
    return Intern(
      company: map['company'] as String,
      eventName: map['eventName'] as String,
      eventContents: map['eventContents'] as String,
      startDate: map['startDate'].toDate() as DateTime,
      endDate: map['endDate'].toDate() as DateTime,
      industry: map['industry'] as String,
      occupation: map['occupation'] as String,
      venue: map['venue'] as String,
    );
  }

//</editor-fold>
}