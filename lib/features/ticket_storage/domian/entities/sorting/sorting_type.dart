enum SortingType {
  ///? По дате добавления (сперва старые)
  byAddedDate(name: 'По дате добавления'),

  ///? По имени (по алфавиту)
  byName(name: 'По имени'),

  ///? Скачанные не скачанные (сперва нескачанные)
  byDownloaded(name: 'По статусу скачивания');

  final String name;
  const SortingType({required this.name});
}
