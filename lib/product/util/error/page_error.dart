import 'package:bookapp/core/theme/theme.dart';
import 'package:flutter/material.dart';

class BasicError extends StatelessWidget {
  final String errMessage;
  const BasicError({super.key, this.errMessage = "Bir hata oluştu"});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Image(
              width: 180,
              height: 180,
              image: AssetImage(
                "assets/images/error.png",
              ),
            ),
          ),
          Text(
            errMessage,
            style: MyTheme.titleBigGrey,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
