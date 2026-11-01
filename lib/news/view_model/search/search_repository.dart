import 'package:news_app/enums/category_enums.dart';
import 'package:news_app/news/model/models/article_model.dart';
import 'package:news_app/news/model/network/network_service.dart';

class SearchResult {
  final List<Articles> articles;
  final String? errorMessage;
  const SearchResult({this.articles = const [], this.errorMessage});
}

class SearchRepository {
  SearchRepository(this._network);

  final NetworkService _network;

  List<Articles> _pool = [];
  final Map<String, String> _categoryOf = {};
  Future<void>? _loadingPool;

  String _key(Articles a) => a.url ?? '${a.title}${a.publishedAt}';

  Future<void> _ensurePool() => _loadingPool ??= _loadPool();

  Future<void> _loadPool() async {
    final results = await Future.wait(
      CategoryEnums.values.map((c) => _network.getCategoryHeadlines(c.name)),
    );
    final all = <Articles>[];
    for (var i = 0; i < results.length; i++) {
      final list = results[i].$2;
      if (list == null) continue;
      for (final a in list) {
        _categoryOf.putIfAbsent(_key(a), () => CategoryEnums.values[i].name);
      }
      all.addAll(list);
    }
    _pool = _dedupe(all);
    if (_pool.isEmpty) _loadingPool = null;
  }

  List<Articles> _dedupe(List<Articles> list) {
    final seen = <String>{};
    final out = <Articles>[];
    for (final a in list) {
      if (a.title == null || a.title == '[Removed]') continue;
      if (seen.add(_key(a))) out.add(a);
    }
    return out;
  }

  bool _matches(Articles a, List<String> tokens) {
    final haystack = [
      a.title,
      a.description,
      a.author,
      a.source?.name,
      _categoryOf[_key(a)],
    ].whereType<String>().join(' ').toLowerCase();
    return tokens.every(haystack.contains);
  }

  Future<SearchResult> search(String query) async {
    final q = query.trim();
    if (q.isEmpty) return const SearchResult();

    final remoteFuture = _network.searchArticles(q);
    await _ensurePool();
    final remote = await remoteFuture;

    final tokens = q.toLowerCase().split(RegExp(r'\s+'));
    final local = _pool.where((a) => _matches(a, tokens)).toList();
    final articles = _dedupe([...local, ...(remote.$2 ?? [])]);

    return SearchResult(
      articles: articles,
      errorMessage:
          (remote.$1 != null && articles.isEmpty) ? remote.$1!.message : null,
    );
  }
}
