import 'package:flutter_dojo_step_counter/models/wom_reponse.dart';
import 'package:flutter_dojo_step_counter/models/wom_request.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../my_exceptions.dart';

abstract class WomRemoteDataSource {
  Future<WomResponse> getWomFromServer(WomRequest womRequest);
}

class WomRemoteDataSourceImpl implements WomRemoteDataSource {
  @override
  Future<WomResponse> getWomFromServer(WomRequest womRequest) async {
    try {
      final response = await http.post(
          'https://stepcounter.wom.social/vouchers',
          body: jsonEncode(womRequest.toMap()),
          headers: {'content-type': 'application/json'});
      if (response.statusCode == 200) {
        final body = response.body;
        return WomResponse.fromMap(jsonDecode(body) as Map<String, dynamic>);
      } else if (response.statusCode == 204) {
        throw NoWomException();
      } else {
        throw ServerException();
      }
    } catch (ex, stack) {
      rethrow;
    }
  }
}
