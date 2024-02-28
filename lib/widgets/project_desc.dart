// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:assignment_task/App_constant/app_constant.dart';

class ProjectDescWidget extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  const ProjectDescWidget({
    Key? key,
    required this.text,
    required this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSize.height(context) * .35,
      child: Text(
        text,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: textStyle,
      ),
    );
  }
}
