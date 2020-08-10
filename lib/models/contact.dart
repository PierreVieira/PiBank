class Contact{
  final String nome;
  final int accountNumber;

  Contact(this.nome, this.accountNumber);

  @override
  String toString() {
    return 'Contact{nome: $nome, accountNumber: $accountNumber}';
  }
}