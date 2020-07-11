import 'package:collection/collection.dart';

import '../server/harness/app.dart';

Matcher deepEquals(Iterable expected) => _IterableDeepEquals(expected);

class _IterableDeepEquals<T extends Iterable> extends TypeMatcher<T> {
  final T _expected;

  const _IterableDeepEquals(this._expected);

  @override
  bool matches(Object item, Map matchState) {
    if (!super.matches(item, matchState)) {
      return false;
    }
    final iterable = item as Iterable;
    return const DeepCollectionEquality().equals(iterable, _expected);
  }
}
