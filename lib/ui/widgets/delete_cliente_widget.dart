// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:customer_manager_flutter/viewmodel/cliente_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:customer_manager_flutter/data/model/cliente.dart';

class DeleteClienteWidget extends StatelessWidget {
  final Cliente cliente;
  const DeleteClienteWidget({super.key, required this.cliente});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "¿Eliminar Cliente?",
        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
      ),
      content: SizedBox(
        height: 87,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Seguro que desea eliminar al Cliente:"),
            SizedBox(height: 15),
            Text(
              "ID: ${cliente.id}",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "DNI: ${cliente.dni}",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "Nombre: ${cliente.name}",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(null),
          child: Text("Cancelar"),
        ),
        TextButton(
          onPressed: () => _onDelete(context),
          child: Text("Eliminar"),
        ),
      ],
    );
  }

  void _onDelete(BuildContext context) {
    context.read<ClienteViewmodel>().deleteCliente(cliente.id!);
    Navigator.pop(context);
  }
}
