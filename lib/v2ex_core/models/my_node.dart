class MyNode {
  final String name;
  final String avatar;
  final int topicTotalCount;

  const MyNode(this.name, this.avatar, this.topicTotalCount);
}

class PagedResult<T> {
  final int currentPage;
  final int totalPages;
  final List<T> items;
  const PagedResult(this.currentPage, this.totalPages, this.items);
}
