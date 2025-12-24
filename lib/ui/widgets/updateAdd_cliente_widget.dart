import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:customer_manager_flutter/data/model/cliente.dart';
import 'package:customer_manager_flutter/viewmodel/cliente_viewmodel.dart';

class UpdateAddClienteWidget extends StatefulWidget {
  final Cliente? cliente;
  final String titulo;

  const UpdateAddClienteWidget({super.key, required this.titulo, this.cliente});

  bool get isEdit => cliente != null;

  @override
  State<UpdateAddClienteWidget> createState() => _UpdateAddClienteWidgetState();
}

class _UpdateAddClienteWidgetState extends State<UpdateAddClienteWidget> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController dniController;
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;

  @override
  void initState() {
    super.initState();

    dniController = TextEditingController(text: widget.cliente?.dni);

    nameController = TextEditingController(text: widget.cliente?.name);

    emailController = TextEditingController(text: widget.cliente?.email);

    phoneController = TextEditingController(text: widget.cliente?.phone);
  }

  @override
  void dispose() {
    dniController.dispose();
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.titulo),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildInputInt(dniController, 'DNI'),
              _buildInputText(nameController, 'Nombre'),
              _buildInputText(emailController, 'Email'),
              _buildInputInt(phoneController, 'Teléfono'),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancelar'),
        ),
        ElevatedButton(
          onPressed: () {
            _onSubmit();
          },
          child: Text(widget.isEdit ? 'Actualizar' : 'Guardar'),
        ),
      ],
    );
  }

  /// 🔽 MÉTODOS PRIVADOS

  void _onSubmit() {
    if (!_formKey.currentState!.validate()) return;
    if (widget.isEdit) {
      _updateCliente();
    } else {
      _addCliente();
    }
    Navigator.pop(context);
  }

  void _addCliente() {
    final newCliente = Cliente(
      id: null,
      dni: dniController.text.toString(),
      name: nameController.text,
      email: emailController.text,
      phone: phoneController.text.toString(),
    );

    context.read<ClienteViewmodel>().addCliente(newCliente);
  }

  void _updateCliente() {
    final updateCliente = widget.cliente!.copyWith(
      dni: dniController.text.toString(),
      name: nameController.text,
      email: emailController.text,
      phone: phoneController.text.toString(),
    );

    context.read<ClienteViewmodel>().updateCliente(updateCliente);
  }

  Widget _buildInputText(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(labelText: label),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Este $label es OBLIGATORIO";
          }
          return null;
        },
      ),
    );
  }

  Widget _buildInputInt(TextEditingController controller, String label) {
    switch (label) {
      case "DNI":
        return _buildInputIntText(controller, label, 8);
      case "Teléfono":
        return _buildInputIntText(controller, label, 9);
      default:
        return _buildInputIntText(controller, label, 12);
    }
  }

  Widget _buildInputIntText(
    TextEditingController controller,
    String label,
    int length,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        maxLength: length,
        keyboardType: TextInputType.number,
        controller: controller,
        decoration: InputDecoration(labelText: label),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Este $label es OBLIGATORIO";
          }
          return null;
        },
      ),
    );
  }
}
