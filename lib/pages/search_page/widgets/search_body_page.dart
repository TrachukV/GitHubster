import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:githubster/bloc/enums/search_history_status.dart';
import 'package:githubster/bloc/search_bloc/search_bloc.dart';
import 'package:githubster/pages/search_page/widgets/repository_history_column.dart';
import 'package:githubster/pages/search_page/widgets/repository_search_column.dart';
import 'package:githubster/pages/widgets/custom_search_textfield/custom_search_textfield.dart';

class SearchBodyPage extends StatelessWidget {
  const SearchBodyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomSearchTextField(),
        const SizedBox(
          height: 16.0,
        ),
        BlocBuilder<SearchBloc, SearchState>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            return Expanded(
                child: switch (state.searchHistoryStatus) {
              SearchHistoryStatus.search => const RepositorySearchColumn(),
              SearchHistoryStatus.history => const RepositoryHistoryColumn(),
            });
          },
        ),
      ],
    );
  }
}
