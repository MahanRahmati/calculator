import 'package:flutter/material.dart';

import '/strings.dart';

class InfoPage extends StatelessWidget {
  static const routeName = '/info_page';
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Strings.about,
          style: Theme.of(context).textTheme.bodyText2,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
    );
  }
}
