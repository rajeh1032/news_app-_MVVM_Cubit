import 'package:hive/hive.dart';
part 'source_response.g.dart';
@HiveType(typeId: 1)
class SourceResponse extends HiveObject {
    @HiveField(0)
  String? status;
   @HiveField(1)
  String? message;
   @HiveField(2)
  String? code;
   @HiveField(3)
  List<Source>? sources;

  SourceResponse({this.status, this.message, this.code, this.sources});

  factory SourceResponse.fromJson(dynamic json) {
    return SourceResponse(
      status: json['status'] as String?,
      message: json['message'] as String?,
      code: json['code'] as String?,
      sources: (json['sources'] as List<dynamic>?)
          ?.map((e) => Source.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'code': code,
        'sources': sources?.map((e) => e.toJson()).toList(),
      };
}
@HiveType(typeId: 2)
class Source  extends HiveObject {
     @HiveField(0)
  String? id;
     @HiveField(1)
  String? name;
     @HiveField(2)
  String? description;
   @HiveField(3)
  String? url;
     @HiveField(4)
  String? category;
     @HiveField(5)
  String? language;
     @HiveField(6)
  String? country;

  Source({
    this.id,
    this.name,
    this.description,
    this.url,
    this.category,
    this.language,
    this.country,
  });

  factory Source.fromJson(dynamic json) => Source(
        id: json['id'] as String?,
        name: json['name'] as String?,
        description: json['description'] as String?,
        url: json['url'] as String?,
        category: json['category'] as String?,
        language: json['language'] as String?,
        country: json['country'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'url': url,
        'category': category,
        'language': language,
        'country': country,
      };
}
