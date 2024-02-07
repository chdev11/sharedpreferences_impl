abstract class ILocalStorage {
  Future<dynamic> read();
  Future<bool> save(dynamic source);
  Future<bool> loadDefault();
}
