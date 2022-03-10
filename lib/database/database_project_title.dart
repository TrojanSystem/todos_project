import 'package:example/model/project_title_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProjectTitle {
  Future<Database> database() async {
    return openDatabase(
      join(await getDatabasesPath(), 'projectTitle.db'),
      onCreate: (db, version) async {
        await db.execute(
          '''CREATE TABLE projectTitle(id INTEGER PRIMARY KEY, title TEXT)''',
        );
      },
      version: 1,
    );
  }

  Future<int> insertTask(ProjectTitleModel task) async {
    Database db = await database();
    int data = await db.insert('projectTitle', task.toMap());
    return data;
  }

  Future<List<ProjectTitleModel>> getTasks() async {
    Database db = await database();
    var tasks = await db.query('projectTitle');
    List<ProjectTitleModel> tasksList = tasks.isNotEmpty
        ? tasks.map((e) => ProjectTitleModel.fromMap(e)).toList()
        : [];
    return tasksList;
  }

  Future<bool> updateTaskList(ProjectTitleModel item) async {
    final Database db = await database();
    final rows = await db.update(
      'projectTitle',
      item.toMap(),
      where: 'id = ?',
      whereArgs: [item.id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return rows > 0;
  }

  Future<void> deleteTask(int id) async {
    Database _db = await database();
    await _db.rawDelete("DELETE FROM projectTitle WHERE id = '$id'");
  }
}
