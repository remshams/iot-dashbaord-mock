class Account {
  final int id;
  final String name;
  final String email;

  const Account(this.id, this.name, this.email);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Account &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          email == other.email;

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ email.hashCode;
}

typedef AccountDbLoader = Stream<List<Account>> Function();
