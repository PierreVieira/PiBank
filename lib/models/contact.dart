class Contact {
  final String name;
  final int accountNumber;
  final int id;

  Contact(
    this.id,
    this.name,
    this.accountNumber,
  );

  @override
  String toString() {
    return 'Contact{id: $id nome: $name, accountNumber: $accountNumber}';
  }

  Contact.fromJson(Map<String, dynamic> json) :
    id = json['id'],
    name = json['name'],
    accountNumber = json['accountNumber'];

  Map<String, dynamic> toJson() => {
    'name': name,
    'accountNumber': accountNumber,
  };

}
