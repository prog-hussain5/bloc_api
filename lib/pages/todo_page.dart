import 'package:bloc_api/bloc/todos_bloc.dart';
import 'package:bloc_api/widgets/error_widgit.dart';
import 'package:bloc_api/widgets/loading_widgit.dart';
import 'package:bloc_api/widgets/todo_widgit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class TodosPage extends StatelessWidget {
  const TodosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Todos"),
      ),
      body: BlocBuilder<TodosBloc, TodosState>(
         builder: (context, state) {
         if (state is LoadedState) {
           return TodosWidget(todos: state.todos);
         } else if (state is ErrorState) {
           return MyErrorWidget(message: state.message);
         } else {
            return const LoadingWidget();
         }
       },
       )
    );
  }
}