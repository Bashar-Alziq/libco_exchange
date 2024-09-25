import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return ClayContainer(
      height: 150,
      width: 150,
      borderRadius: 100,
      // child: Image.asset('assets/imgs/ramizLogo.png'),
    );
  }
}
