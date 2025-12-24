import 'package:customer_manager_flutter/data/local/app_database.dart';
import 'package:customer_manager_flutter/data/repository/cliente_repository_impl.dart';
import 'package:customer_manager_flutter/ui/screens/home_screen.dart';
import 'package:customer_manager_flutter/viewmodel/cliente_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  final repository = ClienteRepositoryImpl(AppDatabase.instance);
  runApp(
    ChangeNotifierProvider(
      create: (_) {
        final vm = ClienteViewmodel(repository);
        vm.loadClientes();
        return vm;
      },
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
