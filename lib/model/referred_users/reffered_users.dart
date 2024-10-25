class ReferredUsers {
  bool status;
  String message;
  Data? data;

  ReferredUsers({
    required this.status,
    required this.message,
    this.data,
  });

  factory ReferredUsers.fromJson(Map<String, dynamic> json) {
    return ReferredUsers(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data?.toJson() ?? {},
    };
  }
}

class Data {
  List<ReferredUser> referredUser;

  Data({
    required this.referredUser,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      referredUser: json['referred_user'] != null
          ? List<ReferredUser>.from(
              json['referred_user'].map((x) => ReferredUser.fromJson(x)),
            )
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'referred_user': referredUser.map((x) => x.toJson()).toList(),
    };
  }
}

class ReferredUser {
  int id;
  dynamic salesId;
  dynamic userId;
  String createdAt;
  String updatedAt;
  User user;

  ReferredUser({
    required this.id,
    this.salesId,
    this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
  });

  factory ReferredUser.fromJson(Map<String, dynamic> json) {
    return ReferredUser(
      id: json['id'] ?? 0,
      salesId: json['sales_id'],
      userId: json['user_id'],
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      user: User.fromJson(json['users'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sales_id': salesId,
      'user_id': userId,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'users': user.toJson(),
    };
  }
}

class User {
  int id;
  String name;
  String email;
  String phone;
  String profilePic;
  String? companyName;
  String? dob;
  String? frequentFlyerNo;
  String? additionalDetails;
  String? emailVerifiedAt;
  dynamic referral;
  dynamic source;
  dynamic specify;
  int status;
  dynamic otp;
  String? otpCreatedAt;
  int target;
  String createdAt;
  String updatedAt;
  int activeStatus;
  String avatar;
  int darkMode;
  dynamic messengerColor;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.profilePic,
    this.companyName,
    this.dob,
    this.frequentFlyerNo,
    this.additionalDetails,
    this.emailVerifiedAt,
    this.referral,
    this.source,
    this.specify,
    required this.status,
    this.otp,
    this.otpCreatedAt,
    required this.target,
    required this.createdAt,
    required this.updatedAt,
    required this.activeStatus,
    required this.avatar,
    required this.darkMode,
    this.messengerColor,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      profilePic: json['profile_pic'] ?? '',
      companyName: json['company_name'],
      dob: json['dob'],
      frequentFlyerNo: json['frequent_flyer_no'],
      additionalDetails: json['additional_details'],
      emailVerifiedAt: json['email_verified_at'],
      referral: json['referral'],
      source: json['source'],
      specify: json['specify'],
      status: json['status'] ?? 0,
      otp: json['otp'],
      otpCreatedAt: json['otp_created_at'],
      target: json['target'] ?? 0,
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      activeStatus: json['active_status'] ?? 0,
      avatar: json['avatar'] ?? '',
      darkMode: json['dark_mode'] ?? 0,
      messengerColor: json['messenger_color'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'profile_pic': profilePic,
      'company_name': companyName,
      'dob': dob,
      'frequent_flyer_no': frequentFlyerNo,
      'additional_details': additionalDetails,
      'email_verified_at': emailVerifiedAt,
      'referral': referral,
      'source': source,
      'specify': specify,
      'status': status,
      'otp': otp,
      'otp_created_at': otpCreatedAt,
      'target': target,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'active_status': activeStatus,
      'avatar': avatar,
      'dark_mode': darkMode,
      'messenger_color': messengerColor,
    };
  }
}
