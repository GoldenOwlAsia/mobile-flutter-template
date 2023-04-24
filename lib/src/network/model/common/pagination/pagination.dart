import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myapp/src/network/model/common/handle/handle.dart';
import 'package:myapp/src/network/model/common/result/result.dart';

part 'pagination.freezed.dart';

@freezed
abstract class MPagination<T> with _$MPagination<T> {
  const MPagination._();
  const factory MPagination({
    @Default(15) int pageCount,
    @Default(MHandle.initial()) MHandle<void> status,
    @Default(true) bool hasMore,
    @Default([]) List<T> items,
  }) = _MPagination<T>;

  bool get canNext => hasMore && (status.isInitial || status.isComplete);
  T? get last => items.isNotEmpty ? items.last : null;
  bool get isLoading => status.isLoading;

  MPagination<T> fetchMoreItem(List<T> items) {
    return copyWith(
      status: const MHandle.complete(MResult.data(null)),
      hasMore: (items.length) < pageCount,
      items: [...this.items, ...items],
    );
  }
}
