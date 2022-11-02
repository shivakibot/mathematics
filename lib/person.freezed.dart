// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'person.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Person {
  String get id =>
      throw _privateConstructorUsedError; // @Default('') String firstName,
// @Default('') String lastName,
  int get age => throw _privateConstructorUsedError;
  SelfAwareness get awareness => throw _privateConstructorUsedError;
  List<String> get fave => throw _privateConstructorUsedError;
  String? get keep => throw _privateConstructorUsedError;
  Set<String> get dumped => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PersonCopyWith<Person> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonCopyWith<$Res> {
  factory $PersonCopyWith(Person value, $Res Function(Person) then) =
      _$PersonCopyWithImpl<$Res, Person>;
  @useResult
  $Res call(
      {String id,
      int age,
      SelfAwareness awareness,
      List<String> fave,
      String? keep,
      Set<String> dumped});
}

/// @nodoc
class _$PersonCopyWithImpl<$Res, $Val extends Person>
    implements $PersonCopyWith<$Res> {
  _$PersonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? age = null,
    Object? awareness = null,
    Object? fave = null,
    Object? keep = freezed,
    Object? dumped = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
      awareness: null == awareness
          ? _value.awareness
          : awareness // ignore: cast_nullable_to_non_nullable
              as SelfAwareness,
      fave: null == fave
          ? _value.fave
          : fave // ignore: cast_nullable_to_non_nullable
              as List<String>,
      keep: freezed == keep
          ? _value.keep
          : keep // ignore: cast_nullable_to_non_nullable
              as String?,
      dumped: null == dumped
          ? _value.dumped
          : dumped // ignore: cast_nullable_to_non_nullable
              as Set<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PersonCopyWith<$Res> implements $PersonCopyWith<$Res> {
  factory _$$_PersonCopyWith(_$_Person value, $Res Function(_$_Person) then) =
      __$$_PersonCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      int age,
      SelfAwareness awareness,
      List<String> fave,
      String? keep,
      Set<String> dumped});
}

/// @nodoc
class __$$_PersonCopyWithImpl<$Res>
    extends _$PersonCopyWithImpl<$Res, _$_Person>
    implements _$$_PersonCopyWith<$Res> {
  __$$_PersonCopyWithImpl(_$_Person _value, $Res Function(_$_Person) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? age = null,
    Object? awareness = null,
    Object? fave = null,
    Object? keep = freezed,
    Object? dumped = null,
  }) {
    return _then(_$_Person(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
      awareness: null == awareness
          ? _value.awareness
          : awareness // ignore: cast_nullable_to_non_nullable
              as SelfAwareness,
      fave: null == fave
          ? _value._fave
          : fave // ignore: cast_nullable_to_non_nullable
              as List<String>,
      keep: freezed == keep
          ? _value.keep
          : keep // ignore: cast_nullable_to_non_nullable
              as String?,
      dumped: null == dumped
          ? _value._dumped
          : dumped // ignore: cast_nullable_to_non_nullable
              as Set<String>,
    ));
  }
}

/// @nodoc

class _$_Person implements _Person {
  const _$_Person(
      {required this.id,
      this.age = 25,
      required this.awareness,
      final List<String> fave = const [],
      this.keep,
      final Set<String> dumped = const {}})
      : _fave = fave,
        _dumped = dumped;

  @override
  final String id;
// @Default('') String firstName,
// @Default('') String lastName,
  @override
  @JsonKey()
  final int age;
  @override
  final SelfAwareness awareness;
  final List<String> _fave;
  @override
  @JsonKey()
  List<String> get fave {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fave);
  }

  @override
  final String? keep;
  final Set<String> _dumped;
  @override
  @JsonKey()
  Set<String> get dumped {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_dumped);
  }

  @override
  String toString() {
    return 'Person(id: $id, age: $age, awareness: $awareness, fave: $fave, keep: $keep, dumped: $dumped)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Person &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.awareness, awareness) ||
                other.awareness == awareness) &&
            const DeepCollectionEquality().equals(other._fave, _fave) &&
            (identical(other.keep, keep) || other.keep == keep) &&
            const DeepCollectionEquality().equals(other._dumped, _dumped));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      age,
      awareness,
      const DeepCollectionEquality().hash(_fave),
      keep,
      const DeepCollectionEquality().hash(_dumped));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PersonCopyWith<_$_Person> get copyWith =>
      __$$_PersonCopyWithImpl<_$_Person>(this, _$identity);
}

abstract class _Person implements Person {
  const factory _Person(
      {required final String id,
      final int age,
      required final SelfAwareness awareness,
      final List<String> fave,
      final String? keep,
      final Set<String> dumped}) = _$_Person;

  @override
  String get id;
  @override // @Default('') String firstName,
// @Default('') String lastName,
  int get age;
  @override
  SelfAwareness get awareness;
  @override
  List<String> get fave;
  @override
  String? get keep;
  @override
  Set<String> get dumped;
  @override
  @JsonKey(ignore: true)
  _$$_PersonCopyWith<_$_Person> get copyWith =>
      throw _privateConstructorUsedError;
}
