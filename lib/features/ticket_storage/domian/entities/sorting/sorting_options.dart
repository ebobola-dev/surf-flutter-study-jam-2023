import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/domian/entities/sorting/sorting_type.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/domian/entities/ticket/ticket.dart';

part 'sorting_options.freezed.dart';

@freezed
class SortingOptions with _$SortingOptions {
  const SortingOptions._();

  const factory SortingOptions({
    required SortingType type,
    @Default(false) bool reversed,
  }) = _SortingOptions;

  factory SortingOptions.byAddedDate({
    bool reversed = false,
  }) =>
      SortingOptions(
        type: SortingType.byAddedDate,
        reversed: reversed,
      );

  factory SortingOptions.byName({
    bool reversed = false,
  }) =>
      SortingOptions(
        type: SortingType.byName,
        reversed: reversed,
      );

  factory SortingOptions.byDownloaded({
    bool reversed = false,
  }) =>
      SortingOptions(
        type: SortingType.byDownloaded,
        reversed: reversed,
      );

  int Function(Ticket a, Ticket b) compareTicketTo() {
    switch (type) {
      case SortingType.byAddedDate:
        if (!reversed) {
          ///? По порядку
          return (a, b) => a.addedDate.compareTo(b.addedDate);
        } else {
          ///? В обратном порядке
          return (a, b) => b.addedDate.compareTo(a.addedDate);
        }
      case SortingType.byName:
        if (!reversed) {
          ///? По порядку
          return (a, b) => a.name.compareTo(b.name);
        } else {
          ///? В обратном порядке
          return (a, b) => b.name.compareTo(a.name);
        }
      case SortingType.byDownloaded:
        if (reversed) {
          ///? Скачанные - скачиваются - нескачанные
          return (a, b) => a.downloadingStatus.sortingIndex.compareTo(
                b.downloadingStatus.sortingIndex,
              );
        } else {
          ///? Нескачанные - скачиваются - скачанные
          return (a, b) => b.downloadingStatus.sortingIndex.compareTo(
                a.downloadingStatus.sortingIndex,
              );
        }
    }
  }
}

final List<SortingOptions> allSotrignOptions = List.generate(
  SortingType.values.length * 2,
  (index) => SortingOptions(
    type: SortingType.values[index ~/ 2],
    reversed: index % 2 != 0,
  ),
);
