import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:githubster/bloc/enums/search_from_history_status.dart';
import 'package:githubster/bloc/enums/search_history_status.dart';
import 'package:githubster/bloc/search_bloc/search_bloc.dart';
import 'package:githubster/gen/assets.gen.dart';
import 'package:githubster/resources/app_colors.dart';
import 'package:githubster/resources/app_strings.dart';
import 'package:githubster/resources/app_styles.dart';

class CustomSearchTextField extends StatefulWidget {
  const CustomSearchTextField({super.key});

  @override
  State<CustomSearchTextField> createState() => _CustomSearchTextFieldState();
}

class _CustomSearchTextFieldState extends State<CustomSearchTextField> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _focusNode.dispose();
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SearchBloc, SearchState>(
      listener: (context, state) {
        if (state.searchFromHistoryStatus == SearchFromHistoryStatus.history) {
          _textEditingController.text = state.searchFromHistoryValue;
        }
      },
      child: TextField(
        controller: _textEditingController,
        focusNode: _focusNode,
        cursorColor: AppColors.accentPrimary,
        cursorWidth: 2.0,
        keyboardType: TextInputType.text,
        onTapOutside: (event) => _focusNode.unfocus(),
        textInputAction: TextInputAction.search,
        onSubmitted: (value) {
          context.read<SearchBloc>().add(
                AddToHistoryEvent(
                  searchValue: value,
                ),
              );
          context.read<SearchBloc>().add(
                RequestForSearchEvent(
                  searchValue: value,
                  searchFromHistoryStatus: SearchFromHistoryStatus.keyboard,
                ),
              );
        },
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              top: 16.0,
              right: 10.0,
              bottom: 16.0,
            ),
            child: Assets.icons.search.svg(),
          ),
          suffixIcon: Visibility(
            child: GestureDetector(
              onTap: () {
                _textEditingController.clear();
                context.read<SearchBloc>().add(
                      ShowHistoryEvent(
                        searchHistoryStatus: SearchHistoryStatus.history,
                      ),
                    );
              },
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 10.0,
                  top: 16.0,
                  right: 16.0,
                  bottom: 16.0,
                ),
                child: Assets.icons.close.svg(),
              ),
            ),
          ),
          hintText: AppStrings.search,
          hintStyle: AppStyles.body2,
          fillColor: _focusNode.hasFocus ? AppColors.accentSecondary : null,
        ),
      ),
    );
  }
}
