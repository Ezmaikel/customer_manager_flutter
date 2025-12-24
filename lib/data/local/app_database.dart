import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../model/cliente.dart';

class AppDatabase {
  static final AppDatabase instance = AppDatabase._internal();
  static Database? _database;

  AppDatabase._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDb();
    return _database!;
  }

  Future<Database> _initDb() async {
    final path = join(await getDatabasesPath(), 'clientes.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE clientes(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            dni TEXT,
            name TEXT,
            email TEXT,
            phone TEXT
          )
        ''');
      },
    );
  }

  Future<List<Cliente>> getClientes() async {
    final db = await database;
    final maps = await db.query('clientes');
    return maps.map((e) => Cliente.fromMap(e)).toList();
  }

  Future<int> insertCliente(Cliente cliente) async {
    final db = await database;
    return db.insert('clientes', cliente.toMap());
  }

  Future<int> updateCliente(Cliente cliente) async {
    final db = await database;
    return db.update(
      'clientes',
      cliente.toMap(),
      where: 'id = ?',
      whereArgs: [cliente.id],
    );
  }

  Future<int> deleteCliente(int id) async {
    final db = await database;
    return db.delete('clientes', where: 'id = ?', whereArgs: [id]);
  }
}
