import 'package:expense_tracker/core/provider/base_notifier.dart';
import 'package:expense_tracker/features/data/models/authentication/token_model.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/utils/global.dart';
import '../../../../core/utils/unified_response_wrapper.dart';
import '../../../domain/use_cases/authentication/get_token_usecase.dart';

class SplashScreenViewModel extends BaseNotifier {
  // static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  // final sharedPref = SharedPrefsStorage();
  final GetTokenUsecase getTokenUsecase = GetTokenUsecase();
  late String jwtToken = "";
  late final String? deviceId;

  @override
  void initModel() {
    // TODO: implement initModel
    super.initModel();
    // To gen token using device id.
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) => _getDependenciesOfMobile(),
    );
  }

  void _getDependenciesOfMobile() async {
    try {
      setLoading(true);
      // if (Platform.isAndroid) {
      //   AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
      //   deviceId = androidInfo.id; // or androidInfo.androidId (most common)
      // } else if (Platform.isIOS) {
      //   IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;
      //   deviceId = iosInfo.identifierForVendor!;
      // } else {
      //   deviceId = null;
      // }
      deviceId = "52ar234a";
      if (deviceId != null) {
        final tokenData = await getTokenUsecase.getJwtToken(deviceId!);
        if (tokenData is SuccessResp<TokenModel>) {
          jwtToken = tokenData.data.toString();
          Global.instance.jwtToken = jwtToken;
        } else if (tokenData is FailureResp<TokenModel>) {
          apiError = true;
          apiErrorMessage = tokenData.errMsg;
          notifyListeners();
          setLoading(false);
          jwtToken = "";
        } else {
          debugPrint("Error Occurred parsing");
          apiError = true;
          apiErrorMessage = AppConstants.serverError;
          notifyListeners();
          setLoading(false);
          jwtToken = "";
        }
      }
      setLoading(false);
    } catch (e) {
      apiError = true;
      apiErrorMessage = AppConstants.serverError;
      notifyListeners();
      setLoading(false);
    }
  }
}
