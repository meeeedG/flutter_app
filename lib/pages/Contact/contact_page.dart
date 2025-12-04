import 'package:flutter/material.dart'; 
import 'package:github_api_flutter_app/models/contact_model.dart'; 
import 'package:github_api_flutter_app/pages/Contact/cantact_update.dart'; 

class ContactPages extends StatefulWidget { 
  const ContactPages({super.key}); 

  @override 
  State<ContactPages> createState() => _ContactPagesState(); 
}

class _ContactPagesState extends State<ContactPages> { 
  List<Contact> contacts = [ 
    Contact(name: "mohamed", email: "mohamed@mail.cc", phone: "0675846398"), 
    Contact(name: "aymane", email: "aymane@mail.cc", phone: "0665874121"), 
    Contact(name: "mouad", email: "mouad@mail.cc", phone: "0654871593"), 
  ]; 
  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      appBar: AppBar(title: Text('Contact'),
      ), 
      floatingActionButton: FloatingActionButton( 
        onPressed: () async { 
          final newContact = await Navigator.pushNamed(context, '/addContact') as Contact?; 
          if (newContact != null) { 
            setState(() { 
              contacts.add(newContact); 
            }); 
          } 
        }, 
        child: Icon(Icons.add), 
      ), 
      body: buildList(), 
    ); 
  } 

  Widget buildList() { 
    return ListView.builder( 
      itemCount: contacts.length, 
      itemBuilder: (context, index) { 
        final contact = contacts[index]; 
        return ListTile( 
          leading: CircleAvatar(child: Text(contact.name[0].toUpperCase())), 
          title: Text(contact.name), 
          subtitle: Text('${contact.email}\n${contact.phone}'), 
          isThreeLine: true, 
          trailing: IconButton(onPressed: () { 
            setState(() { 
              contacts.removeAt(index); 
            }); 
            ScaffoldMessenger.of(context).showSnackBar( 
              SnackBar( 
                content: Text('Contact Deleted'), 
                duration: Duration(seconds: 2), 
                ), 
            ); 
          }, icon: Icon(Icons.delete)), 
          onTap: () async{ 
            final updated = await Navigator.push(context,  
            MaterialPageRoute(builder: (_)=> UpdateContact(contact: contact)) 
            ); 
            if (updated != null) { 
              setState(() { 
                contacts[index] = updated; 
              }); 
            } 
          }, 
        ); 
      }, 
    ); 
  } 
} 
