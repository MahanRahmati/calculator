import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/helpers/functions.dart';
import '/models/history.dart';
import '/strings.dart';
import '/styles.dart';
import '/widgets/clear_bottom_sheet.dart';

class HistoryPage extends StatelessWidget {
  static const routeName = '/history_page';

  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _history = Provider.of<HistoryList>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Strings.history,
          style: Theme.of(context).textTheme.bodyText2,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outlined),
            onPressed: () async {
              bool value = await showBottomSheetWidget(
                    const ClearBottomSheet(),
                    context,
                  ) ??
                  false;
              if (value) {
                _history.deleteHistory(context);
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: _history.items.length,
        itemBuilder: (ctx, index) => Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: Styles.ltrb,
              alignment: Alignment.centerRight,
              child: Text(_history.items[index].input),
            ),
            Container(
              padding: Styles.ltrb,
              alignment: Alignment.centerRight,
              child: Text(
                _history.items[index].value,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            )
          ],
        ),
      ),
    );
  }
}
