class PageRequest {
  const PageRequest({this.page = 0, this.pageSize = 20});

  final int page;
  final int pageSize;

  int get offset => page * pageSize;

  PageRequest next() => PageRequest(page: page + 1, pageSize: pageSize);
}

class Page<T> {
  const Page({required this.items, required this.page, required this.pageSize, required this.total});

  final List<T> items;
  final int page;
  final int pageSize;
  final int total;

  bool get hasMore => total < 0 ? items.length >= pageSize : (page + 1) * pageSize < total;
}
