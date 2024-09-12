class User {
  final String login;
  final String avatarUrl;
  final String name;
  final String blog;
  final String location;
  final String company;
  final String email;
  final int publicRepos;
  final int followers;
  final int following;
  final String bio;

  User({
    required this.login,
    required this.avatarUrl,
    required this.name,
    required this.blog,
    required this.location,
    required this.company,
    required this.email,
    required this.publicRepos,
    required this.followers,
    required this.following,
    required this.bio,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      login: json['login'] ?? '',
      avatarUrl: json['avatar_url'] ?? '',
      name: json['name'] ?? '',
      blog: json['blog'] ?? '',
      location: json['location'] ?? '',
      company: json['company'] ?? '',
      email: json['email'] ?? '',
      publicRepos: json['public_repos'] ?? 0,
      followers: json['followers'] ?? 0,
      following: json['following'] ?? 0,
      bio: json['bio'] ?? '',
    );
  }
}
