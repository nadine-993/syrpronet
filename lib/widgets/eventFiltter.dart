import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/providers/buttonProvider.dart';
import '../networking/constants.dart';

class EventFiltter extends StatelessWidget {
  const EventFiltter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Provider.of<ButtonProvider>(context).all),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  onPressed: () {
                    if (Provider.of<ButtonProvider>(context, listen: false)
                        .all ==
                        kPrimaryColor) {
                      Provider.of<ButtonProvider>(context, listen: false).all =
                          Colors.transparent;
                    } else {
                      Provider.of<ButtonProvider>(context, listen: false).all =
                          kPrimaryColor;
                    }
                  },
                  child: const Text(
                    'All',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: kFontStyle),
                  )),
            ),
            SizedBox(
              width: width * 0.02,
            ),
            Expanded(
              flex: 2,
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Provider.of<ButtonProvider>(context).tomorrow),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  onPressed: () {
                    if (Provider.of<ButtonProvider>(context, listen: false)
                        .tomorrow ==
                        Colors.transparent) {
                      Provider.of<ButtonProvider>(context, listen: false)
                          .tomorrow = kPrimaryColor;
                    } else {
                      Provider.of<ButtonProvider>(context, listen: false)
                          .tomorrow = Colors.transparent;
                    }
                  },
                  child: const Text(
                    'Tomorrow',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: kFontStyle),
                  )),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Provider.of<ButtonProvider>(context).afterTomorrow),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  onPressed: () {
                    if (Provider.of<ButtonProvider>(context, listen: false)
                        .afterTomorrow ==
                        Colors.transparent) {
                      Provider.of<ButtonProvider>(context, listen: false)
                          .afterTomorrow = kPrimaryColor;
                    } else {
                      Provider.of<ButtonProvider>(context, listen: false)
                          .afterTomorrow = Colors.transparent;
                    }
                  },
                  child: const Text(
                    'After Tomorrow',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: kFontStyle),
                  )),
            ),
            SizedBox(
              width: width * 0.02,
            ),
            Expanded(
              flex: 1,
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Provider.of<ButtonProvider>(context).today),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  onPressed: () {
                    if (Provider.of<ButtonProvider>(context, listen: false)
                        .today ==
                        Colors.transparent) {
                      Provider.of<ButtonProvider>(context, listen: false)
                          .today = kPrimaryColor;
                    } else {
                      Provider.of<ButtonProvider>(context, listen: false)
                          .today = Colors.transparent;
                    }
                  },
                  child: Text(
                    'Today',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: kFontStyle),
                  )),
            ),
          ],
        )
      ],
    );
  }
}
