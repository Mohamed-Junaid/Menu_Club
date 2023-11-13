class LoginModel {
  LoginModel({
      this.token, 
      this.msg,});

  LoginModel.fromJson(dynamic json) {
    token = json['token'] != null ? Token.fromJson(json['token']) : null;
    msg = json['msg'];
  }
  Token? token;
  String? msg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (token != null) {
      map['token'] = token?.toJson();
    }
    map['msg'] = msg;
    return map;
  }

}

class Token {
  Token({
      this.refresh, 
      this.access,});

  Token.fromJson(dynamic json) {
    refresh = json['refresh'];
    access = json['access'];
  }
  String? refresh;
  String? access;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['refresh'] = refresh;
    map['access'] = access;
    return map;
  }

}