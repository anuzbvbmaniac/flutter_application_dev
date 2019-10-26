
class Note {
  int _id;
  String _title;
  String _description;
  String _date;
  int _priority;  

  Note(this._title, this._date, this._priority, [this._description]);

  Note.withId(this._id, this._title, this._date, this._priority, [this._description]);
  
  int get id => _id;
  String get title => _title;
  String get description => _description;
  String get date => _date;
  int get priority => _priority;

  set title(String newTitle) {
    //validation
    if(newTitle.length <= 255) {
      this._title = newTitle;
    }
  }

  set description(String newDescription) {
    if(newDescription.length <= 255) {
      this._description = newDescription;
    }
  }

  set priority(int newPriority) {
    if(newPriority >= 1 && newPriority <= 2) {
      this._priority = newPriority;
    }
  }

  set date(String newDate) {
    this._date = newDate;
  }

  //convert note object to a Map Object
  Map<String, dynamic> toMap() {
    /**
     * key is string in all case, but as a value it is dynamic
     * example : title, id all are string where title is string, id is int
     */
    var map = Map<String, dynamic>();

    if(id != null) {
      map['id'] = _id;
    }

    map['title'] = _title;
    map['description'] = _description;
    map['priority'] = _priority;
    map['date'] = _date;

    return map;
  }

  //Extract a note object from map object
  Note.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._title = map['title'];
    this._description = map['description'];
    this._priority = map['priority'];
    this._date = map['date'];
  }
  
}