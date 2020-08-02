String removeEnumPrefix(dynamic value, {String separator = ''}) {
  return value.toString().replaceAll('${value.runtimeType}.', separator);
}
