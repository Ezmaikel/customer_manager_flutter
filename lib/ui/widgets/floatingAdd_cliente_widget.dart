import 'package:flutter/material.dart';
import 'package:customer_manager_flutter/ui/widgets/updateAdd_cliente_widget.dart';

class FloatingaddClienteWidget extends StatelessWidget {
  const FloatingaddClienteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const CircleBorder(),
      backgroundColor: const Color(0xFFE5E7EB),
      onPressed: () {
        showDialog(
          context: context,
          builder: (_) => const UpdateAddClienteWidget(
            titulo: "Agregar Cliente",
            cliente: null,
          ),
        );
      },
      child: const Icon(Icons.add),
    );
  }
}
