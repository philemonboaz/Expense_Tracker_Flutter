import 'package:expense_tracker/core/provider/base_notifier.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/utils/global.dart';
import '../../../../core/utils/unified_response_wrapper.dart';
import '../../../domain/use_cases/authentication/get_token_usecase.dart';

class SplashScreenViewModel extends BaseNotifier {
  // static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  // final sharedPref = SharedPrefsStorage();
  final GetTokenUsecase getTokenUsecase = GetTokenUsecase();
  // late String jwtToken = "";
  // late final String? deviceId;

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
      Global.deviceId = "asdsfdgh";

      if (Global.deviceId != null) {
        final UnifiedResponseWrapper tokenData =
            await getTokenUsecase.getJwtToken(Global.deviceId!);
        if (tokenData is SuccessResp) {
          Global.jwtToken = tokenData.data.toString();
        } else if (tokenData is FailureResp) {
          apiError = true;
          apiErrorMessage = tokenData.errorResponse?.errorMessage;
          notifyListeners();
          setLoading(false);
          Global.jwtToken = "";
        } else {
          debugPrint("Error Occurred parsing");
          apiError = true;
          apiErrorMessage = AppConstants.serverError;
          notifyListeners();
          setLoading(false);
          Global.jwtToken = "";
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
