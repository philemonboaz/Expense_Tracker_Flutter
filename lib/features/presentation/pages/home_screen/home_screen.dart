import 'package:expense_tracker/core/constants/app_constants.dart';
import 'package:expense_tracker/features/presentation/common/error_screen.dart';
import 'package:expense_tracker/features/presentation/common/state_view_model.dart';
import 'package:expense_tracker/features/presentation/pages/history_screen/history_screen.dart';
import 'package:expense_tracker/features/presentation/pages/home_screen/home_screen_view_model.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_functions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends StateViewModel<HomeScreen, HomeScreenViewModel> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Access the current theme
    return uiUpdate(
      builder: (model) => model.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : (!model.apiError)
              ? Scaffold(
                  appBar: AppFunctions.customAppBar(
                    context: context,
                    headerTitle: "Expenses",
                    centerTitle: false,
                    backgroundColor: theme.primaryColor,
                    titleColor: theme.indicatorColor,
                    onBackPressed: () => false,
                    isBackPress: false,
                    listOfActions: [
                      GestureDetector(
                        onTap: () => model.goToAddExpenseScreen(context),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 0),
                          child: Icon(
                            Icons.add,
                            size: 30,
                            color: Theme.of(context).primaryColorLight,
                          ),
                        ),
                      )
                    ],
                    isActionsEnabled: true,
                  ),
                  backgroundColor: theme.primaryColor,
                  body: _selectedIndex == 0
                      ? SizedBox(
                          height: mediaQueryData.size.height,
                          width: mediaQueryData.size.height,
                          child: (viewModel!.getExpenses.isNotEmpty)
                              ? ListView.builder(
                                  itemCount: viewModel?.getExpenses.length ?? 0,
                                  itemBuilder: (context, index) {
                                    final expense =
                                        viewModel?.getExpenses[index];
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 6.0, vertical: 2.0),
                                      child: _dataContainer(expense, theme),
                                    );
                                  },
                                )
                              : const Center(
                                  child: Text(
                                    "No Expense Found",
                                  ),
                                ),
                        )
                      : _pages[_selectedIndex],
                  bottomNavigationBar: BottomNavigationBar(
                    items: const [
                      BottomNavigationBarItem(
                          icon: Icon(Icons.home), label: "Home"),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.history), label: "History")
                    ],
                    onTap: _onItemTapped,
                    currentIndex: _selectedIndex,
                  ),
                )
              : ErrorScreen(
                  errorMessage: model.apiErrorMessage,
                  errorScreenTitle: AppConstants.serverError),
    );
  }

  Widget _dataContainer(expense, ThemeData theme) {
    return Card(
      // color: theme.cardC,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // const Text(
                //   "Title",
                //   style: TextStyle(),
                // ),
                // const SizedBox(
                //   width: 20,
                // ),
                Text("${expense?.title}")
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      "Amount",
                      style: TextStyle(color: Colors.black),
                    ),
                    // const SizedBox(
                    //   width: 20,
                    // ),
                    Text(
                      "${expense?.amount}",
                      style: const TextStyle(color: Colors.black),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text("CreatedAt"),
                    // const SizedBox(
                    //   width: 20,
                    // ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text("${expense?.createdAt}"),
                  ],
                )
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Description"),
                const SizedBox(
                  width: 20,
                ),
                Text("${expense?.description}")
              ],
            )
          ],
        ),
      ),
    );
  }

  final List<Widget> _pages = const [
    Center(
      child: Text("Home"),
    ),
    HistoryScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  // @override
  // buildBody(BuildContext context) {
  //   // TODO: implement buildBody
  //   return !viewModel!.isLoading
  //       ? SizedBox(
  //           height: mediaQueryData.size.height,
  //           width: mediaQueryData.size.height,
  //           child: (viewModel!.getExpenses.isNotEmpty)
  //               ? ListView.builder(
  //                   itemCount: viewModel?.getExpenses.length ?? 0,
  //                   itemBuilder: (context, index) {
  //                     final expense = viewModel?.getExpenses[index];
  //                     return Padding(
  //                       padding: const EdgeInsets.symmetric(
  //                           horizontal: 6.0, vertical: 2.0),
  //                       child: Card(
  //                         shape: const RoundedRectangleBorder(
  //                           borderRadius: BorderRadius.all(
  //                             Radius.circular(8),
  //                           ),
  //                         ),
  //                         child: Padding(
  //                           padding: const EdgeInsets.all(8.0),
  //                           child: Column(
  //                             children: [
  //                               Row(
  //                                 mainAxisSize: MainAxisSize.min,
  //                                 mainAxisAlignment:
  //                                     MainAxisAlignment.spaceBetween,
  //                                 children: [
  //                                   const Text("Title"),
  //                                   const SizedBox(
  //                                     width: 20,
  //                                   ),
  //                                   Text("${expense?.title}")
  //                                 ],
  //                               ),
  //                               Row(
  //                                 mainAxisSize: MainAxisSize.min,
  //                                 mainAxisAlignment:
  //                                     MainAxisAlignment.spaceBetween,
  //                                 children: [
  //                                   const Text("Amount"),
  //                                   const SizedBox(
  //                                     width: 20,
  //                                   ),
  //                                   Text("${expense?.amount}"),
  //                                   const SizedBox(
  //                                     width: 20,
  //                                   ),
  //                                   const Text("CreatedAt"),
  //                                   const SizedBox(
  //                                     width: 20,
  //                                   ),
  //                                   const SizedBox(
  //                                     width: 20,
  //                                   ),
  //                                   Text("${expense?.createdAt}")
  //                                 ],
  //                               ),
  //                               Row(
  //                                 mainAxisSize: MainAxisSize.min,
  //                                 mainAxisAlignment:
  //                                     MainAxisAlignment.spaceBetween,
  //                                 children: [
  //                                   const Text("Description"),
  //                                   const SizedBox(
  //                                     width: 20,
  //                                   ),
  //                                   Text("${expense?.description}")
  //                                 ],
  //                               )
  //                             ],
  //                           ),
  //                         ),
  //                       ),
  //                     );
  //                   },
  //                 )
  //               : const Center(
  //                   child: Text("No Expense Found"),
  //                 ),
  //         )
  //       : const Center(
  //           child: CircularProgressIndicator(),
  //         );
  // }
}
