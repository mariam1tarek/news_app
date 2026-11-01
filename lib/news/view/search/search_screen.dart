import 'package:news_app/common/app_strings.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/news/model/models/article_model.dart';
import 'package:news_app/news/view/widgets/news_card.dart';
import 'package:news_app/news/view_model/search/search_repository.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, required this.repository});

  final SearchRepository repository;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();
  Timer? _debounce;

  bool _loading = false;
  String? _error;
  List<Articles> _articles = [];
  bool _searched = false;
  int _requestId = 0;
  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _onChanged(String text) {
    setState(() {});
    _debounce?.cancel();
    if (text.trim().isEmpty) {
      _requestId++;
      setState(() {
        _articles = [];
        _error = null;
        _loading = false;
        _searched = false;
      });
      return;
    }
    _debounce = Timer(const Duration(milliseconds: 500), () => _search(text));
  }

  Future<void> _search(String text) async {
    final id = ++_requestId;
    setState(() {
      _loading = true;
      _error = null;
    });
    final result = await widget.repository.search(text);
    if (!mounted || id != _requestId) return;
    setState(() {
      _loading = false;
      _searched = true;
      _articles = result.articles;
      _error = result.errorMessage;
    });
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 8.h),
              child: TextField(
                controller: _controller,
                autofocus: true,
                textInputAction: TextInputAction.search,
                onChanged: _onChanged,
                onSubmitted: (v) {
                  _debounce?.cancel();
                  if (v.trim().isNotEmpty) _search(v);
                },
                style: TextStyle(fontSize: 16.sp, color: scheme.onSurface),
                cursorColor: scheme.secondary,
                decoration: InputDecoration(
                  hintText: context.tr('search'),
                  hintStyle: TextStyle(
                    fontSize: 16.sp,
                    color: scheme.onSurface.withValues(alpha: 0.6),
                  ),
                  prefixIcon: Icon(Icons.search, color: scheme.onSurface),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.close, color: scheme.onSurface),
                    onPressed: () {
                      if (_controller.text.isEmpty) {
                        Navigator.of(context).pop();
                      } else {
                        _controller.clear();
                        _onChanged('');
                      }
                    },
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 14.h),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.r),
                    borderSide: BorderSide(color: scheme.secondary),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.r),
                    borderSide: BorderSide(color: scheme.secondary, width: 1.5),
                  ),
                ),
              ),
            ),
            Expanded(child: _buildBody(context)),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    if (_loading) {
      return Center(child: CircularProgressIndicator(color: scheme.secondary));
    }
    if (_error != null) return Center(child: Text(_error!));
    if (_searched && _articles.isEmpty) {
      return Center(child: Text(context.tr('no_results')));
    }
    return ListView.separated(
      padding: EdgeInsets.all(16.r),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      itemCount: _articles.length,
      separatorBuilder: (_, __) => SizedBox(height: 16.h),
      itemBuilder: (_, i) => NewsCard(articles: _articles[i]),
    );
  }
}
