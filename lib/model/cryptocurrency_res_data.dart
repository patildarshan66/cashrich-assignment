import 'cryptocurrency.dart';

class CryptoResData {
  CryptoResData({
    required this.status,
    required this.cryptoList,
  });

  final Status? status;
  final List<Cryptocurrency> cryptoList;

  factory CryptoResData.fromJson(Map<String, dynamic> json) {
    final data = json["data"] as Map<String, dynamic>;
    return CryptoResData(
      status: Status.fromJson(json["status"]),
      cryptoList: json["data"] != null
          ? List<Cryptocurrency>.from(
              data.values.toList().map(
                    (e) => Cryptocurrency.fromJson(e),
                  ),
            )
          : [],
    );
  }
}

class Status {
  Status({
    required this.timestamp,
    required this.errorCode,
    required this.errorMessage,
    required this.elapsed,
    required this.creditCount,
    required this.notice,
  });

  final DateTime? timestamp;
  final int? errorCode;
  final dynamic errorMessage;
  final int? elapsed;
  final int? creditCount;
  final dynamic notice;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        timestamp: DateTime.parse(json["timestamp"]),
        errorCode: json["error_code"],
        errorMessage: json["error_message"],
        elapsed: json["elapsed"],
        creditCount: json["credit_count"],
        notice: json["notice"],
      );

  Map<String, dynamic> toJson() => {
        "timestamp": timestamp?.toIso8601String(),
        "error_code": errorCode,
        "error_message": errorMessage,
        "elapsed": elapsed,
        "credit_count": creditCount,
        "notice": notice,
      };
}
