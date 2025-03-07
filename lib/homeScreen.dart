import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_project_riverpod/main.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
   return ref.watch(fetchUser).when(
          data: (data) {
            print('data is $data');return Scaffold(
              appBar: AppBar(),
              body: Center(
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Text(data.name??''),
                    SizedBox(height: 20),
                    Text(data.email??''),
                    SizedBox(height: 20),
                    Text(data.username??''),
                    SizedBox(height: 20),   Text(data.email??''),
                    SizedBox(height: 20),   Text(data.id.toString()??''),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            );
          },
          error: (error, stackTrace) {
            print('error is $error');
            return const Center(child: Text('no data found'));
          },
          loading: () {
            return Center(child: const CircularProgressIndicator(color: Colors.red,));
          },
        );

  }
}
