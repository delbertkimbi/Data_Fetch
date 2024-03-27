import 'package:data_fetch/cubit/users_cubit.dart';
import 'package:data_fetch/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: BlocBuilder<UsersCubit, List<User>>(builder: (context, users) {
        if (users is UsersInitial || users is UsersLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (users is UsersLoaded) {
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return Card(
                  child: ListTile(
                title: Text(user.firstName),
              ));
            },
          );
        }
        return const SizedBox();
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final cubit = context.read<UsersCubit>();
          cubit.getUsers();
        },
        tooltip: 'Fetch Users',
        child: const Icon(Icons.add),
      ),
    );
  }
}
