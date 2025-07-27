import 'package:expense_tracker/features/presentation/common/state_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../../../../../core/utils/common_widgets.dart';
import 'add_expense_view_model.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({
    super.key,
  });

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState
    extends StateViewModel<AddExpenseScreen, AddExpenseViewModel> {
  final _formKey = GlobalKey<FormState>();

  final _titleController = TextEditingController();

  final _descController = TextEditingController();

  final _amountController = TextEditingController();

  final _dateController = TextEditingController();

  // final DateTime? selectedDate;
  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    _amountController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      padding: const EdgeInsets.only(bottom: 30),
      child: uiUpdate(
        builder: (model) => model.isLoading
            ? Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                height: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    bottomSheetHeader(
                        ctx: context,
                        headerTitle: "Add Expense",
                        closeButtonNeeded: true,
                        backgroundColor: Theme.of(context).primaryColorDark),
                    const Expanded(
                      flex: 1,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ],
                ),
              )
            : SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    bottomSheetHeader(
                        ctx: context,
                        headerTitle: "Add Expense",
                        closeButtonNeeded: true,
                        backgroundColor: Theme.of(context).primaryColorDark),
                    Form(
                      key: _formKey,
                      autovalidateMode: AutovalidateMode.always,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 12.0),
                        child: Column(
                          children: [
                            TextFormField(
                              keyboardType: TextInputType.text,
                              controller: _titleController,
                              decoration: InputDecoration(
                                  label: Text("Title"), hintText: "Title"),
                              validator: (value) {
                                if (value!.length < 4) {
                                  return "The title should be at least 4 letters long";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.text,
                              controller: _descController,
                              decoration: InputDecoration(
                                  label: Text("Description"),
                                  hintText: "Description"),
                              validator: (value) {
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: _amountController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  label: Text("Amount"), hintText: "Amount"),
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              validator: (value) {},
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              readOnly: true,
                              controller: _dateController,
                              decoration: InputDecoration(
                                  label: Text("Date"), hintText: "Date"),
                              onTap: () async {
                                final DateTime? selectedDate =
                                    await showDatePicker(
                                        context: context,
                                        barrierDismissible: true,
                                        fieldLabelText: "Date",
                                        barrierLabel: "Date Picker",
                                        initialDate: DateTime.now(),
                                        lastDate: DateTime.now(),
                                        firstDate: DateTime(
                                          DateTime.now().year - 1,
                                        ));

                                if (selectedDate != null) {
                                  _dateController.text =
                                      DateFormat('dd-MM-yyyy')
                                          .format(selectedDate);

                                  //     DateTime(
                                  //   selectedDate.year,
                                  //   selectedDate.month,
                                  //   selectedDate.day,
                                  // ).toString();
                                }
                              },
                              keyboardType: TextInputType.datetime,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Theme.of(context).primaryColorLight,
                                elevation: 0.5,
                                foregroundColor: Theme.of(context).primaryColor,
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  debugPrint("Calling Api for addition");
                                  model.addExpense(
                                      ctx: context,
                                      title: _titleController.text,
                                      amount: _amountController.text,
                                      dateOfExpense: _dateController.text,
                                      description: _descController.text);
                                } else {
                                  debugPrint("Validation Failed ");
                                }
                              },
                              child: const Text(
                                "Submit",
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
