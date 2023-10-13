import 'package:equatable/equatable.dart';

class GitHubRepositoryModel extends Equatable {
  final int repositoryId;
  final String nameOfRepository;
  final String url;

  const GitHubRepositoryModel(
      {required this.repositoryId,
      required this.nameOfRepository,
      required this.url});

  Map<String, dynamic> toJson() {
    return {
      'id': repositoryId,
      'name': nameOfRepository,
      'html_url': url,
    };
  }

  factory GitHubRepositoryModel.fromJson(Map<String, dynamic> map) {
    return GitHubRepositoryModel(
      repositoryId: map['id'] as int,
      nameOfRepository: map['name'] as String,
      url: map['html_url'] as String,
    );
  }

  @override
  List<Object?> get props => [
        repositoryId,
        nameOfRepository,
        url,
      ];
}
