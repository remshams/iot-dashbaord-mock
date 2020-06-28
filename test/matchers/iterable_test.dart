import 'package:test/test.dart';

import 'iterable.dart';

abstract class _Copyable<T> {
  T copy();
}

T copy<T extends _Copyable<T>>(T copyable) => copyable.copy();

class _ValueEntity implements _Copyable<_ValueEntity> {
  final String prop;

  const _ValueEntity(this.prop);

  @override
  _ValueEntity copy() {
    return _ValueEntity(prop);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _ValueEntity &&
          runtimeType == other.runtimeType &&
          prop == other.prop;

  @override
  int get hashCode => prop.hashCode;
}

class _Entity implements _Copyable<_Entity> {
  final String prop;

  const _Entity(this.prop);

  @override
  _Entity copy() {
    return _Entity(prop);
  }
}

void main() {
  group('Iterable Matchers', () {
    group('deepEquals', () {
      final valueEntityList = [
        const _ValueEntity('test1'),
        const _ValueEntity('test2')
      ];
      final entityList = [const _Entity('test1'), const _Entity('test2')];

      test('should match in case list deep equals', () {
        expect(valueEntityList.map(copy), deepEquals(valueEntityList));
      });
      test('should not match in case list does not deep equals', () {
        expect(
            [const _ValueEntity('other')], isNot(deepEquals(valueEntityList)));
      });
      test('should not match in case of non value object', () {
        expect(entityList.map(copy), isNot(deepEquals(entityList)));
      });
      test('should not match in case not the same iterable', () {
        expect(Set.from(valueEntityList), isNot(deepEquals(valueEntityList)));
      });
    });
  });
}
