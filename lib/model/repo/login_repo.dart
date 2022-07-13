import 'dart:developer';

import 'package:telescope_driver/model/apiModel/requestModel/login_req_model.dart';
import 'package:telescope_driver/model/apiModel/responseModel/register_res_model.dart';
import 'package:telescope_driver/model/apiService/api_service.dart';
import 'package:telescope_driver/model/apiService/base_service.dart';
import 'package:telescope_driver/utils/enum_utils.dart';

class LoginRepo extends BaseService {
  Future<RegisterResModel> loginRepo(LoginReqModel reqModel) async {
    var response = await ApiService().getResponse(
        apiType: APIType.aPost, url: loginUrl, body: reqModel.toJson());
    log("LOGINRESPONSE REPO : => $response");

    if (response == null) {
      return RegisterResModel();
    }
    final result = RegisterResModel.fromJson(response);
    return result;
  }
}
