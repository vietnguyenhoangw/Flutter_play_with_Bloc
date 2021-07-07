List<MenuModal> homeMenuList = [
  MenuModal(0, "Counter", "asset/tachometer.png"),
  MenuModal(1, "Login", "asset/login.png"),
  MenuModal(3, "Todo List", "asset/to-do-list.png"),
  MenuModal(4, "Weather", "asset/cloudy.png"),
];

class MenuModal {
  int _id;
  String _tile;
  String _images;

  MenuModal(this._id, this._tile, this._images);

  // ignore: unnecessary_getters_setters
  String get images => _images;

  // ignore: unnecessary_getters_setters
  set images(String value) {
    _images = value;
  }

  // ignore: unnecessary_getters_setters
  String get tile => _tile;

  // ignore: unnecessary_getters_setters
  set tile(String value) {
    _tile = value;
  }

  // ignore: unnecessary_getters_setters
  int get id => _id;

  // ignore: unnecessary_getters_setters
  set id(int value) {
    _id = value;
  }
}
