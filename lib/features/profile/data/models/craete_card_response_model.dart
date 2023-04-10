class CreateCardResponseModel {
  CreateCardResponseModel({
    required this.otpSentPhone,
    required this.session,
  });

  final String otpSentPhone;
  final int session;

  factory CreateCardResponseModel.fromJson(Map<String, dynamic> json) => CreateCardResponseModel(
    otpSentPhone: json["otp_sent_phone"],
    session: json["session"],
  );
}