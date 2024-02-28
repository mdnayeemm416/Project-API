import 'package:assignment_task/App_constant/app_constant.dart';
import 'package:assignment_task/BLoC/Project_List/project_list_bloc.dart';
import 'package:assignment_task/widgets/menu_item.dart';
import 'package:assignment_task/widgets/project_desc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProjectList extends StatefulWidget {
  const ProjectList({super.key});

  @override
  State<ProjectList> createState() => _ProjectListState();
}

class _ProjectListState extends State<ProjectList> {
  final ProjectListBloc projectListBloc = ProjectListBloc();

  @override
  void initState() {
    projectListBloc.add(ProjectListDataSuccessEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProjectListBloc, ProjectListState>(
      bloc: projectListBloc,
      listener: (context, state) {},
      builder: (context, state) {
        switch (state.runtimeType) {
          case ProjectListDataLoadingState:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case ProjectListDataSuccessState:
            return ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    decoration: const BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 171, 169, 169),
                        blurRadius: 1,
                      ),
                      BoxShadow(
                        color: Color.fromARGB(255, 255, 255, 255),
                        blurRadius: 1,
                      )
                    ], borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Image.asset(
                            "images/projectlist.png",
                            height: AppSize.height(context) * .05,
                          ),
                        ),
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ProjectDescWidget(
                                text: "Project Name: Nawab",
                                textStyle: mediumText),
                            ProjectDescWidget(
                                text:
                                    "Project Update: Starting the project on 24th feb",
                                textStyle: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black)),
                            ProjectDescWidget(
                                text: "Assigned Engineer: Md Nayeem",
                                textStyle: smallText),
                            ProjectDescWidget(
                                text: "Assigned Technician: Md Nayeem",
                                textStyle: smallText),
                            Text(
                              "Start Date : 24/08/2024",
                              style: smallText,
                            ),
                            Text(
                              "End Date : 24/08/2024",
                              style: smallText,
                            ),
                          ],
                        ),
                        Expanded(child: PopupMenuButton(itemBuilder: (context) {
                          return MenuItem.choice.map((String choice) {
                            return PopupMenuItem(
                                value: choice,
                                child: ListTile(
                                  title: Text(
                                    choice,
                                    style: smallText,
                                  ),
                                  leading: Icon(
                                    MenuItem.choiceIcon[choice],
                                    size: 15,
                                  ),
                                ));
                          }).toList();
                        }))
                      ],
                    ),
                  );
                });
          default:
            return const Expanded(child: Center(child: Text(" Error")));
        }
      },
    );
  }
}
