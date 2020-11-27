import 'package:flutter/material.dart';
import 'package:flutter_dojo_step_counter/models/wom_reponse.dart';
import 'package:flutter_dojo_step_counter/models/wom_request.dart';
import 'package:flutter_dojo_step_counter/my_exceptions.dart';
import 'package:flutter_dojo_step_counter/services/wom_repository/wom_repository.dart';

class WomState extends ChangeNotifier {
  final WomRepository womRepository;

  WomState(this.womRepository);

  String error;
  WomResponse response;

  Future<void> getWoms(int steps, double long, double lat) async {
    try {
      final request = WomRequest(steps: steps, latitude: lat, longitude: long);
      response = await womRepository.getWoms(request);
    } on NoWomException {
      error =
          'Siamo spiacenti, non hai effettuato passi a sufficienza per avere Wom';
    } on ServerException {
      error = 'Si è verificato un errore imprevisto!';
    } catch (ex) {
      error = ex.toString();
    } finally {
      notifyListeners();
    }
  }
}
