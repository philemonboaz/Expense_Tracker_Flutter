import 'package:expense_tracker/core/constants/app_constants.dart';
import 'package:expense_tracker/features/presentation/common/error_screen.dart';
import 'package:expense_tracker/features/presentation/common/state_view_model.dart';
import 'package:expense_tracker/features/presentation/pages/history_screen/history_screen.dart';
import 'package:expense_tracker/features/presentation/pages/home_screen/home_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/utils/app_functions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends StateViewModel<HomeScreen, HomeScreenViewModel> {
  int _selectedIndex = 0;
  final TextEditingController _dateController = TextEditingController();

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
                    listOfActions: (_selectedIndex == 0)
                        ? [
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
                            ),
                            // if (_selectedIndex == 0)
                            GestureDetector(
                              onTap: () => _filterRecords(context, model),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 0),
                                child: Icon(
                                  Icons.filter_alt_sharp,
                                  size: 30,
                                  color: Theme.of(context).primaryColorLight,
                                ),
                              ),
                            )
                          ]
                        : null,
                    isActionsEnabled: true,
                  ),
                  backgroundColor: theme.primaryColor,
                  body: _selectedIndex == 0
                      ? (viewModel!.getExpenses.isNotEmpty)
                          ? Column(
                              children: [
                                ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
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
                                ),
                              ],
                            )
                          : Center(
                              child: Text(
                                "No Expenses Found",
                                style: TextStyle(
                                  color: Theme.of(context).secondaryHeaderColor,
                                  fontSize: 20,
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
              : Scaffold(
                  appBar: AppFunctions.customAppBar(
                    context: context,
                    headerTitle: "Expenses",
                    centerTitle: false,
                    backgroundColor: theme.primaryColor,
                    titleColor: theme.indicatorColor,
                    onBackPressed: () => false,
                    isBackPress: false,
                    listOfActions: [],
                    isActionsEnabled: true,
                  ),
                  body: Center(
                    child: ErrorScreen(
                        errorMessage: model.apiErrorMessage,
                        errorScreenTitle: AppConstants.serverError),
                  ),
                ),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("${expense?.title}")],
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
            GestureDetector(
              onTap: () {
                // return DropDownButton<
              },
              child: const Icon(
                Icons.menu_outlined,
                size: 40,
              ),
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

  void _filterRecords(BuildContext ctx, HomeScreenViewModel model) async {
    DateTime? pickedDate;
    await showModalBottomSheet(
      context: ctx,
      builder: (context) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          constraints:
              const BoxConstraints(maxHeight: 200, maxWidth: double.infinity),
          decoration: const BoxDecoration(
              // border: Border.all(style: BorderStyle.solid),
              shape: BoxShape.rectangle,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12), topRight: Radius.circular(12))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                child: Text(
                  "Filter By Month",
                  style: TextStyle(
                      color: Theme.of(ctx).secondaryHeaderColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 20),
                ),
              ),
              Divider(
                height: 1,
                color: Theme.of(ctx).dividerColor,
                thickness: 0.5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 12.0),
                child: TextFormField(
                  onTap: () async {
                    pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(DateTime.now().year - 1),
                        lastDate: DateTime.now());
                  },
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w500),
                  controller: _dateController,
                  onTapOutside: (event) => () {},
                  keyboardType: TextInputType.none,
                  cursorColor: Theme.of(ctx).primaryColor,
                  decoration: InputDecoration(
                    hintText: "Pick the month",
                    label: Text(
                      "Month",
                      style:
                          TextStyle(color: Theme.of(ctx).secondaryHeaderColor),
                    ),
                    alignLabelWithHint: true,
                    fillColor: Theme.of(ctx).focusColor,
                    suffixIcon: Icon(
                      Icons.date_range,
                      color: Theme.of(context).primaryColorDark,
                      size: 30,
                      fill: 1,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(ctx);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(ctx).scaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      "Apply filter",
                      style: TextStyle(
                          color: Theme.of(ctx).secondaryHeaderColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );

    String formattedDate = DateFormat("yyyy-MM-dd").format(pickedDate!);
    _dateController.text = formattedDate;
    model.getRecordsByMonthsForScreens(formattedDate);
  }
}
