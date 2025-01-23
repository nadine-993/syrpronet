import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:syrpronet/widgets/share.dart';

class CustomAppBarCard extends StatelessWidget {
  const CustomAppBarCard({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    double? height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
                width: width * .10,
                height: height * .045,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/icons/arrow-right.svg',
                    width: width * 0.05,
                  ),
                )),
          ),
          SizedBox(
            width: width * 0.15,
          ),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.black87,
              fontFamily: 'MontserratBold',
            ),
          ),
          SizedBox(
            width: width * 0.23,
          ),

        ],
      ),
    );
  }
}
