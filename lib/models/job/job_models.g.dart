// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QuestionModel _$QuestionModelFromJson(Map<String, dynamic> json) =>
    _QuestionModel(
      id: (json['id'] as num).toInt(),
      content: json['content'] as String,
      job: (json['job'] as num).toInt(),
    );

Map<String, dynamic> _$QuestionModelToJson(_QuestionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'job': instance.job,
    };

_AnswerModel _$AnswerModelFromJson(Map<String, dynamic> json) => _AnswerModel(
  id: (json['id'] as num).toInt(),
  content: json['content'] as String,
  application: (json['application'] as num).toInt(),
  question: (json['question'] as num).toInt(),
);

Map<String, dynamic> _$AnswerModelToJson(_AnswerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'application': instance.application,
      'question': instance.question,
    };

_JobModel _$JobModelFromJson(Map<String, dynamic> json) => _JobModel(
  id: (json['id'] as num).toInt(),
  postedBy: UserContainer.fromJson(json['posted_by'] as Map<String, dynamic>),
  questions: (json['questions'] as List<dynamic>)
      .map((e) => QuestionModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  isApplied: json['is_applied'] as bool,
  title: json['title'] as String,
  description: json['description'] as String,
  requirements: json['requirements'] as String,
  targetCreator: json['target_creator'] as String,
  createdAt: json['created_at'] as String,
);

Map<String, dynamic> _$JobModelToJson(_JobModel instance) => <String, dynamic>{
  'id': instance.id,
  'posted_by': instance.postedBy,
  'questions': instance.questions,
  'is_applied': instance.isApplied,
  'title': instance.title,
  'description': instance.description,
  'requirements': instance.requirements,
  'target_creator': instance.targetCreator,
  'created_at': instance.createdAt,
};

_ApplicationModel _$ApplicationModelFromJson(Map<String, dynamic> json) =>
    _ApplicationModel(
      id: (json['id'] as num).toInt(),
      creator: UserContainer.fromJson(json['creator'] as Map<String, dynamic>),
      job: JobModel.fromJson(json['job'] as Map<String, dynamic>),
      answers: (json['answers'] as List<dynamic>)
          .map((e) => AnswerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ApplicationModelToJson(_ApplicationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'creator': instance.creator,
      'job': instance.job,
      'answers': instance.answers,
    };
