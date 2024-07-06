enumFromString(String? value, List<Enum> values) {
  return values.firstWhere((type) => type.toString().split('.').last == value);
}
