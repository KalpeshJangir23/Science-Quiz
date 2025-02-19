// ignore_for_file: public_member_api_docs, sort_constructors_first
class OptionModel {
  final int id;
  final String description;
  final bool is_correct;

  OptionModel({
    required this.id,
    required this.description,
    required this.is_correct,
  });

  factory OptionModel.fromJson(Map<String, dynamic> map) {
    return OptionModel(
      id: map['id'] ?? 0,
      description: map['description'] ?? [],
      is_correct: map['is_correct'] ?? [],
    );
  }
}

class ReadingMaterialModel {
  final int id;
  final String keywords;
  final List<String> content_sections;

  ReadingMaterialModel({
    required this.id,
    required this.keywords,
    required this.content_sections,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'keywords': keywords,
      'content_sections': content_sections,
    };
  }

  factory ReadingMaterialModel.fromMap(Map<String, dynamic> map) {
    return ReadingMaterialModel(
      id: map['id'] ?? 0,
      keywords: map['keywords'] ?? '',
      content_sections: List<String>.from(map['content_sections'] ?? []),
    );
  }
}

class PracticeMaterialModel {
  final List<String> content;
  final List<String> keywords;

  PracticeMaterialModel({
    required this.content,
    required this.keywords,
  });

  factory PracticeMaterialModel.fromMap(Map<String, dynamic> map) {
    return PracticeMaterialModel(
      content: List<String>.from(map['content'] ?? []),
      keywords: List<String>.from(map['keywords'] ?? []),
    );
  }
}
