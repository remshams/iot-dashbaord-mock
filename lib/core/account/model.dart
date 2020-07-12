class Account {
  final String id;
  final String username;
  final String email;

  const Account(this.id, this.username, this.email);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Account &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          username == other.username &&
          email == other.email;

  @override
  int get hashCode => id.hashCode ^ username.hashCode ^ email.hashCode;

  Map<String, dynamic> toJson() =>
      {'id': id, 'username': username, 'email': email};
}

typedef AccountLoader = Stream<List<Account>> Function();
