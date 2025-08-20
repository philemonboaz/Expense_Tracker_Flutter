import 'package:flutter/material.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/utils/global.dart';
import '../../../../core/utils/unified_response_wrapper.dart';
import '../../../domain/use_cases/authentication/get_token_usecase.dart';
import '../home_screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final GetTokenUsecase _getTokenUsecase = GetTokenUsecase();
  bool _didInit = false;

  @override
  void initState() {
    super.initState();
    // Run once, after first frame so `context` is safe
    WidgetsBinding.instance.addPostFrameCallback((_) => _init());
  }

  Future<void> _init() async {
    if (_didInit) return; // guard against multiple calls
    _didInit = true;

    try {
      Global.deviceId = "devA"; // TODO: real device id

      if (Global.deviceId == null) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No device id')),
        );
        return;
      }

      final UnifiedResponseWrapper tokenData =
          await _getTokenUsecase.getJwtToken(Global.deviceId!);

      // Always check before using context after awaits
      if (!mounted) return;

      if (tokenData is SuccessResp) {
        Global.jwtToken = tokenData.data.toString();
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const HomeScreen()),
        );
      } else if (tokenData is FailureResp) {
        Global.jwtToken = "";
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error getting token')),
        );
      } else {
        Global.jwtToken = "";
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Unexpected response')),
        );
      }
    } catch (e, st) {
      debugPrint('Splash init error: $e\n$st');
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Something went wrong')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // <-- provide a Scaffold so SnackBars work
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
              maxHeight: 300, maxWidth: 300, minHeight: 250, minWidth: 250),
          child: const ClipOval(child: _Logo()),
        ),
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo();

  @override
  Widget build(BuildContext context) {
    return Image.asset(AppAssets.logo);
  }
}
