abstract class WomLocalDataSource {
  Future saveWomRequest();
}

class WomLocalSqlDataSourceImpl implements WomLocalDataSource {
  @override
  Future saveWomRequest() {
    throw UnimplementedError();
  }
}

// class WomLocalHiveDataSourceImpl implements WomLocalDataSource {
//   @override
//   Future saveWomRequest() {
//     throw UnimplementedError();
//   }
// }
