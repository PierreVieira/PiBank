import 'package:flutter/material.dart';
import 'package:pibank/models/contact.dart';
import 'package:pibank/screens/contact_form.dart';

class ContactsList extends StatelessWidget {

  final List<Contact> contacts = List();

  @override
  Widget build(BuildContext context) {
    contacts.add(Contact(0, 'alex', 1000));
    contacts.add(Contact(0, 'alex', 1000));
    contacts.add(Contact(0, 'alex', 1000));
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          final Contact contact = contacts[index];
          return _ContactItem(contact);
        },
        itemCount: contacts.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(
                  builder: (BuildContext context) => ContactForm()))
              .then((newContact) => debugPrint(newContact.toString()));
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
