import 'package:freezed_annotation/freezed_annotation.dart';

import '../auth/auth_models.dart';

part 'job_models.freezed.dart';
part 'job_models.g.dart';

@freezed
abstract class QuestionModel with _$QuestionModel {
  const factory QuestionModel({
    required int id,
    required String content,
    required int job,
  }) = _QuestionModel;

  factory QuestionModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionModelFromJson(json);
}

@freezed
abstract class AnswerModel with _$AnswerModel {
  const factory AnswerModel({
    required int id,
    required String content,
    required int application,
    required int question,
  }) = _AnswerModel;

  factory AnswerModel.fromJson(Map<String, dynamic> json) =>
      _$AnswerModelFromJson(json);
}

@freezed
abstract class JobModel with _$JobModel {
  // Private unnamed constructor — required so the generated class can
  // still host the timeAgo/date getters alongside the factory fields
  // (same pattern used for CommentModel.timeAgo).
  const JobModel._();

  const factory JobModel({
    required int id,
    @JsonKey(name: 'posted_by') required UserContainer postedBy,
    required List<QuestionModel> questions,
    @JsonKey(name: 'is_applied') required bool isApplied,
    required String title,
    required String description,
    required String requirements,
    @JsonKey(name: 'target_creator') required String targetCreator,
    @JsonKey(name: 'created_at') required String createdAt,
  }) = _JobModel;

  factory JobModel.fromJson(Map<String, dynamic> json) =>
      _$JobModelFromJson(json);

  // /// Equivalent to Kotlin's DateTimeFormatter.ofPattern("dd/MM/yyyy")
  // /// .withZone(ZoneId.systemDefault()) — DateTime.parse gives UTC or
  // /// local depending on the string's format; .toLocal() matches the
  // /// "systemDefault()" zone conversion explicitly.
  // String get date {
  //   try {
  //     final instant = DateTime.parse(createdAt).toLocal();
  //     return DateFormat('dd/MM/yyyy').format(instant);
  //   } catch (_) {
  //     return '';
  //   }
  // }
}

@freezed
abstract class ApplicationModel with _$ApplicationModel {
  const factory ApplicationModel({
    required int id,
    required UserContainer creator,
    required JobModel job,
    required List<AnswerModel> answers,
  }) = _ApplicationModel;

  factory ApplicationModel.fromJson(Map<String, dynamic> json) =>
      _$ApplicationModelFromJson(json);
}
