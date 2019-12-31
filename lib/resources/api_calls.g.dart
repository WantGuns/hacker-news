// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_calls.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetTopStories _$GetTopStoriesFromJson(Map<String, dynamic> json) {
  return GetTopStories(
    id: json['id'] as int,
    deleted: json['deleted'] as bool,
    type: json['type'] as String,
    by: json['by'] as String,
    time: json['time'] as int,
    text: json['text'] as String,
    dead: json['dead'] as bool,
    parent: json['parent'] as String,
    poll: json['poll'] as int,
    kids: (json['kids'] as List)?.map((e) => e as int)?.toList(),
    url: json['url'] as String,
    score: json['score'] as int,
    title: json['title'] as String,
    parts: (json['parts'] as List)?.map((e) => e as int)?.toList(),
    descendants: json['descendants'] as int,
  );
}

Map<String, dynamic> _$GetTopStoriesToJson(GetTopStories instance) =>
    <String, dynamic>{
      'id': instance.id,
      'deleted': instance.deleted,
      'type': instance.type,
      'by': instance.by,
      'time': instance.time,
      'text': instance.text,
      'dead': instance.dead,
      'parent': instance.parent,
      'poll': instance.poll,
      'kids': instance.kids,
      'url': instance.url,
      'score': instance.score,
      'title': instance.title,
      'parts': instance.parts,
      'descendants': instance.descendants,
    };
