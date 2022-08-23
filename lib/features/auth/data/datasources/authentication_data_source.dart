abstract class AuthenticationDataSource {
  Future<void> authentication({required String username, required String password});
}

class AuthenticationDataSourceImpl extends AuthenticationDataSource {
  @override
  Future<void> authentication({required String username, required String password}) async {
    // try{
    //
    // }
  }
}
