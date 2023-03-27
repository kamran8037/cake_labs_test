abstract class AppRepo {
  ///
  ///
  void savePin(String pin);

  ///
  ///
  Future<bool> pinAuth(String pin);

  ///
  ///
  void close();
}
