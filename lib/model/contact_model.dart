class Contact {
  String id;
  String mobile;
  String fullname;

  Contact({this.id, this.mobile, this.fullname});

  Contact.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mobile = json['mobile'];
    fullname = json['fullname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['mobile'] = this.mobile;
    data['fullname'] = this.fullname;
  }
}