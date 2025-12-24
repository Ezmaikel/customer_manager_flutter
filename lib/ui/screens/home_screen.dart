import 'package:customer_manager_flutter/ui/screens/home_body_screen.dart';
import 'package:customer_manager_flutter/ui/widgets/floatingAdd_cliente_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF111827),
        foregroundColor: Color(0xFFFFFFFF),
        title: Text("Gestor de Clientes"),
      ),
      body: HomeBodyScreen(),
      floatingActionButton: FloatingaddClienteWidget(),
    );
  }
}
