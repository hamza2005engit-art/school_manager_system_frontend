import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqlDb {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await intialDb();
      return _db;
    } else {
      return _db;
    }
  }

  intialDb() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'hamza.db');
    Database mydb = await openDatabase(path, onCreate: _onCreate, version: 6, onUpgrade: _onUpgrade);
    return mydb;
  }

  _onUpgrade(Database db, int oldversion, int newversion) async {
    print("onupgrade==============");
    if (oldversion < 5) {
      await db.execute("ALTER TABLE notes ADD COLUMN color TEXT");
    }
    if (oldversion < 6) {
      await db.execute('''
      CREATE TABLE IF NOT EXISTS "tasks"(
      "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
      "title" TEXT NOT NULL,
      "priority" TEXT NOT NULL,
      "dueDate" TEXT NOT NULL,
      "isCompleted" INTEGER NOT NULL DEFAULT 0
      )
      ''');
    }
  }

  _onCreate(Database db, int version) async {
    Batch batch = db.batch();

    batch.execute('''
    CREATE TABLE "notes"(
    "id" INTEGER  NOT NULL PRIMARY KEY AUTOINCREMENT,
    "title" TEXT NOT NULL,
    "note" TEXT NOT NULL,
    "color" TEXT NOT NULL
    )
    ''');

    batch.execute('''
    CREATE TABLE "students"(
    "id" INTEGER  NOT NULL PRIMARY KEY AUTOINCREMENT,
    "title" TEXT NOT NULL,
    "note" TEXT NOT NULL,
    "color" TEXT NOT NULL
    )
    ''');

    batch.execute('''
    CREATE TABLE "tasks"(
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "title" TEXT NOT NULL,
    "priority" TEXT NOT NULL,
    "dueDate" TEXT NOT NULL,
    "isCompleted" INTEGER NOT NULL DEFAULT 0
    )
    ''');

    await batch.commit();
    print("onCreate =============");
  }

//select
  readData(String sql) async {
    Database? mydb = await db;
    List<Map> response = await mydb!.rawQuery(sql);
    return response;
  }

//insert
  insertData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawInsert(sql);
    return response;
  }

//update
  updateData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawUpdate(sql);
    return response;
  }

//delete
  deleteData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawDelete(sql);
    return response;
  }

  mydeletDatabase() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'hamza.db');
    await deleteDatabase(path);
  }

/////

  read(String table) async {
    Database? mydb = await db;
    List<Map> response = await mydb!.query(table);
    return response;
  }

//insert
  insert(String table, Map<String, Object?> values) async {
    Database? mydb = await db;
    int response = await mydb!.insert(table, values);
    return response;
  }

//update
  update(String table, Map<String, Object?> values, String? mywhere) async {
    Database? mydb = await db;
    int response = await mydb!.update(table, values, where: mywhere);
    return response;
  }

//delete
  delete(String table, String? mywhere) async {
    Database? mydb = await db;
    int response = await mydb!.delete(table, where: mywhere);
    return response;
  }


// جلب كل المهام
  Future<List<Map>> getAllTasks() async {
    return await read('tasks');
  }

  Future<List<Map>> getPendingTasks() async {
    Database? mydb = await db;
    return await mydb!.query('tasks', where: 'isCompleted = ?', whereArgs: [0]);
  }

  Future<List<Map>> getCompletedTasks() async {
    Database? mydb = await db;
    return await mydb!.query('tasks', where: 'isCompleted = ?', whereArgs: [1]);
  }
  Future<int> addTask({
    required String title,
    required String priority,
    required String dueDate,
  }) async {
    return await insert('tasks', {
      'title': title,
      'priority': priority,
      'dueDate': dueDate,
      'isCompleted': 0,
    });
  }

  Future<int> toggleTaskCompleted(int id, int currentStatus) async {
    return await update(
      'tasks',
      {'isCompleted': currentStatus == 0 ? 1 : 0},
      'id = $id',
    );
  }

  Future<int> updateTask({
    required int id,
    required String title,
    required String priority,
    required String dueDate,
  }) async {
    return await update(
      'tasks',
      {
        'title': title,
        'priority': priority,
        'dueDate': dueDate,
      },
      'id = $id',
    );
  }

  Future<int> deleteTask(int id) async {
    return await delete('tasks', 'id = $id');
  }

}