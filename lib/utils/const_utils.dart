import 'dart:convert';

import 'package:telescope_driver/model/apiModel/responseModel/register_res_model.dart';
import 'package:telescope_driver/utils/enum_utils.dart';
import 'package:telescope_driver/utils/variable_utils.dart';

import 'pref_manager_utils.dart';

class ConstUtils {
  static UserData kGetUserData() {
    String data = PrefManagerUtils.getUserData();
    print('USER DATA :$data');
    if (data != '') {
      final userData = UserData.fromJson(jsonDecode(data));
      return userData;
    }
    return UserData();
  }

  static String kGetVehicleType(int id) {
    String type = VariableUtils.twoWheeler;
    switch (id) {
      case 1:
        type = VariableUtils.twoWheeler;
        break;
      case 2:
        type = VariableUtils.smallTruck;
        break;
      case 3:
        type = VariableUtils.car;
        break;
      case 4:
        type = VariableUtils.midSizeTruck;
        break;
      case 5:
        type = VariableUtils.others;
        break;
    }
    return type;
  }

  static String kImageBasePath =
      'https://teleport-devlopment.herokuapp.com/uploads/';

  static String kGetFileName(String path) {
    return path.substring(path.lastIndexOf('/') + 1);
  }

  static CardType kGetCardTypeFrmNumber(String input) {
    CardType cardType;
    if (input.startsWith(new RegExp(
        r'((5[1-5])|(222[1-9]|22[3-9][0-9]|2[3-6][0-9]{2}|27[01][0-9]|2720))'))) {
      cardType = CardType.Master;
    } else if (input.startsWith(new RegExp(r'[4]'))) {
      cardType = CardType.Visa;
    } else if (input
        .startsWith(new RegExp(r'((506(0|1))|(507(8|9))|(6500))'))) {
      cardType = CardType.Verve;
    } else if (input.startsWith(new RegExp(r'((34)|(37))'))) {
      cardType = CardType.AmericanExpress;
    } else if (input.startsWith(new RegExp(r'((6[45])|(6011))'))) {
      cardType = CardType.Discover;
    } else if (input
        .startsWith(new RegExp(r'((30[0-5])|(3[89])|(36)|(3095))'))) {
      cardType = CardType.DinersClub;
    } else if (input.startsWith(new RegExp(r'(352[89]|35[3-8][0-9])'))) {
      cardType = CardType.Jcb;
    } else if (input.length <= 8) {
      cardType = CardType.Others;
    } else {
      cardType = CardType.Invalid;
    }
    return cardType;
  }

  /// COUNTRY PHONE CODE
  static var kCountryCode = [
    "+1",
    "+91",
    "+93",
    "+355",
    "+213",
    "+684",
    "+376",
    "+244",
    "+809",
    "+268",
    "+54",
    "+374",
    "+297",
    "+247",
    "+61",
    "+672",
    "+43",
    "+994",
    "+242",
    "+246",
    "+973",
    "+880",
    "+375",
    "+32",
    "+501",
    "+229",
    "+975",
    "+284",
    "+591",
    "+387",
    "+267",
    "+55",
    "+673",
    "+359",
    "+226",
    "+257",
    "+855",
    "+237",
    "+238",
    "+345",
    "+236",
    "+235",
    "+56",
    "+86",
    "+886",
    "+57",
    "+269",
    "+682",
    "+506",
    "+385",
    "+53",
    "+357",
    "+420",
    "+45",
    "+767",
    "+253",
    "+593",
    "+20",
    "+503",
    "+240",
    "+291",
    "+372",
    "+251",
    "+500",
    "+298",
    "+679",
    "+358",
    "+33",
    "+596",
    "+594",
    "+241",
    "+220",
    "+995",
    "+49",
    "+233",
    "+350",
    "+30",
    "+299",
    "+473",
    "+671",
    "+502",
    "+224",
    "+245",
    "+592",
    "+509",
    "+504",
    "+852",
    "+36",
    "+354",
    "+62",
    "+98",
    "+964",
    "+353",
    "+972",
    "+225",
    "+876",
    "+81",
    "+962",
    "+254",
    "+686",
    "+82",
    "+965",
    "+996",
    "+371",
    "+856",
    "+961",
    "+266",
    "+231",
    "+370",
    "+218",
    "+423",
    "+352",
    "+853",
    "+389",
    "+261",
    "+265",
    "+60",
    "+960",
    "+223",
    "+356",
    "+692",
    "+222",
    "+230",
    "+52",
    "+691",
    "+373",
    "+976",
    "+212",
    "+258",
    "+95",
    "+264",
    "+674",
    "+977",
    "+31",
    "+599",
    "+869",
    "+687",
    "+64",
    "+505",
    "+227",
    "+234",
    "+683",
    "+850",
    "+1 670",
    "+47",
    "+968",
    "+92",
    "+680",
    "+507",
    "+675",
    "+595",
    "+51",
    "+63",
    "+48",
    "+351",
    "+1 787",
    "+974",
    "+262",
    "+40",
    "+250",
    "+670",
    "+378",
    "+239",
    "+966",
    "+221",
    "+381",
    "+248",
    "+232",
    "+65",
    "+421",
    "+386",
    "+677",
    "+252",
    "+27",
    "+34",
    "+94",
    "+290",
    "+508",
    "+249",
    "+597",
    "+46",
    "+41",
    "+963",
    "+689",
    "+7",
    "+255",
    "+66",
    "+228",
    "+690",
    "+676",
    "+1 868",
    "+216",
    "+90",
    "+993",
    "+688",
    "+256",
    "+380",
    "+971",
    "+44",
    "+598",
    "+678",
    "+39",
    "+58",
    "+84",
    "+1 340",
    "+681",
    "+685",
    "+967",
    "+243",
    "+260",
    "+263"
  ];
}
