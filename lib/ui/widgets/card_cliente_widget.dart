// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:customer_manager_flutter/data/model/cliente.dart';
import 'package:customer_manager_flutter/ui/widgets/delete_cliente_widget.dart';
import 'package:customer_manager_flutter/ui/widgets/updateAdd_cliente_widget.dart';

class CardClienteWidget extends StatefulWidget {
  final Cliente cliente;

  const CardClienteWidget({super.key, required this.cliente});

  @override
  State<CardClienteWidget> createState() => _CardClienteWidgetState();
}

class _CardClienteWidgetState extends State<CardClienteWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, right: 16, bottom: 8, left: 16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xFFE5E7EB),
        ),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 8,
            right: 16,
            bottom: 8,
            left: 16,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.cliente.name),
                  Text(widget.cliente.email),
                  Text(widget.cliente.phone),
                ],
              ),
              PopupMenuButton<String>(
                onSelected: (value) {
                  if (value == "editar") {
                    showDialog(
                      context: context,
                      builder: (context) => UpdateAddClienteWidget(
                        cliente: widget.cliente,
                        titulo: "Editar Cliente",
                      ),
                    );
                  } else if (value == "eliminar") {
                    showDialog(
                      context: context,
                      builder: (context) =>
                          DeleteClienteWidget(cliente: widget.cliente),
                    );
                  }
                },
                itemBuilder: (context) => [
                  const PopupMenuItem(value: "editar", child: Text("Editar")),
                  const PopupMenuItem(
                    value: "eliminar",
                    child: Text("Eliminar"),
                  ),
                ],
              ),
              // IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
            ],
          ),
        ),
      ),
    );
  }
}
