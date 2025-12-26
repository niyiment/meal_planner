// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Controller for all recipes

@ProviderFor(RecipeController)
const recipeControllerProvider = RecipeControllerProvider._();

/// Controller for all recipes
final class RecipeControllerProvider
    extends $AsyncNotifierProvider<RecipeController, List<RecipeEntity>> {
  /// Controller for all recipes
  const RecipeControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'recipeControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$recipeControllerHash();

  @$internal
  @override
  RecipeController create() => RecipeController();
}

String _$recipeControllerHash() => r'7f118cf287b9f40ec8ebf08a5625dd0a35c933b4';

/// Controller for all recipes

abstract class _$RecipeController extends $AsyncNotifier<List<RecipeEntity>> {
  FutureOr<List<RecipeEntity>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<List<RecipeEntity>>, List<RecipeEntity>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<RecipeEntity>>, List<RecipeEntity>>,
              AsyncValue<List<RecipeEntity>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// Provider for saved recipes (streaming)

@ProviderFor(savedRecipes)
const savedRecipesProvider = SavedRecipesProvider._();

/// Provider for saved recipes (streaming)

final class SavedRecipesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<RecipeEntity>>,
          List<RecipeEntity>,
          Stream<List<RecipeEntity>>
        >
    with
        $FutureModifier<List<RecipeEntity>>,
        $StreamProvider<List<RecipeEntity>> {
  /// Provider for saved recipes (streaming)
  const SavedRecipesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'savedRecipesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$savedRecipesHash();

  @$internal
  @override
  $StreamProviderElement<List<RecipeEntity>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<RecipeEntity>> create(Ref ref) {
    return savedRecipes(ref);
  }
}

String _$savedRecipesHash() => r'77d9b27742a85fa4738e2123a8171a18136fd9a8';

/// Provider for a single recipe by ID

@ProviderFor(recipeById)
const recipeByIdProvider = RecipeByIdFamily._();

/// Provider for a single recipe by ID

final class RecipeByIdProvider
    extends
        $FunctionalProvider<
          AsyncValue<RecipeEntity?>,
          RecipeEntity?,
          FutureOr<RecipeEntity?>
        >
    with $FutureModifier<RecipeEntity?>, $FutureProvider<RecipeEntity?> {
  /// Provider for a single recipe by ID
  const RecipeByIdProvider._({
    required RecipeByIdFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'recipeByIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$recipeByIdHash();

  @override
  String toString() {
    return r'recipeByIdProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<RecipeEntity?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<RecipeEntity?> create(Ref ref) {
    final argument = this.argument as String;
    return recipeById(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is RecipeByIdProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$recipeByIdHash() => r'988335ae0ac0ec234f27bbf09397c761d87a14d5';

/// Provider for a single recipe by ID

final class RecipeByIdFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<RecipeEntity?>, String> {
  const RecipeByIdFamily._()
    : super(
        retry: null,
        name: r'recipeByIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Provider for a single recipe by ID

  RecipeByIdProvider call(String id) =>
      RecipeByIdProvider._(argument: id, from: this);

  @override
  String toString() => r'recipeByIdProvider';
}

/// Provider for recent recipes (last 10)

@ProviderFor(recentRecipes)
const recentRecipesProvider = RecentRecipesProvider._();

/// Provider for recent recipes (last 10)

final class RecentRecipesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<RecipeEntity>>,
          List<RecipeEntity>,
          FutureOr<List<RecipeEntity>>
        >
    with
        $FutureModifier<List<RecipeEntity>>,
        $FutureProvider<List<RecipeEntity>> {
  /// Provider for recent recipes (last 10)
  const RecentRecipesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'recentRecipesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$recentRecipesHash();

  @$internal
  @override
  $FutureProviderElement<List<RecipeEntity>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<RecipeEntity>> create(Ref ref) {
    return recentRecipes(ref);
  }
}

String _$recentRecipesHash() => r'd74fa2d04a68747a56b3ec8a59b1583a758db471';

/// Provider for recipe search

@ProviderFor(RecipeSearch)
const recipeSearchProvider = RecipeSearchFamily._();

/// Provider for recipe search
final class RecipeSearchProvider
    extends $AsyncNotifierProvider<RecipeSearch, List<RecipeEntity>> {
  /// Provider for recipe search
  const RecipeSearchProvider._({
    required RecipeSearchFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'recipeSearchProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$recipeSearchHash();

  @override
  String toString() {
    return r'recipeSearchProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  RecipeSearch create() => RecipeSearch();

  @override
  bool operator ==(Object other) {
    return other is RecipeSearchProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$recipeSearchHash() => r'85ea4be61b15217e108ace852efa8d35bdcfbe3c';

/// Provider for recipe search

final class RecipeSearchFamily extends $Family
    with
        $ClassFamilyOverride<
          RecipeSearch,
          AsyncValue<List<RecipeEntity>>,
          List<RecipeEntity>,
          FutureOr<List<RecipeEntity>>,
          String
        > {
  const RecipeSearchFamily._()
    : super(
        retry: null,
        name: r'recipeSearchProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Provider for recipe search

  RecipeSearchProvider call(String query) =>
      RecipeSearchProvider._(argument: query, from: this);

  @override
  String toString() => r'recipeSearchProvider';
}

/// Provider for recipe search

abstract class _$RecipeSearch extends $AsyncNotifier<List<RecipeEntity>> {
  late final _$args = ref.$arg as String;
  String get query => _$args;

  FutureOr<List<RecipeEntity>> build(String query);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref =
        this.ref as $Ref<AsyncValue<List<RecipeEntity>>, List<RecipeEntity>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<RecipeEntity>>, List<RecipeEntity>>,
              AsyncValue<List<RecipeEntity>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
