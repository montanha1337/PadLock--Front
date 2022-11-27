import 'package:pix/src/data/repository/contact_repository.dart';
import 'package:pix/src/model/contact_model.dart';
import 'package:pix/src/model/contacts_pix_model.dart';
import 'package:flutter/services.dart';

class ContactController {
  final repository = ContactRepository();

  Future<void> saveContact({
    required String name,
    required String typePix,
    required String pix,
  }) async {
    return await repository.saveContact(name: name, typePix: typePix, pix: pix);
  }

  Future<List<ContactModel>> fetchContacts() async {
    final contacts = await repository.fetchContacts();
    return contacts;
  }

  Future<ContactsPixModel?> fetchContactsPix({required String name}) async {
    final contacts = await repository.fetchContactsPix(name: name);
    return contacts;
  }

  Future<void> deletePix({required String contato, required String pix}) async {
    return await repository.deletePix(contato: contato, pix: pix);
  }

  Future<void> copiePix({required String pix}) async {
    Clipboard.setData(ClipboardData(text: pix));
  }
}
