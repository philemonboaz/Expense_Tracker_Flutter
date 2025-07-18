import 'package:expense_tracker/features/presentation/common/state_view_model.dart';
import 'package:flutter/material.dart';

import 'history_screen_view_model.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState
    extends StateViewModel<HistoryScreen, HistoryScreenViewModel> {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return uiUpdate(
      builder: (model) => model.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: model.historyData.length,
              controller: _scrollController,
              itemBuilder: (context, index) {
                return Card(
                  child: Text(model.historyData[index].title),
                );
              },
            ),
    );
  }
}
