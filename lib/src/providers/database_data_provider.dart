abstract class DBDataProvider {
  Future<int> getLastVisitedCharacterPage();
  Future<int> getCharactersCount();
  Future<void> setLastVisitedCharacterPage(int characterPage);
  Future<void> setCharacterNetworkInfo(int charactersCount, int characterPages);
}
