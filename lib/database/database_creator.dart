import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../model/task_model.dart';

class DatabaseHelper {
  Future<Database> database() async {
    return openDatabase(
      join(await getDatabasesPath(), 'taskList.db'),
      onCreate: (db, version) async {
        await db.execute(
          '''CREATE TABLE taskList(id INTEGER PRIMARY KEY, title TEXT, description TEXT)''',
        );
      },
      version: 1,
    );
  }

  Future<int> insertTask(Task task) async {
    Database db = await database();
    int data = await db.insert('taskList', task.toMap());
    return data;
  }

  Future<List<Task>> getTasks() async {
    Database db = await database();
    var tasks = await db.query('taskList');
    List<Task> tasksList =
        tasks.isNotEmpty ? tasks.map((e) => Task.fromMap(e)).toList() : [];
    return tasksList;
  }

  Future<bool> updateTaskList(Task item) async {
    final Database db = await database();
    final rows = await db.update(
      'taskList',
      item.toMap(),
      where: 'id = ?',
      whereArgs: [item.id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return rows > 0;
  }

  Future<void> deleteTask(int id) async {
    Database _db = await database();
    await _db.rawDelete("DELETE FROM taskList WHERE id = '$id'");
  }
}
