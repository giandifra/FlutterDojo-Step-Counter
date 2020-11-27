import 'package:flutter_dojo_step_counter/models/wom_reponse.dart';
import 'package:flutter_dojo_step_counter/models/wom_request.dart';
import 'package:flutter_dojo_step_counter/my_exceptions.dart';
import 'package:flutter_dojo_step_counter/services/wom_repository/local_data_sources.dart';
import 'package:flutter_dojo_step_counter/services/wom_repository/remote_data_sources.dart';

abstract class WomRepository {
  Future<WomResponse> getWoms(WomRequest womRequest);
}

class WomRepositoryImpl implements WomRepository {
  final WomRemoteDataSource womRemoteDataSource;
  final WomLocalDataSource womLocalDataSource;

  WomRepositoryImpl(this.womRemoteDataSource, this.womLocalDataSource);

  @override
  Future<WomResponse> getWoms(WomRequest womRequest) async {
    try {
      final womResponse =
          await womRemoteDataSource.getWomFromServer(womRequest);
      return womResponse;
    } on NoWomException {
      rethrow;
    } on ServerException {
      rethrow;
    } catch (ex) {
      print(ex);
      rethrow;
    }
  }
}
