class TargetResponse {
  bool status;
  String message;
  TargetData data;

  TargetResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory TargetResponse.fromJson(Map<String, dynamic> json) {
    return TargetResponse(
      status: json['status'],
      message: json['message'],
      data: TargetData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data.toJson(),
    };
  }
}

class TargetData {
  int target;

  TargetData({required this.target});

  factory TargetData.fromJson(Map<String, dynamic> json) {
    return TargetData(
      target: json['target'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'target': target,
    };
  }
}
