// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scan_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ScanState {

 ScanStatus get status;@JsonKey(toJson: _fileToJson, fromJson: _jsonToFile) File? get selectedImage; List<String> get detectedIngredients; String? get streamingRecipe; String? get errorMessage; double get progress;
/// Create a copy of ScanState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScanStateCopyWith<ScanState> get copyWith => _$ScanStateCopyWithImpl<ScanState>(this as ScanState, _$identity);

  /// Serializes this ScanState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScanState&&(identical(other.status, status) || other.status == status)&&(identical(other.selectedImage, selectedImage) || other.selectedImage == selectedImage)&&const DeepCollectionEquality().equals(other.detectedIngredients, detectedIngredients)&&(identical(other.streamingRecipe, streamingRecipe) || other.streamingRecipe == streamingRecipe)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.progress, progress) || other.progress == progress));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,selectedImage,const DeepCollectionEquality().hash(detectedIngredients),streamingRecipe,errorMessage,progress);

@override
String toString() {
  return 'ScanState(status: $status, selectedImage: $selectedImage, detectedIngredients: $detectedIngredients, streamingRecipe: $streamingRecipe, errorMessage: $errorMessage, progress: $progress)';
}


}

/// @nodoc
abstract mixin class $ScanStateCopyWith<$Res>  {
  factory $ScanStateCopyWith(ScanState value, $Res Function(ScanState) _then) = _$ScanStateCopyWithImpl;
@useResult
$Res call({
 ScanStatus status,@JsonKey(toJson: _fileToJson, fromJson: _jsonToFile) File? selectedImage, List<String> detectedIngredients, String? streamingRecipe, String? errorMessage, double progress
});




}
/// @nodoc
class _$ScanStateCopyWithImpl<$Res>
    implements $ScanStateCopyWith<$Res> {
  _$ScanStateCopyWithImpl(this._self, this._then);

  final ScanState _self;
  final $Res Function(ScanState) _then;

/// Create a copy of ScanState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? selectedImage = freezed,Object? detectedIngredients = null,Object? streamingRecipe = freezed,Object? errorMessage = freezed,Object? progress = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ScanStatus,selectedImage: freezed == selectedImage ? _self.selectedImage : selectedImage // ignore: cast_nullable_to_non_nullable
as File?,detectedIngredients: null == detectedIngredients ? _self.detectedIngredients : detectedIngredients // ignore: cast_nullable_to_non_nullable
as List<String>,streamingRecipe: freezed == streamingRecipe ? _self.streamingRecipe : streamingRecipe // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [ScanState].
extension ScanStatePatterns on ScanState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScanState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScanState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScanState value)  $default,){
final _that = this;
switch (_that) {
case _ScanState():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScanState value)?  $default,){
final _that = this;
switch (_that) {
case _ScanState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ScanStatus status, @JsonKey(toJson: _fileToJson, fromJson: _jsonToFile)  File? selectedImage,  List<String> detectedIngredients,  String? streamingRecipe,  String? errorMessage,  double progress)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScanState() when $default != null:
return $default(_that.status,_that.selectedImage,_that.detectedIngredients,_that.streamingRecipe,_that.errorMessage,_that.progress);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ScanStatus status, @JsonKey(toJson: _fileToJson, fromJson: _jsonToFile)  File? selectedImage,  List<String> detectedIngredients,  String? streamingRecipe,  String? errorMessage,  double progress)  $default,) {final _that = this;
switch (_that) {
case _ScanState():
return $default(_that.status,_that.selectedImage,_that.detectedIngredients,_that.streamingRecipe,_that.errorMessage,_that.progress);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ScanStatus status, @JsonKey(toJson: _fileToJson, fromJson: _jsonToFile)  File? selectedImage,  List<String> detectedIngredients,  String? streamingRecipe,  String? errorMessage,  double progress)?  $default,) {final _that = this;
switch (_that) {
case _ScanState() when $default != null:
return $default(_that.status,_that.selectedImage,_that.detectedIngredients,_that.streamingRecipe,_that.errorMessage,_that.progress);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ScanState implements ScanState {
  const _ScanState({this.status = ScanStatus.initial, @JsonKey(toJson: _fileToJson, fromJson: _jsonToFile) this.selectedImage, final  List<String> detectedIngredients = const [], this.streamingRecipe, this.errorMessage, this.progress = 0.0}): _detectedIngredients = detectedIngredients;
  factory _ScanState.fromJson(Map<String, dynamic> json) => _$ScanStateFromJson(json);

@override@JsonKey() final  ScanStatus status;
@override@JsonKey(toJson: _fileToJson, fromJson: _jsonToFile) final  File? selectedImage;
 final  List<String> _detectedIngredients;
@override@JsonKey() List<String> get detectedIngredients {
  if (_detectedIngredients is EqualUnmodifiableListView) return _detectedIngredients;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_detectedIngredients);
}

@override final  String? streamingRecipe;
@override final  String? errorMessage;
@override@JsonKey() final  double progress;

/// Create a copy of ScanState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScanStateCopyWith<_ScanState> get copyWith => __$ScanStateCopyWithImpl<_ScanState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ScanStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScanState&&(identical(other.status, status) || other.status == status)&&(identical(other.selectedImage, selectedImage) || other.selectedImage == selectedImage)&&const DeepCollectionEquality().equals(other._detectedIngredients, _detectedIngredients)&&(identical(other.streamingRecipe, streamingRecipe) || other.streamingRecipe == streamingRecipe)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.progress, progress) || other.progress == progress));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,selectedImage,const DeepCollectionEquality().hash(_detectedIngredients),streamingRecipe,errorMessage,progress);

@override
String toString() {
  return 'ScanState(status: $status, selectedImage: $selectedImage, detectedIngredients: $detectedIngredients, streamingRecipe: $streamingRecipe, errorMessage: $errorMessage, progress: $progress)';
}


}

/// @nodoc
abstract mixin class _$ScanStateCopyWith<$Res> implements $ScanStateCopyWith<$Res> {
  factory _$ScanStateCopyWith(_ScanState value, $Res Function(_ScanState) _then) = __$ScanStateCopyWithImpl;
@override @useResult
$Res call({
 ScanStatus status,@JsonKey(toJson: _fileToJson, fromJson: _jsonToFile) File? selectedImage, List<String> detectedIngredients, String? streamingRecipe, String? errorMessage, double progress
});




}
/// @nodoc
class __$ScanStateCopyWithImpl<$Res>
    implements _$ScanStateCopyWith<$Res> {
  __$ScanStateCopyWithImpl(this._self, this._then);

  final _ScanState _self;
  final $Res Function(_ScanState) _then;

/// Create a copy of ScanState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? selectedImage = freezed,Object? detectedIngredients = null,Object? streamingRecipe = freezed,Object? errorMessage = freezed,Object? progress = null,}) {
  return _then(_ScanState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ScanStatus,selectedImage: freezed == selectedImage ? _self.selectedImage : selectedImage // ignore: cast_nullable_to_non_nullable
as File?,detectedIngredients: null == detectedIngredients ? _self._detectedIngredients : detectedIngredients // ignore: cast_nullable_to_non_nullable
as List<String>,streamingRecipe: freezed == streamingRecipe ? _self.streamingRecipe : streamingRecipe // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$RecipeOptions {

 int get servings; String? get dietaryRestrictions; String? get cuisinePreference; String? get complexity; List<String> get excludeIngredients; String? get additionalNotes;
/// Create a copy of RecipeOptions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecipeOptionsCopyWith<RecipeOptions> get copyWith => _$RecipeOptionsCopyWithImpl<RecipeOptions>(this as RecipeOptions, _$identity);

  /// Serializes this RecipeOptions to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecipeOptions&&(identical(other.servings, servings) || other.servings == servings)&&(identical(other.dietaryRestrictions, dietaryRestrictions) || other.dietaryRestrictions == dietaryRestrictions)&&(identical(other.cuisinePreference, cuisinePreference) || other.cuisinePreference == cuisinePreference)&&(identical(other.complexity, complexity) || other.complexity == complexity)&&const DeepCollectionEquality().equals(other.excludeIngredients, excludeIngredients)&&(identical(other.additionalNotes, additionalNotes) || other.additionalNotes == additionalNotes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,servings,dietaryRestrictions,cuisinePreference,complexity,const DeepCollectionEquality().hash(excludeIngredients),additionalNotes);

@override
String toString() {
  return 'RecipeOptions(servings: $servings, dietaryRestrictions: $dietaryRestrictions, cuisinePreference: $cuisinePreference, complexity: $complexity, excludeIngredients: $excludeIngredients, additionalNotes: $additionalNotes)';
}


}

/// @nodoc
abstract mixin class $RecipeOptionsCopyWith<$Res>  {
  factory $RecipeOptionsCopyWith(RecipeOptions value, $Res Function(RecipeOptions) _then) = _$RecipeOptionsCopyWithImpl;
@useResult
$Res call({
 int servings, String? dietaryRestrictions, String? cuisinePreference, String? complexity, List<String> excludeIngredients, String? additionalNotes
});




}
/// @nodoc
class _$RecipeOptionsCopyWithImpl<$Res>
    implements $RecipeOptionsCopyWith<$Res> {
  _$RecipeOptionsCopyWithImpl(this._self, this._then);

  final RecipeOptions _self;
  final $Res Function(RecipeOptions) _then;

/// Create a copy of RecipeOptions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? servings = null,Object? dietaryRestrictions = freezed,Object? cuisinePreference = freezed,Object? complexity = freezed,Object? excludeIngredients = null,Object? additionalNotes = freezed,}) {
  return _then(_self.copyWith(
servings: null == servings ? _self.servings : servings // ignore: cast_nullable_to_non_nullable
as int,dietaryRestrictions: freezed == dietaryRestrictions ? _self.dietaryRestrictions : dietaryRestrictions // ignore: cast_nullable_to_non_nullable
as String?,cuisinePreference: freezed == cuisinePreference ? _self.cuisinePreference : cuisinePreference // ignore: cast_nullable_to_non_nullable
as String?,complexity: freezed == complexity ? _self.complexity : complexity // ignore: cast_nullable_to_non_nullable
as String?,excludeIngredients: null == excludeIngredients ? _self.excludeIngredients : excludeIngredients // ignore: cast_nullable_to_non_nullable
as List<String>,additionalNotes: freezed == additionalNotes ? _self.additionalNotes : additionalNotes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RecipeOptions].
extension RecipeOptionsPatterns on RecipeOptions {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecipeOptions value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecipeOptions() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecipeOptions value)  $default,){
final _that = this;
switch (_that) {
case _RecipeOptions():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecipeOptions value)?  $default,){
final _that = this;
switch (_that) {
case _RecipeOptions() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int servings,  String? dietaryRestrictions,  String? cuisinePreference,  String? complexity,  List<String> excludeIngredients,  String? additionalNotes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecipeOptions() when $default != null:
return $default(_that.servings,_that.dietaryRestrictions,_that.cuisinePreference,_that.complexity,_that.excludeIngredients,_that.additionalNotes);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int servings,  String? dietaryRestrictions,  String? cuisinePreference,  String? complexity,  List<String> excludeIngredients,  String? additionalNotes)  $default,) {final _that = this;
switch (_that) {
case _RecipeOptions():
return $default(_that.servings,_that.dietaryRestrictions,_that.cuisinePreference,_that.complexity,_that.excludeIngredients,_that.additionalNotes);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int servings,  String? dietaryRestrictions,  String? cuisinePreference,  String? complexity,  List<String> excludeIngredients,  String? additionalNotes)?  $default,) {final _that = this;
switch (_that) {
case _RecipeOptions() when $default != null:
return $default(_that.servings,_that.dietaryRestrictions,_that.cuisinePreference,_that.complexity,_that.excludeIngredients,_that.additionalNotes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RecipeOptions implements RecipeOptions {
  const _RecipeOptions({this.servings = 4, this.dietaryRestrictions, this.cuisinePreference, this.complexity, final  List<String> excludeIngredients = const [], this.additionalNotes}): _excludeIngredients = excludeIngredients;
  factory _RecipeOptions.fromJson(Map<String, dynamic> json) => _$RecipeOptionsFromJson(json);

@override@JsonKey() final  int servings;
@override final  String? dietaryRestrictions;
@override final  String? cuisinePreference;
@override final  String? complexity;
 final  List<String> _excludeIngredients;
@override@JsonKey() List<String> get excludeIngredients {
  if (_excludeIngredients is EqualUnmodifiableListView) return _excludeIngredients;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_excludeIngredients);
}

@override final  String? additionalNotes;

/// Create a copy of RecipeOptions
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecipeOptionsCopyWith<_RecipeOptions> get copyWith => __$RecipeOptionsCopyWithImpl<_RecipeOptions>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecipeOptionsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecipeOptions&&(identical(other.servings, servings) || other.servings == servings)&&(identical(other.dietaryRestrictions, dietaryRestrictions) || other.dietaryRestrictions == dietaryRestrictions)&&(identical(other.cuisinePreference, cuisinePreference) || other.cuisinePreference == cuisinePreference)&&(identical(other.complexity, complexity) || other.complexity == complexity)&&const DeepCollectionEquality().equals(other._excludeIngredients, _excludeIngredients)&&(identical(other.additionalNotes, additionalNotes) || other.additionalNotes == additionalNotes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,servings,dietaryRestrictions,cuisinePreference,complexity,const DeepCollectionEquality().hash(_excludeIngredients),additionalNotes);

@override
String toString() {
  return 'RecipeOptions(servings: $servings, dietaryRestrictions: $dietaryRestrictions, cuisinePreference: $cuisinePreference, complexity: $complexity, excludeIngredients: $excludeIngredients, additionalNotes: $additionalNotes)';
}


}

/// @nodoc
abstract mixin class _$RecipeOptionsCopyWith<$Res> implements $RecipeOptionsCopyWith<$Res> {
  factory _$RecipeOptionsCopyWith(_RecipeOptions value, $Res Function(_RecipeOptions) _then) = __$RecipeOptionsCopyWithImpl;
@override @useResult
$Res call({
 int servings, String? dietaryRestrictions, String? cuisinePreference, String? complexity, List<String> excludeIngredients, String? additionalNotes
});




}
/// @nodoc
class __$RecipeOptionsCopyWithImpl<$Res>
    implements _$RecipeOptionsCopyWith<$Res> {
  __$RecipeOptionsCopyWithImpl(this._self, this._then);

  final _RecipeOptions _self;
  final $Res Function(_RecipeOptions) _then;

/// Create a copy of RecipeOptions
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? servings = null,Object? dietaryRestrictions = freezed,Object? cuisinePreference = freezed,Object? complexity = freezed,Object? excludeIngredients = null,Object? additionalNotes = freezed,}) {
  return _then(_RecipeOptions(
servings: null == servings ? _self.servings : servings // ignore: cast_nullable_to_non_nullable
as int,dietaryRestrictions: freezed == dietaryRestrictions ? _self.dietaryRestrictions : dietaryRestrictions // ignore: cast_nullable_to_non_nullable
as String?,cuisinePreference: freezed == cuisinePreference ? _self.cuisinePreference : cuisinePreference // ignore: cast_nullable_to_non_nullable
as String?,complexity: freezed == complexity ? _self.complexity : complexity // ignore: cast_nullable_to_non_nullable
as String?,excludeIngredients: null == excludeIngredients ? _self._excludeIngredients : excludeIngredients // ignore: cast_nullable_to_non_nullable
as List<String>,additionalNotes: freezed == additionalNotes ? _self.additionalNotes : additionalNotes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$AiRecipeResponse {

 String get name; String get description; List<String> get ingredients; List<RecipeStepDto> get steps; NutritionInfoDto? get nutritionInfo; int? get cookingTime; int? get servings; String get complexity; List<String> get tags;
/// Create a copy of AiRecipeResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AiRecipeResponseCopyWith<AiRecipeResponse> get copyWith => _$AiRecipeResponseCopyWithImpl<AiRecipeResponse>(this as AiRecipeResponse, _$identity);

  /// Serializes this AiRecipeResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AiRecipeResponse&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.ingredients, ingredients)&&const DeepCollectionEquality().equals(other.steps, steps)&&(identical(other.nutritionInfo, nutritionInfo) || other.nutritionInfo == nutritionInfo)&&(identical(other.cookingTime, cookingTime) || other.cookingTime == cookingTime)&&(identical(other.servings, servings) || other.servings == servings)&&(identical(other.complexity, complexity) || other.complexity == complexity)&&const DeepCollectionEquality().equals(other.tags, tags));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description,const DeepCollectionEquality().hash(ingredients),const DeepCollectionEquality().hash(steps),nutritionInfo,cookingTime,servings,complexity,const DeepCollectionEquality().hash(tags));

@override
String toString() {
  return 'AiRecipeResponse(name: $name, description: $description, ingredients: $ingredients, steps: $steps, nutritionInfo: $nutritionInfo, cookingTime: $cookingTime, servings: $servings, complexity: $complexity, tags: $tags)';
}


}

/// @nodoc
abstract mixin class $AiRecipeResponseCopyWith<$Res>  {
  factory $AiRecipeResponseCopyWith(AiRecipeResponse value, $Res Function(AiRecipeResponse) _then) = _$AiRecipeResponseCopyWithImpl;
@useResult
$Res call({
 String name, String description, List<String> ingredients, List<RecipeStepDto> steps, NutritionInfoDto? nutritionInfo, int? cookingTime, int? servings, String complexity, List<String> tags
});


$NutritionInfoDtoCopyWith<$Res>? get nutritionInfo;

}
/// @nodoc
class _$AiRecipeResponseCopyWithImpl<$Res>
    implements $AiRecipeResponseCopyWith<$Res> {
  _$AiRecipeResponseCopyWithImpl(this._self, this._then);

  final AiRecipeResponse _self;
  final $Res Function(AiRecipeResponse) _then;

/// Create a copy of AiRecipeResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? description = null,Object? ingredients = null,Object? steps = null,Object? nutritionInfo = freezed,Object? cookingTime = freezed,Object? servings = freezed,Object? complexity = null,Object? tags = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,ingredients: null == ingredients ? _self.ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as List<String>,steps: null == steps ? _self.steps : steps // ignore: cast_nullable_to_non_nullable
as List<RecipeStepDto>,nutritionInfo: freezed == nutritionInfo ? _self.nutritionInfo : nutritionInfo // ignore: cast_nullable_to_non_nullable
as NutritionInfoDto?,cookingTime: freezed == cookingTime ? _self.cookingTime : cookingTime // ignore: cast_nullable_to_non_nullable
as int?,servings: freezed == servings ? _self.servings : servings // ignore: cast_nullable_to_non_nullable
as int?,complexity: null == complexity ? _self.complexity : complexity // ignore: cast_nullable_to_non_nullable
as String,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}
/// Create a copy of AiRecipeResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NutritionInfoDtoCopyWith<$Res>? get nutritionInfo {
    if (_self.nutritionInfo == null) {
    return null;
  }

  return $NutritionInfoDtoCopyWith<$Res>(_self.nutritionInfo!, (value) {
    return _then(_self.copyWith(nutritionInfo: value));
  });
}
}


/// Adds pattern-matching-related methods to [AiRecipeResponse].
extension AiRecipeResponsePatterns on AiRecipeResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AiRecipeResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AiRecipeResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AiRecipeResponse value)  $default,){
final _that = this;
switch (_that) {
case _AiRecipeResponse():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AiRecipeResponse value)?  $default,){
final _that = this;
switch (_that) {
case _AiRecipeResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String description,  List<String> ingredients,  List<RecipeStepDto> steps,  NutritionInfoDto? nutritionInfo,  int? cookingTime,  int? servings,  String complexity,  List<String> tags)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AiRecipeResponse() when $default != null:
return $default(_that.name,_that.description,_that.ingredients,_that.steps,_that.nutritionInfo,_that.cookingTime,_that.servings,_that.complexity,_that.tags);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String description,  List<String> ingredients,  List<RecipeStepDto> steps,  NutritionInfoDto? nutritionInfo,  int? cookingTime,  int? servings,  String complexity,  List<String> tags)  $default,) {final _that = this;
switch (_that) {
case _AiRecipeResponse():
return $default(_that.name,_that.description,_that.ingredients,_that.steps,_that.nutritionInfo,_that.cookingTime,_that.servings,_that.complexity,_that.tags);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String description,  List<String> ingredients,  List<RecipeStepDto> steps,  NutritionInfoDto? nutritionInfo,  int? cookingTime,  int? servings,  String complexity,  List<String> tags)?  $default,) {final _that = this;
switch (_that) {
case _AiRecipeResponse() when $default != null:
return $default(_that.name,_that.description,_that.ingredients,_that.steps,_that.nutritionInfo,_that.cookingTime,_that.servings,_that.complexity,_that.tags);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AiRecipeResponse implements AiRecipeResponse {
  const _AiRecipeResponse({required this.name, required this.description, required final  List<String> ingredients, required final  List<RecipeStepDto> steps, this.nutritionInfo, this.cookingTime, this.servings, this.complexity = 'medium', final  List<String> tags = const []}): _ingredients = ingredients,_steps = steps,_tags = tags;
  factory _AiRecipeResponse.fromJson(Map<String, dynamic> json) => _$AiRecipeResponseFromJson(json);

@override final  String name;
@override final  String description;
 final  List<String> _ingredients;
@override List<String> get ingredients {
  if (_ingredients is EqualUnmodifiableListView) return _ingredients;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ingredients);
}

 final  List<RecipeStepDto> _steps;
@override List<RecipeStepDto> get steps {
  if (_steps is EqualUnmodifiableListView) return _steps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_steps);
}

@override final  NutritionInfoDto? nutritionInfo;
@override final  int? cookingTime;
@override final  int? servings;
@override@JsonKey() final  String complexity;
 final  List<String> _tags;
@override@JsonKey() List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}


/// Create a copy of AiRecipeResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AiRecipeResponseCopyWith<_AiRecipeResponse> get copyWith => __$AiRecipeResponseCopyWithImpl<_AiRecipeResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AiRecipeResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AiRecipeResponse&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._ingredients, _ingredients)&&const DeepCollectionEquality().equals(other._steps, _steps)&&(identical(other.nutritionInfo, nutritionInfo) || other.nutritionInfo == nutritionInfo)&&(identical(other.cookingTime, cookingTime) || other.cookingTime == cookingTime)&&(identical(other.servings, servings) || other.servings == servings)&&(identical(other.complexity, complexity) || other.complexity == complexity)&&const DeepCollectionEquality().equals(other._tags, _tags));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description,const DeepCollectionEquality().hash(_ingredients),const DeepCollectionEquality().hash(_steps),nutritionInfo,cookingTime,servings,complexity,const DeepCollectionEquality().hash(_tags));

@override
String toString() {
  return 'AiRecipeResponse(name: $name, description: $description, ingredients: $ingredients, steps: $steps, nutritionInfo: $nutritionInfo, cookingTime: $cookingTime, servings: $servings, complexity: $complexity, tags: $tags)';
}


}

/// @nodoc
abstract mixin class _$AiRecipeResponseCopyWith<$Res> implements $AiRecipeResponseCopyWith<$Res> {
  factory _$AiRecipeResponseCopyWith(_AiRecipeResponse value, $Res Function(_AiRecipeResponse) _then) = __$AiRecipeResponseCopyWithImpl;
@override @useResult
$Res call({
 String name, String description, List<String> ingredients, List<RecipeStepDto> steps, NutritionInfoDto? nutritionInfo, int? cookingTime, int? servings, String complexity, List<String> tags
});


@override $NutritionInfoDtoCopyWith<$Res>? get nutritionInfo;

}
/// @nodoc
class __$AiRecipeResponseCopyWithImpl<$Res>
    implements _$AiRecipeResponseCopyWith<$Res> {
  __$AiRecipeResponseCopyWithImpl(this._self, this._then);

  final _AiRecipeResponse _self;
  final $Res Function(_AiRecipeResponse) _then;

/// Create a copy of AiRecipeResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? description = null,Object? ingredients = null,Object? steps = null,Object? nutritionInfo = freezed,Object? cookingTime = freezed,Object? servings = freezed,Object? complexity = null,Object? tags = null,}) {
  return _then(_AiRecipeResponse(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,ingredients: null == ingredients ? _self._ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as List<String>,steps: null == steps ? _self._steps : steps // ignore: cast_nullable_to_non_nullable
as List<RecipeStepDto>,nutritionInfo: freezed == nutritionInfo ? _self.nutritionInfo : nutritionInfo // ignore: cast_nullable_to_non_nullable
as NutritionInfoDto?,cookingTime: freezed == cookingTime ? _self.cookingTime : cookingTime // ignore: cast_nullable_to_non_nullable
as int?,servings: freezed == servings ? _self.servings : servings // ignore: cast_nullable_to_non_nullable
as int?,complexity: null == complexity ? _self.complexity : complexity // ignore: cast_nullable_to_non_nullable
as String,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

/// Create a copy of AiRecipeResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NutritionInfoDtoCopyWith<$Res>? get nutritionInfo {
    if (_self.nutritionInfo == null) {
    return null;
  }

  return $NutritionInfoDtoCopyWith<$Res>(_self.nutritionInfo!, (value) {
    return _then(_self.copyWith(nutritionInfo: value));
  });
}
}


/// @nodoc
mixin _$RecipeStepDto {

 int get stepNumber; String get instruction; int? get duration; List<String> get tips;
/// Create a copy of RecipeStepDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecipeStepDtoCopyWith<RecipeStepDto> get copyWith => _$RecipeStepDtoCopyWithImpl<RecipeStepDto>(this as RecipeStepDto, _$identity);

  /// Serializes this RecipeStepDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecipeStepDto&&(identical(other.stepNumber, stepNumber) || other.stepNumber == stepNumber)&&(identical(other.instruction, instruction) || other.instruction == instruction)&&(identical(other.duration, duration) || other.duration == duration)&&const DeepCollectionEquality().equals(other.tips, tips));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,stepNumber,instruction,duration,const DeepCollectionEquality().hash(tips));

@override
String toString() {
  return 'RecipeStepDto(stepNumber: $stepNumber, instruction: $instruction, duration: $duration, tips: $tips)';
}


}

/// @nodoc
abstract mixin class $RecipeStepDtoCopyWith<$Res>  {
  factory $RecipeStepDtoCopyWith(RecipeStepDto value, $Res Function(RecipeStepDto) _then) = _$RecipeStepDtoCopyWithImpl;
@useResult
$Res call({
 int stepNumber, String instruction, int? duration, List<String> tips
});




}
/// @nodoc
class _$RecipeStepDtoCopyWithImpl<$Res>
    implements $RecipeStepDtoCopyWith<$Res> {
  _$RecipeStepDtoCopyWithImpl(this._self, this._then);

  final RecipeStepDto _self;
  final $Res Function(RecipeStepDto) _then;

/// Create a copy of RecipeStepDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? stepNumber = null,Object? instruction = null,Object? duration = freezed,Object? tips = null,}) {
  return _then(_self.copyWith(
stepNumber: null == stepNumber ? _self.stepNumber : stepNumber // ignore: cast_nullable_to_non_nullable
as int,instruction: null == instruction ? _self.instruction : instruction // ignore: cast_nullable_to_non_nullable
as String,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int?,tips: null == tips ? _self.tips : tips // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [RecipeStepDto].
extension RecipeStepDtoPatterns on RecipeStepDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecipeStepDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecipeStepDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecipeStepDto value)  $default,){
final _that = this;
switch (_that) {
case _RecipeStepDto():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecipeStepDto value)?  $default,){
final _that = this;
switch (_that) {
case _RecipeStepDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int stepNumber,  String instruction,  int? duration,  List<String> tips)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecipeStepDto() when $default != null:
return $default(_that.stepNumber,_that.instruction,_that.duration,_that.tips);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int stepNumber,  String instruction,  int? duration,  List<String> tips)  $default,) {final _that = this;
switch (_that) {
case _RecipeStepDto():
return $default(_that.stepNumber,_that.instruction,_that.duration,_that.tips);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int stepNumber,  String instruction,  int? duration,  List<String> tips)?  $default,) {final _that = this;
switch (_that) {
case _RecipeStepDto() when $default != null:
return $default(_that.stepNumber,_that.instruction,_that.duration,_that.tips);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RecipeStepDto implements RecipeStepDto {
  const _RecipeStepDto({required this.stepNumber, required this.instruction, this.duration, final  List<String> tips = const []}): _tips = tips;
  factory _RecipeStepDto.fromJson(Map<String, dynamic> json) => _$RecipeStepDtoFromJson(json);

@override final  int stepNumber;
@override final  String instruction;
@override final  int? duration;
 final  List<String> _tips;
@override@JsonKey() List<String> get tips {
  if (_tips is EqualUnmodifiableListView) return _tips;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tips);
}


/// Create a copy of RecipeStepDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecipeStepDtoCopyWith<_RecipeStepDto> get copyWith => __$RecipeStepDtoCopyWithImpl<_RecipeStepDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecipeStepDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecipeStepDto&&(identical(other.stepNumber, stepNumber) || other.stepNumber == stepNumber)&&(identical(other.instruction, instruction) || other.instruction == instruction)&&(identical(other.duration, duration) || other.duration == duration)&&const DeepCollectionEquality().equals(other._tips, _tips));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,stepNumber,instruction,duration,const DeepCollectionEquality().hash(_tips));

@override
String toString() {
  return 'RecipeStepDto(stepNumber: $stepNumber, instruction: $instruction, duration: $duration, tips: $tips)';
}


}

/// @nodoc
abstract mixin class _$RecipeStepDtoCopyWith<$Res> implements $RecipeStepDtoCopyWith<$Res> {
  factory _$RecipeStepDtoCopyWith(_RecipeStepDto value, $Res Function(_RecipeStepDto) _then) = __$RecipeStepDtoCopyWithImpl;
@override @useResult
$Res call({
 int stepNumber, String instruction, int? duration, List<String> tips
});




}
/// @nodoc
class __$RecipeStepDtoCopyWithImpl<$Res>
    implements _$RecipeStepDtoCopyWith<$Res> {
  __$RecipeStepDtoCopyWithImpl(this._self, this._then);

  final _RecipeStepDto _self;
  final $Res Function(_RecipeStepDto) _then;

/// Create a copy of RecipeStepDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? stepNumber = null,Object? instruction = null,Object? duration = freezed,Object? tips = null,}) {
  return _then(_RecipeStepDto(
stepNumber: null == stepNumber ? _self.stepNumber : stepNumber // ignore: cast_nullable_to_non_nullable
as int,instruction: null == instruction ? _self.instruction : instruction // ignore: cast_nullable_to_non_nullable
as String,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int?,tips: null == tips ? _self._tips : tips // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}


/// @nodoc
mixin _$NutritionInfoDto {

 int? get calories; double? get protein; double? get carbohydrates; double? get fat; double? get fiber; double? get sugar; int? get sodium;
/// Create a copy of NutritionInfoDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NutritionInfoDtoCopyWith<NutritionInfoDto> get copyWith => _$NutritionInfoDtoCopyWithImpl<NutritionInfoDto>(this as NutritionInfoDto, _$identity);

  /// Serializes this NutritionInfoDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NutritionInfoDto&&(identical(other.calories, calories) || other.calories == calories)&&(identical(other.protein, protein) || other.protein == protein)&&(identical(other.carbohydrates, carbohydrates) || other.carbohydrates == carbohydrates)&&(identical(other.fat, fat) || other.fat == fat)&&(identical(other.fiber, fiber) || other.fiber == fiber)&&(identical(other.sugar, sugar) || other.sugar == sugar)&&(identical(other.sodium, sodium) || other.sodium == sodium));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,calories,protein,carbohydrates,fat,fiber,sugar,sodium);

@override
String toString() {
  return 'NutritionInfoDto(calories: $calories, protein: $protein, carbohydrates: $carbohydrates, fat: $fat, fiber: $fiber, sugar: $sugar, sodium: $sodium)';
}


}

/// @nodoc
abstract mixin class $NutritionInfoDtoCopyWith<$Res>  {
  factory $NutritionInfoDtoCopyWith(NutritionInfoDto value, $Res Function(NutritionInfoDto) _then) = _$NutritionInfoDtoCopyWithImpl;
@useResult
$Res call({
 int? calories, double? protein, double? carbohydrates, double? fat, double? fiber, double? sugar, int? sodium
});




}
/// @nodoc
class _$NutritionInfoDtoCopyWithImpl<$Res>
    implements $NutritionInfoDtoCopyWith<$Res> {
  _$NutritionInfoDtoCopyWithImpl(this._self, this._then);

  final NutritionInfoDto _self;
  final $Res Function(NutritionInfoDto) _then;

/// Create a copy of NutritionInfoDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? calories = freezed,Object? protein = freezed,Object? carbohydrates = freezed,Object? fat = freezed,Object? fiber = freezed,Object? sugar = freezed,Object? sodium = freezed,}) {
  return _then(_self.copyWith(
calories: freezed == calories ? _self.calories : calories // ignore: cast_nullable_to_non_nullable
as int?,protein: freezed == protein ? _self.protein : protein // ignore: cast_nullable_to_non_nullable
as double?,carbohydrates: freezed == carbohydrates ? _self.carbohydrates : carbohydrates // ignore: cast_nullable_to_non_nullable
as double?,fat: freezed == fat ? _self.fat : fat // ignore: cast_nullable_to_non_nullable
as double?,fiber: freezed == fiber ? _self.fiber : fiber // ignore: cast_nullable_to_non_nullable
as double?,sugar: freezed == sugar ? _self.sugar : sugar // ignore: cast_nullable_to_non_nullable
as double?,sodium: freezed == sodium ? _self.sodium : sodium // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [NutritionInfoDto].
extension NutritionInfoDtoPatterns on NutritionInfoDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NutritionInfoDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NutritionInfoDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NutritionInfoDto value)  $default,){
final _that = this;
switch (_that) {
case _NutritionInfoDto():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NutritionInfoDto value)?  $default,){
final _that = this;
switch (_that) {
case _NutritionInfoDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? calories,  double? protein,  double? carbohydrates,  double? fat,  double? fiber,  double? sugar,  int? sodium)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NutritionInfoDto() when $default != null:
return $default(_that.calories,_that.protein,_that.carbohydrates,_that.fat,_that.fiber,_that.sugar,_that.sodium);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? calories,  double? protein,  double? carbohydrates,  double? fat,  double? fiber,  double? sugar,  int? sodium)  $default,) {final _that = this;
switch (_that) {
case _NutritionInfoDto():
return $default(_that.calories,_that.protein,_that.carbohydrates,_that.fat,_that.fiber,_that.sugar,_that.sodium);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? calories,  double? protein,  double? carbohydrates,  double? fat,  double? fiber,  double? sugar,  int? sodium)?  $default,) {final _that = this;
switch (_that) {
case _NutritionInfoDto() when $default != null:
return $default(_that.calories,_that.protein,_that.carbohydrates,_that.fat,_that.fiber,_that.sugar,_that.sodium);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NutritionInfoDto implements NutritionInfoDto {
  const _NutritionInfoDto({this.calories, this.protein, this.carbohydrates, this.fat, this.fiber, this.sugar, this.sodium});
  factory _NutritionInfoDto.fromJson(Map<String, dynamic> json) => _$NutritionInfoDtoFromJson(json);

@override final  int? calories;
@override final  double? protein;
@override final  double? carbohydrates;
@override final  double? fat;
@override final  double? fiber;
@override final  double? sugar;
@override final  int? sodium;

/// Create a copy of NutritionInfoDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NutritionInfoDtoCopyWith<_NutritionInfoDto> get copyWith => __$NutritionInfoDtoCopyWithImpl<_NutritionInfoDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NutritionInfoDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NutritionInfoDto&&(identical(other.calories, calories) || other.calories == calories)&&(identical(other.protein, protein) || other.protein == protein)&&(identical(other.carbohydrates, carbohydrates) || other.carbohydrates == carbohydrates)&&(identical(other.fat, fat) || other.fat == fat)&&(identical(other.fiber, fiber) || other.fiber == fiber)&&(identical(other.sugar, sugar) || other.sugar == sugar)&&(identical(other.sodium, sodium) || other.sodium == sodium));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,calories,protein,carbohydrates,fat,fiber,sugar,sodium);

@override
String toString() {
  return 'NutritionInfoDto(calories: $calories, protein: $protein, carbohydrates: $carbohydrates, fat: $fat, fiber: $fiber, sugar: $sugar, sodium: $sodium)';
}


}

/// @nodoc
abstract mixin class _$NutritionInfoDtoCopyWith<$Res> implements $NutritionInfoDtoCopyWith<$Res> {
  factory _$NutritionInfoDtoCopyWith(_NutritionInfoDto value, $Res Function(_NutritionInfoDto) _then) = __$NutritionInfoDtoCopyWithImpl;
@override @useResult
$Res call({
 int? calories, double? protein, double? carbohydrates, double? fat, double? fiber, double? sugar, int? sodium
});




}
/// @nodoc
class __$NutritionInfoDtoCopyWithImpl<$Res>
    implements _$NutritionInfoDtoCopyWith<$Res> {
  __$NutritionInfoDtoCopyWithImpl(this._self, this._then);

  final _NutritionInfoDto _self;
  final $Res Function(_NutritionInfoDto) _then;

/// Create a copy of NutritionInfoDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? calories = freezed,Object? protein = freezed,Object? carbohydrates = freezed,Object? fat = freezed,Object? fiber = freezed,Object? sugar = freezed,Object? sodium = freezed,}) {
  return _then(_NutritionInfoDto(
calories: freezed == calories ? _self.calories : calories // ignore: cast_nullable_to_non_nullable
as int?,protein: freezed == protein ? _self.protein : protein // ignore: cast_nullable_to_non_nullable
as double?,carbohydrates: freezed == carbohydrates ? _self.carbohydrates : carbohydrates // ignore: cast_nullable_to_non_nullable
as double?,fat: freezed == fat ? _self.fat : fat // ignore: cast_nullable_to_non_nullable
as double?,fiber: freezed == fiber ? _self.fiber : fiber // ignore: cast_nullable_to_non_nullable
as double?,sugar: freezed == sugar ? _self.sugar : sugar // ignore: cast_nullable_to_non_nullable
as double?,sodium: freezed == sodium ? _self.sodium : sodium // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
