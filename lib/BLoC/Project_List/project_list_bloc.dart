import 'dart:async';
import 'dart:convert';

import 'package:assignment_task/Model/project_list_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
part 'project_list_event.dart';
part 'project_list_state.dart';

class ProjectListBloc extends Bloc<ProjectListEvent, ProjectListState> {
  ProjectListBloc() : super(ProjectListInitial()) {
    on<ProjectListDataSuccessEvent>(projectListDataSuccessEvent);
  }

  Future<FutureOr<void>> projectListDataSuccessEvent(
      ProjectListDataSuccessEvent event, Emitter<ProjectListState> emit) async {
         try {
      final response = await http.get(
        Uri.parse(
            'http://scubetech.xyz/projects/dashboard/all-project-elements/?format=json'),
      );
      if (response.statusCode == 200) {
        final projectlist =
            Projectlistmodel.fromJson(json.decode(response.body));

        emit(ProjectListDataSuccessState(projectlistmodel: projectlist));
      } else {
        // Emit an error state if the HTTP request fails
        print("sdfsdf");
      }
    } catch(e){
      debugPrint(e.toString());
    }
      }
}
