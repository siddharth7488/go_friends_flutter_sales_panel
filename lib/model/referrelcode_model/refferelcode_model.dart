class ReferralResponse {
  bool status;
  String message;
  ReferralData data;

  ReferralResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  // Factory method to create a ReferralResponse object from JSON
  factory ReferralResponse.fromJson(Map<String, dynamic> json) {
    return ReferralResponse(
      status: json['status'],
      message: json['message'],
      data: ReferralData.fromJson(json['data']),
    );
  }

  // Method to convert a ReferralResponse object to JSON
  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data.toJson(),
    };
  }
}

class ReferralData {
  String referralCode;

  ReferralData({
    required this.referralCode,
  });

  // Factory method to create a ReferralData object from JSON
  factory ReferralData.fromJson(Map<String, dynamic> json) {
    return ReferralData(
      referralCode: json['referral_code'],
    );
  }

  // Method to convert a ReferralData object to JSON
  Map<String, dynamic> toJson() {
    return {
      'referral_code': referralCode,
    };
  }
}
