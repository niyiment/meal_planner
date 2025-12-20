import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';

import '../../features/recipe/domain/entities/recipe_entity.dart';

part 'app_database.g.dart';

/// Recipes table
class Recipes extends Table {
  TextColumn get id => text()();
  TextColumn get name => text().withLength(min: 1, max: 200)();
  TextColumn get description => text()();
  TextColumn get ingredients => text()(); // JSON array
  TextColumn get steps => text()(); // JSON array
  TextColumn get nutritionInfo => text().nullable()(); // JSON object
  IntColumn get cookingTime => integer().nullable()();
  IntColumn get servings => integer().nullable()();
  TextColumn get complexity => text().withDefault(const Constant('medium'))();
  TextColumn get tags => text().withDefault(const Constant('[]'))(); // JSON array
  TextColumn get imageUrl => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime().nullable()();
  BoolColumn get isSaved => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}

/// Search history table
class SearchHistory extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get query => text()();
  DateTimeColumn get searchedAt => dateTime()();
}

/// App Database
@DriftDatabase(tables: [Recipes, SearchHistory])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        // Handle migrations here when schema version changes
      },
    );
  }

  // Recipe operations
  Future<List<Recipe>> getAllRecipes() => select(recipes).get();

  Future<Recipe?> getRecipeById(String id) =>
      (select(recipes)..where((r) => r.id.equals(id))).getSingleOrNull();

  Future<List<Recipe>> getSavedRecipes() =>
      (select(recipes)..where((r) => r.isSaved.equals(true))).get();

  Future<int> insertRecipe(RecipesCompanion recipe) =>
      into(recipes).insert(recipe);

  Future<bool> updateRecipe(RecipesCompanion recipe) =>
      update(recipes).replace(recipe);

  Future<int> deleteRecipe(String id) =>
      (delete(recipes)..where((r) => r.id.equals(id))).go();

  Future<int> deleteAllRecipes() => delete(recipes).go();

  Stream<List<Recipe>> watchAllRecipes() => select(recipes).watch();

  Stream<List<Recipe>> watchSavedRecipes() =>
      (select(recipes)..where((r) => r.isSaved.equals(true))).watch();

  // Search history operations
  Future<List<SearchHistoryData>> getSearchHistory({int limit = 10}) =>
      (select(searchHistory)
        ..orderBy([(h) => OrderingTerm.desc(h.searchedAt)])
        ..limit(limit))
          .get();

  Future<int> addSearchHistory(String query) => into(searchHistory).insert(
    SearchHistoryCompanion.insert(
      query: query,
      searchedAt: DateTime.now(),
    ),
  );

  Future<int> clearSearchHistory() => delete(searchHistory).go();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'ai_meal_planner.db'));
    return NativeDatabase(file);
  });
}
