import '../model/cliente.dart';

abstract class ClienteRepository {
  Future<List<Cliente>> getClientes();

  Future<int> insertCliente(Cliente cliente);

  Future<int> updateCliente(Cliente cliente);

  Future<int> deleteCliente(int id);
}
