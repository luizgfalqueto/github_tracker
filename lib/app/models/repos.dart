class Repos {
  final String name;
  final String description;
  final bool forked;
  final String language;
  final int forks;

  Repos({
    required this.name,
    required this.description,
    required this.forked,
    required this.language,
    required this.forks,
  });

  factory Repos.fromJson(Map<String, dynamic> json) {
    return Repos(
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      forked: json['fork'],
      language: json['language'] ?? '',
      forks: json['forks'] ?? 0,
    );
  }
}
