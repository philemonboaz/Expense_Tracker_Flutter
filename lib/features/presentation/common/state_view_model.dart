import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/provider/base_notifier.dart';
import '../../../core/utils/app_functions.dart';

abstract class StateViewModel<S extends StatefulWidget, M extends BaseNotifier>
    extends State<S> {
  late MediaQueryData mediaQueryData;

  M? viewModel;

  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
      () {
        viewModel = Provider.of<M>(context, listen: false);
        initScreen();
      },
    );
  }

  @mustCallSuper
  void initScreen() {
    viewModel?.initModel();
    mediaQueryData = MediaQuery.of(context);
  }

  Widget? buildFloatingActionButton() => null;

  Widget? buildBottomNavigationBar() => null;

  @override
  Widget build(BuildContext context) {
    debugPrint(
        "BUILD METHOD TRIGGERED inside the stateviewmodel"); // Check if this appears in logs

    mediaQueryData = MediaQuery.of(context);
    return uiUpdate(
      builder: (model) => Scaffold(
        extendBodyBehindAppBar: false,
        floatingActionButton: buildFloatingActionButton(),
        appBar: buildAppBar(),
        body: buildBody(context),
        bottomNavigationBar: buildBottomNavigationBar(),
      ),
    );
  }

  PreferredSizeWidget buildAppBar({
    bool isBackPress = true,
    String? headerTitle,
    bool centerTitle = false,
    double? appBarHeight,
    bool isActionsEnabled = false,
    List<Widget>? listOfActions,
    double? toolBarHeight,
    Function()? onBackPressed,
  }) {
    return AppFunctions.customAppBar(
        context: context,
        isBackPress: isBackPress,
        toolBarHeight: appBarHeight,
        centerTitle: centerTitle,
        headerTitle: headerTitle,
        isActionsEnabled: isActionsEnabled,
        listOfActions: listOfActions,
        onBackPressed: onBackPressed);
  }

  Widget uiUpdate({required Widget Function(M) builder}) => Consumer<M>(
        builder: (context, viewModel, child) => builder(viewModel),
      );

  buildBody(BuildContext context) => Container();
}
