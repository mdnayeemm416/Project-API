// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'project_list_bloc.dart';

@immutable
sealed class ProjectListState {}

final class ProjectListInitial extends ProjectListState {}

class ProjectListDataLoadingState extends ProjectListState {}

class ProjectListDataSuccessState extends ProjectListState {
  final Projectlistmodel projectlistmodel;
  ProjectListDataSuccessState({
    required this.projectlistmodel,
  });
}

class ProjectListDataErrorState extends ProjectListState{
  
}
