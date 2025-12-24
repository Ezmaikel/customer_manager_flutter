import 'package:customer_manager_flutter/data/local/app_database.dart';
import 'package:customer_manager_flutter/data/model/cliente.dart';
import 'cliente_repository.dart';

class ClienteRepositoryImpl implements ClienteRepository {
  final AppDatabase _database;

  ClienteRepositoryImpl(this._database);

  @override
  Future<List<Cliente>> getClientes() async {
    return await _database.getClientes();
  }

  @override
  Future<int> insertCliente(Cliente cliente) async {
    return await _database.insertCliente(cliente);
  }

  @override
  Future<int> updateCliente(Cliente cliente) async {
    return await _database.updateCliente(cliente);
  }

  @override
  Future<int> deleteCliente(int id) async {
    return await _database.deleteCliente(id);
  }
}
