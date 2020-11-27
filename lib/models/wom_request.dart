import 'package:flutter/cupertino.dart';

class WomRequest {
  final int steps;
  final double latitude;
  final double longitude;

  WomRequest(
      {@required this.steps,
      @required this.latitude,
      @required this.longitude});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': 'id',
      'steps': this.steps,
      'lat': this.latitude,
      'long': this.longitude,
    };
  }
}
