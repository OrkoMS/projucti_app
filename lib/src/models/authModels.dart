class SignUpResponse {
  int action;
  String msg;

  SignUpResponse({this.action, this.msg});

  SignUpResponse.fromJson(Map<String, dynamic> json) {
    action = json['action'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['action'] = this.action;
    data['msg'] = this.msg;
    return data;
  }
}
class CompanyListModel {
  String status;
  List<Companies> companies;

  CompanyListModel({this.status, this.companies});

  CompanyListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['companies'] != null) {
      companies = new List<Companies>();
      json['companies'].forEach((v) {
        companies.add(new Companies.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.companies != null) {
      data['companies'] = this.companies.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Companies {
  int id;
  String name;

  Companies({this.id, this.name});

  Companies.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class ErrorMessageModel {
  String message;
  String status;

  ErrorMessageModel({this.message, this.status});

  ErrorMessageModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class LoginModel {
  String accessToken;
  String tokenType;
  int expiresIn;

  LoginModel({this.accessToken, this.tokenType, this.expiresIn});

  LoginModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['token_type'] = this.tokenType;
    data['expires_in'] = this.expiresIn;
    return data;
  }
}

class AccessTokenModel {
  String iss;
  int iat;
  int exp;
  int nbf;
  String jti;
  int sub;
  String prv;

  AccessTokenModel(
      {this.iss, this.iat, this.exp, this.nbf, this.jti, this.sub, this.prv});

  AccessTokenModel.fromJson(Map<String, dynamic> json) {
    iss = json['iss'];
    iat = json['iat'];
    exp = json['exp'];
    nbf = json['nbf'];
    jti = json['jti'];
    sub = json['sub'];
    prv = json['prv'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['iss'] = this.iss;
    data['iat'] = this.iat;
    data['exp'] = this.exp;
    data['nbf'] = this.nbf;
    data['jti'] = this.jti;
    data['sub'] = this.sub;
    data['prv'] = this.prv;
    return data;
  }
}
