import 'package:customer_manager_flutter/ui/widgets/card_cliente_widget.dart';
import 'package:customer_manager_flutter/viewmodel/cliente_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeBodyScreen extends StatefulWidget {
  const HomeBodyScreen({super.key});

  @override
  State<HomeBodyScreen> createState() => _HomeBodyScreenState();
}

class _HomeBodyScreenState extends State<HomeBodyScreen> {
  @override
  Widget build(BuildContext context) {
    final vm = context.watch<ClienteViewmodel>();
    if (vm.isloading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (vm.errorMessage != null) {
      return Center(child: Text(vm.errorMessage!));
    }
    return Column(
      children: [
        Expanded(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 16,
                    left: 16,
                    bottom: 8,
                    right: 16,
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hint: Text("Introduce nombre del cliente"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    onChanged: (text) {
                      vm.searchCliente(text);
                    },
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: vm.clientes.length,
                    itemBuilder: (_, index) {
                      final cliente = vm.clientes[index];
                      return CardClienteWidget(cliente: cliente);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
