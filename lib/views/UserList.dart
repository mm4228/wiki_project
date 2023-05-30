import 'package:flutter/material.dart';
import 'package:wiki_projet/Models/UserModel.dart';
import 'package:wiki_projet/dbFiles/dbHelper.dart'; // Assure-toi d'importer correctement le modèle User

class UserListPage extends StatefulWidget {
  @override
  _UserListPageState createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  List<User>? _userList; // Liste des utilisateurs

  @override
  void initState() {
    super.initState();
    _getUserList();
  }

  Future<void> _getUserList() async {
    List<User>? userList = await DbHelper.getAllUser(); // Utilise la méthode getAllUser de la classe DbHelper pour récupérer les utilisateurs

    setState(() {
      _userList = userList;
    });
  }

  Future<void> _deleteUser(User user) async {
    int rowsDeleted = await DbHelper.deleteUser(user); // Utilise la méthode deleteUser de la classe DbHelper pour supprimer l'utilisateur

    if (rowsDeleted > 0) {
      // Suppression réussie
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Utilisateur supprimé avec succès')),
      );
      _getUserList(); // Rafraîchit la liste des utilisateurs après la suppression
    } else {
      // Erreur lors de la suppression
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur lors de la suppression de l\'utilisateur')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des utilisateurs'),
      ),
      body: _userList != null
          ? ListView.builder(
        itemCount: _userList!.length,
        itemBuilder: (context, index) {
          User user = _userList![index];
          return ListTile(
            title: Text(user.mail),
            subtitle: Text(user.password),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => _deleteUser(user), // Appelle la fonction _deleteUser pour supprimer l'utilisateur
            ),
          );
        },
      )
          : Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
