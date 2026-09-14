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
abstract class RequirementModel with _$RequirementModel {
  const factory RequirementModel({required int id, required String content}) =
      _RequirementModel;

  factory RequirementModel.fromJson(Map<String, dynamic> json) =>
      _$RequirementModelFromJson(json);
}

@freezed
abstract class JobModel with _$JobModel {
  const JobModel._();

  const factory JobModel({
    required int id,
    @JsonKey(name: 'posted_by') required UserProfile postedBy,
    required List<QuestionModel> questions,
    required List<RequirementModel> requirements,
    @JsonKey(name: 'is_applied') required bool isApplied,
    required String title,
    required String description,
    @JsonKey(name: 'target_creator') required String targetCreator,
    @JsonKey(name: 'created_at') required String createdAt,
  }) = _JobModel;

  factory JobModel.fromJson(Map<String, dynamic> json) =>
      _$JobModelFromJson(json);
}

@freezed
abstract class ApplicationModel with _$ApplicationModel {
  const factory ApplicationModel({
    required int id,
    required UserProfile creator,
    required JobModel job,
    required List<AnswerModel> answers,
  }) = _ApplicationModel;

  factory ApplicationModel.fromJson(Map<String, dynamic> json) =>
      _$ApplicationModelFromJson(json);
}
