class Destination {
  int? _id;
  String? _stationname;
  String? _train;
  String? _nextstop;

  Destination(this._id, this._stationname, this._train, this._nextstop);

  int? get id => _id;

  String? get stationname => _stationname;

  String? get train => _train;

  String? get nextstop => _nextstop;

  set stationname(String? newname) {
    this._stationname = newname;
  }

  set train(String? newtrain) {
    this._train = newtrain;
  }

  set nextstop(String? newnextstop) {
    this._nextstop = newnextstop;
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = _id;
    }
    map['stationname'] = _stationname;
    map['train'] = _train;
    map['nextstop'] = _nextstop;

    return map;
  }

  // Extract a Note object from a Map object
  Destination.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._stationname = map['stationname'];
    this._train = map['train'];
    this._nextstop = map['nextstop'];
  }
}
