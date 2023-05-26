import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maasters/core/core.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return  AppBar(
        toolbarHeight: context.height * 0.1,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.width * 0.1),
          child: Align(
            alignment: Alignment.centerLeft,
            child: SvgPicture.asset(
              AppIcons.blueLogo,
              height: context.height * 0.075,
            ),
          ),
        ),
      );
  }
}
