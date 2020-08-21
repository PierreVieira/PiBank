import 'package:flutter/material.dart';
import 'package:pibank/components/progress.dart';
import 'package:pibank/database/dao/contact_dao.dart';
import 'package:pibank/models/contact.dart';
import 'package:pibank/screens/contact_form.dart';

class ContactsList extends StatefulWidget {
  @override
  _ContactsListState createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  final List<Contact> contacts = List();
  final ContactDao _dao = ContactDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      body: FutureBuilder<List<Contact>>(
        initialData: List(),
        future: _dao.findAll(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              // O Future ainda não foi executado
              break;
            case ConnectionState.waiting:
              // Estado em que verifica se o Future ainda está carregando
              return Progress();
            case ConnectionState.active:
              /* Significa que o snapshot tem um dado disponível, mas ainda não
              foi finalizado o future, acontece quando temos algo que traz pedaços
              de uma chamada assíncrona, como por exemplo, um download*/
              break;
            case ConnectionState.done:
              final List<Contact> contacts = snapshot.data;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final Contact contact = contacts[index];
                  return _ContactItem(contact);
                },
                itemCount: contacts.length,
              );
          }
          return Text("Unknown error!");
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(
                  builder: (BuildContext context) => ContactForm()))
              .then((newContact) {
            setState(() {});
          });
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final Contact contact;

  const _ContactItem(this.contact);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          contact.name,
          style: TextStyle(
            fontSize: 24.0,
          ),
        ),
        subtitle: Text(
          contact.accountNumber.toString(),
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
