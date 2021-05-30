List<MenuModal> HomeMenuList = [
  MenuModal(0, "Counter", "asset/tachometer.png"),
  MenuModal(1, "Login", "asset/login.png"),
  MenuModal(3, "Todo List", "asset/to-do-list.png"),
];

class MenuModal {
  int _id;
  String _tile;
  String _images;

  MenuModal(this._id, this._tile, this._images);

  String get images => _images;

  set images(String value) {
    _images = value;
  }

  String get tile => _tile;

  set tile(String value) {
    _tile = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }
}
