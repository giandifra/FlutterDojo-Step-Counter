class WomResponse {
  final int womCount;
  final String womPassword;
  final String womLink;

  WomResponse({this.womCount, this.womPassword, this.womLink});

  factory WomResponse.fromMap(Map<String, dynamic> map) {
    return WomResponse(
      womCount: map['womCount'] as int,
      womPassword: map['womPassword'] as String,
      womLink: map['womLink'] as String,
    );
  }
}
