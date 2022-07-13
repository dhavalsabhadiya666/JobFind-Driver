import 'dart:developer';

import 'package:telescope_driver/model/apiModel/requestModel/register_req_model.dart';
import 'package:telescope_driver/model/apiModel/responseModel/upload_file_res_model.dart';
import 'package:telescope_driver/model/apiService/api_service.dart';
import 'package:telescope_driver/model/apiService/base_service.dart';
import 'package:telescope_driver/utils/enum_utils.dart';

class UploadFileRepo extends BaseService {
  Future<UploadFileResModel?> uploadFileRepo({required String file}) async {
    Map<String, dynamic> body = {'image': file};
    var response = await ApiService().getResponse(
        apiType: APIType.aPost,
        url: uploadImgUrl,
        body: body,
        fileUpload: true);

    log("FILE UPLOAD RESPONSE REPO : => $response");
    if (response == null) {
      return null;
    }
    final result = UploadFileResModel.fromJson(response);
    return result;
  }
}
