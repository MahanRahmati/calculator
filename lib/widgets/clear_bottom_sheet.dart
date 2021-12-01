import 'package:flutter/material.dart';

import '/helpers/functions.dart';
import '/strings.dart';
import '/styles.dart';

class ClearBottomSheet extends StatelessWidget {
  const ClearBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(Styles.padding * 2),
            child: FittedBox(
              child: Text(Strings.clearHistory, style: TextStyle(fontSize: 22)),
            ),
          ),
          Container(
            padding: Styles.ltrb,
            height: Styles.buttonHeight + (Styles.padding * 4),
            child: Row(
              children: [
                const SizedBox(width: Styles.padding),
                Expanded(
                  child: SizedBox(
                    height: Styles.buttonHeight,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: buttonColor(context),
                      ),
                      child: const Text(Strings.cancel),
                      onPressed: () => Navigator.of(context).pop(false),
                    ),
                  ),
                ),
                const SizedBox(width: Styles.padding * 2),
                Expanded(
                  child: SizedBox(
                    height: Styles.buttonHeight,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: buttonColor(context),
                      ),
                      child: const Text(
                        Strings.clear,
                        style: TextStyle(color: Styles.secondaryColor1),
                      ),
                      onPressed: () => Navigator.of(context).pop(true),
                    ),
                  ),
                ),
                const SizedBox(width: Styles.padding),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
