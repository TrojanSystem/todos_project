import 'package:example/model/project_list_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProjectList {
  Future<Database> database() async {
    return openDatabase(
      join(await getDatabasesPath(), 'projectTodo.db'),
      onCreate: (db, version) async {
        await db.execute(
          '''CREATE TABLE projectTodo(id INTEGER PRIMARY KEY, todo TEXT, indexs TEXT)''',
        );
      },
      version: 1,
    );
  }

  Future<int> insertTask(ProjectListModel task) async {
    Database db = await database();
    int data = await db.insert('projectTodo', task.toMap());
    return data;
  }

  Future<List<ProjectListModel>> getTasks() async {
    Database db = await database();
    var tasks = await db.query('projectTodo');
    List<ProjectListModel> tasksList = tasks.isNotEmpty
        ? tasks.map((e) => ProjectListModel.fromMap(e)).toList()
        : [];
    return tasksList;
  }

  Future<bool> updateTaskList(ProjectListModel item) async {
    final Database db = await database();
    final rows = await db.update(
      'projectTodo',
      item.toMap(),
      where: 'id = ?',
      whereArgs: [item.indexs],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return rows > 0;
  }

  Future<void> deleteTask(int id) async {
    Database _db = await database();
    await _db.rawDelete("DELETE FROM projectTodo WHERE id = '$id'");
  }
}
