import 'dart:developer';

import 'package:telescope_driver/model/apiModel/requestModel/register_req_model.dart';
import 'package:telescope_driver/model/apiModel/responseModel/resend_otp_res_model.dart';
import 'package:telescope_driver/model/apiModel/responseModel/upload_file_res_model.dart';
import 'package:telescope_driver/model/apiService/api_service.dart';
import 'package:telescope_driver/model/apiService/base_service.dart';
import 'package:telescope_driver/utils/const_utils.dart';
import 'package:telescope_driver/utils/enum_utils.dart';

class ResendOtpRepo extends BaseService {
  Future<OtpResendResModel?> resendOtpRepo() async {
    final  userId = ConstUtils.kGetUserData().id;
    Map<String, dynamic> body = {'id': userId};
    var response = await ApiService().getResponse(
      apiType: APIType.aPost,
      url: resendOtpUrl,
      body: body,
    );

    log("OtpResendResModel RESPONSE REPO : => $response");
    if (response == null) {
      return null;
    }
    final result = OtpResendResModel.fromJson(response);
    return result;
  }
}
