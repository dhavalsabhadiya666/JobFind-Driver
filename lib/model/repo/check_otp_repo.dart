import 'dart:developer';

import 'package:telescope_driver/model/apiModel/requestModel/register_req_model.dart';
import 'package:telescope_driver/model/apiModel/responseModel/common_res_model.dart';
import 'package:telescope_driver/model/apiModel/responseModel/resend_otp_res_model.dart';
import 'package:telescope_driver/model/apiModel/responseModel/upload_file_res_model.dart';
import 'package:telescope_driver/model/apiService/api_service.dart';
import 'package:telescope_driver/model/apiService/base_service.dart';
import 'package:telescope_driver/utils/const_utils.dart';
import 'package:telescope_driver/utils/enum_utils.dart';

class CheckOtpRepo extends BaseService {
  Future<CommonResModel?> checkOtpRepo({required String otp}) async {
    final userId = ConstUtils.kGetUserData().id;
    Map<String, dynamic> body = {'id': userId, 'otp': otp};
    var response = await ApiService().getResponse(
      apiType: APIType.aPost,
      url: otpCheckUrl,
      body: body,
    );

    log("CommonResModel RESPONSE REPO : => $response");
    if (response == null) {
      return null;
    }
    final result = CommonResModel.fromJson(response);
    return result;
  }
}
