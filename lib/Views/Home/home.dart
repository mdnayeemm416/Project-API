import 'package:assignment_task/App_constant/app_constant.dart';
import 'package:assignment_task/Views/Home/components/project_list.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(AppSize.height20(context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    DateFormat.yMMMMd().format(DateTime.now()),
                    style: mediumText,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Project Details",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 15,
              ),
              const Expanded(child: ProjectList())
            ],
          ),
        ),
      ),
    );
  }
}
