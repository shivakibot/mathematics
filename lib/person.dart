import 'package:freezed_annotation/freezed_annotation.dart';
part 'person.freezed.dart';

@freezed
class Person with _$Person{
  const factory Person({
    required String id,
    // @Default('') String firstName,
    // @Default('') String lastName,
    @Default(25) int age,
    required SelfAwareness awareness,
    @Default([]) List<String> fave,
    String? keep,
    @Default({}) Set<String> dumped,
  }) = _Person;
}


enum SelfAwareness{
  men('男'),
  women('女');

  final String gender;
  const SelfAwareness(this.gender);
}