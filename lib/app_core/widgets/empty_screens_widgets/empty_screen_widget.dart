import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../style/images/assets.gen.dart';

class EmptyScreenWidget extends StatelessWidget {
  EmptyScreenWidget({Key? key, this.height = 300}) : super(key: key);
  double height;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Lottie.asset(Assets.lottie.empty.path,
            height: height, fit: BoxFit.cover));
  }
}
