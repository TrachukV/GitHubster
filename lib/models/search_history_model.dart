import 'package:equatable/equatable.dart';

class SearchHistoryModel extends Equatable {
  final String searchValue;

  const SearchHistoryModel({
    required this.searchValue,
  });

  Map<String, dynamic> toJson() {
    return {
      'searchValue': searchValue,
    };
  }

  factory SearchHistoryModel.fromJson(Map<String, dynamic> map) {
    return SearchHistoryModel(
      searchValue: map['searchValue'] as String,
    );
  }

  @override
  List<Object?> get props => [
        searchValue,
      ];
}
