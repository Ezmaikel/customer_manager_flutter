import 'package:customer_manager_flutter/data/model/cliente.dart';
import 'package:customer_manager_flutter/data/repository/cliente_repository.dart';
import 'package:flutter/material.dart';

class ClienteViewmodel extends ChangeNotifier {
  final ClienteRepository _repository;

  ClienteViewmodel(this._repository);

  List<Cliente> _clientes = [];
  List<Cliente> clientes = [];
  bool isloading = false;
  String? errorMessage;

  Future<void> loadClientes() async {
    isloading = true;
    errorMessage = null;
    notifyListeners();

    try {
      _clientes = await _repository.getClientes();
      clientes = List.from(_clientes);
      isloading = false;
      if (clientes.isEmpty) {
        errorMessage = "No hay Clientes";
      }
    } catch (e) {
      errorMessage = "Error al cargar Clientes: $e";
    } finally {
      isloading = false;
      notifyListeners();
    }
  }

  void searchCliente(String query) async {
    notifyListeners();
    if (query.trim().isEmpty) {
      clientes = List.from(_clientes);
    } else {
      clientes = _clientes.where((cliente) {
        final q = query.toLowerCase();
        return cliente.name.toLowerCase().contains(q) ||
            cliente.dni.toLowerCase().contains(q);
      }).toList();
    }
  }

  Future<void> addCliente(Cliente cliente) async {
    await _repository.insertCliente(cliente);
    await loadClientes();
  }

  Future<void> updateCliente(Cliente cliente) async {
    try {
      isloading = true;
      notifyListeners();

      await _repository.updateCliente(cliente);
      await loadClientes();
    } catch (e) {
      errorMessage = "Error al actualizar cliente: $e";
    } finally {
      isloading = false;
      notifyListeners();
    }
  }

  Future<void> deleteCliente(int cliente) async {
    try {
      isloading = true;
      notifyListeners();

      await _repository.deleteCliente(cliente);
      await loadClientes();
    } catch (e) {
      errorMessage = "Error al actualizar cliente: $e";
    } finally {
      isloading = false;
      notifyListeners();
    }
  }
}
