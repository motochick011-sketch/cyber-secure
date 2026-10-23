import 'dart:async';

import 'package:flutter/material.dart';
import 'package:cybersecure/design_system/theme/theme_access.dart';

class AppSearchField extends StatefulWidget {
  final Function(String) onSearch;
  final String hint;
  final String label;
  final int maxLines;
  final Duration debounceDuration;

  const AppSearchField({super.key, required this.onSearch, this.hint = "search", this.label = 'Search', this.maxLines = 1, this.debounceDuration = const Duration(milliseconds: 300)});

  @override
  State<AppSearchField> createState() => _AppSearchFieldState();
}

class _AppSearchFieldState extends State<AppSearchField> {
  final TextEditingController _searchController = TextEditingController();
  Timer? _debounceTimer;

  @override
  void dispose() {
    _debounceTimer?.cancel();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: appStyles.subtitle,
      controller: _searchController,
      textInputAction: TextInputAction.done,
      onChanged: (value) {
        _debounceTimer?.cancel();
        _debounceTimer = Timer(widget.debounceDuration, () {
          widget.onSearch(value);
        });
      },
      maxLines: widget.maxLines,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        labelText: widget.label,
        hintText: widget.hint,
        fillColor: appColors.primaryTint,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: appColors.overlaySubtle, width: 1.5),
          borderRadius: BorderRadius.circular(12),
        ),
        suffixIcon: (_searchController.text.isNotEmpty)
            ? IconButton(
                onPressed: () => setState(() {
                  _searchController.clear();
                  widget.onSearch('');
                }),
                icon: const Icon(Icons.clear),
              )
            : null,
      ),
    );
  }
}
