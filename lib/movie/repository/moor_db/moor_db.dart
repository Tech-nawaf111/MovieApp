// import 'package:moor_flutter/moor_flutter.dart';
// part 'tables.g.dart';
//
// class movies_detail extends Table {
//   TextColumn get movie_name =>
//       text().named('user_name').customConstraint('UNIQUE')();
//   TextColumn get watchMode => text().named('popular')();
//   @override
//   Set<Column> get primaryKey => {movie_id};
//   DateTimeColumn get modifiedDate => dateTime().nullable()();
// }
// // this annotation tells moor to prepare a database class that uses the tables we just defined. (Modes in our case)
// @UseMoor(tables: [Modes])
// class MyDatabase extends _$MyDatabase {
//
//   MyDatabase()
//       : super(FlutterQueryExecutor.inDatabaseFolder(
//     path: 'db.sqlite',
//   ));
//   @override
//   int get schemaVersion => 1;
//   Future<List<Mode>> get allWatchingModes => select(modes).get();
//   Stream<List<Mode>> get watchAllModes => select(modes).watch();
// }
//
// @UseDao(tables: [Modes])
// class ModesDao extends DatabaseAccessor<MyDatabase> with _$ModesDaoMixin {
//   ModesDao(MyDatabase db) : super(db);
//   Future<List<Mode>> get allWatchingMovies => select(modes).get();
//   Stream<List<Mode>> get watchAllMovies => select(modes).watch();
// }

