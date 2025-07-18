import 'package:expense_tracker/core/utils/unified_response_wrapper.dart';
import 'package:flutter/material.dart';

abstract class BaseNotifier extends ChangeNotifier {
  bool isLoading = true;
  bool apiError = false;
  String? apiErrorMessage;

  void setError(bool isError, String? errorMessage) {
    if (isError) {
      apiError = true;
      apiErrorMessage = errorMessage;
    } else {
      apiError = false;
      apiErrorMessage = null;
    }
  }

  @mustCallSuper
  void initModel() {
    isLoading = true;
  }

  void setLoading(bool isLoading) {
    if (this.isLoading == isLoading) {
      return;
    }
    this.isLoading = isLoading;
    notifyListeners();
  }

  void notify() {
    notifyListeners();
  }
}
