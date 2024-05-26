import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../../../../core_ui.dart';
import 'search_bar_empty_widget.dart';

class SearchBarWithSuggestions<T> extends StatefulWidget {
  final String label;
  final String nothingFoundLabel;
  final String error;

  final List<T> suggestions;
  final bool isReloading;

  final String Function(T item) stringifier;
  final void Function(String searchString) onSearchStringUpdated;
  final void Function(T item) onSelected;

  const SearchBarWithSuggestions({
    super.key,
    required this.label,
    required this.nothingFoundLabel,
    required this.error,
    required this.isReloading,
    required this.suggestions,
    required this.stringifier,
    required this.onSearchStringUpdated,
    required this.onSelected,
  });

  @override
  State<SearchBarWithSuggestions<T>> createState() => _SearchBarWithSuggestionsState<T>();
}

class _SearchBarWithSuggestionsState<T> extends State<SearchBarWithSuggestions<T>> {
  final TextEditingController _searchTextController = TextEditingController();
  final SuggestionsController<T> _suggestionsController = SuggestionsController<T>();
  final FocusNode _searchFocusNode = FocusNode();

  bool _isTextFieldEmpty = true;

  @override
  void initState() {
    super.initState();

    _searchTextController.addListener(() {
      setState(() => _isTextFieldEmpty = _searchTextController.text.isEmpty);
    });

    _suggestionsController.addListener(() {});
  }

  @override
  void didUpdateWidget(SearchBarWithSuggestions<T> old) {
    super.didUpdateWidget(old);
    _suggestionsController.isLoading = widget.isReloading;

    if (_isTextFieldEmpty) {
      _suggestionsController.suggestions = <T>[];
    } else {
      _suggestionsController.suggestions = widget.suggestions;
    }
  }

  @override
  void dispose() {
    _searchTextController.dispose();
    _suggestionsController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;

    return TypeAheadField<T>(
      controller: _searchTextController,
      suggestionsController: _suggestionsController,
      focusNode: _searchFocusNode,
      retainOnLoading: false,
      suggestionsCallback: (String searchString) {
        widget.onSearchStringUpdated(searchString);
        return _suggestionsController.suggestions;
      },
      debounceDuration: AppDimens.DEFAULT_DEBOUNCE_DURATION,
      emptyBuilder: (_) {
        return SizedBox(
          height: AppDimens.DEFAULT_CONTROL_HEIGHT,
          child: Center(
            child: Text(
              widget.nothingFoundLabel,
              style: AppFonts.inter16Regular.copyWith(
                color: colors.text,
              ),
            ),
          ),
        );
        return SearchBarEmptyWidget(isSearchStringEmpty: _isTextFieldEmpty);
      },
      builder: (
        BuildContext context,
        TextEditingController controller,
        FocusNode focusNode,
      ) {
        return AppTextField(
          textEditingController: controller,
          focusNode: focusNode,
          label: widget.label,
          error: widget.error,
          suffixIcon: const Icon(Icons.search),
        );
      },
      itemBuilder: (BuildContext content, T item) {
        return Container(
          color: Colors.red,
          height: AppDimens.DEFAULT_CONTROL_HEIGHT,
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: AppDimens.DEFAULT_CONTAINER_PADDING),
          child: Text(
            widget.stringifier(item),
            style: AppFonts.inter16Regular.copyWith(
              color: colors.text,
            ),
          ),
        );
      },
      loadingBuilder: (_) => const SizedBox(
        height: AppDimens.DEFAULT_CONTROL_HEIGHT,
        child: Center(
          child: AppLoadingIndicator(
            size: AppDimens.DEFAULT_CONTAINER_PADDING,
          ),
        ),
      ),
      onSelected: (T item) {
        _searchFocusNode.unfocus();
        widget.onSelected(item);
      },
    );
  }
}
