import 'package:flutter/material.dart';
import 'package:wiki_projet/Models/UserModel.dart';
import 'package:wiki_projet/Models/CommentaryModel.dart';
import 'package:wiki_projet/Users/GlobalsColors.dart';

import '../DataBase/DbHelper.dart';

class UserListView extends StatefulWidget {
  @override
  _UserListPageState createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListView> {
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
        const SnackBar(content: Text('Utilisateur supprimé avec succès')),
      );
      _getUserList(); // Rafraîchit la liste des utilisateurs après la suppression
    } else {
      // Erreur lors de la suppression
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Erreur lors de la suppression de l\'utilisateur')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste des utilisateurs'),
        backgroundColor: GlobalsColors.mainColor, // Changement de la couleur de l'entête en rouge
      ),
      body: _userList != null
          ? ListView.builder(
        itemCount: _userList!.length,
        itemBuilder: (context, index) {
          User user = _userList![index];
          return Card(
            elevation: 2,
            margin: const EdgeInsets.all(8),
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    user.mail,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(user.password),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => _deleteUser(user),
                  ),
                ),
                const Divider(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Liste des commentaires signalés',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    FutureBuilder<List<Commentary>?>(
                      future: DbHelper.getSignaledCommentaries(user.id!),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return const Text('Erreur lors du chargement des commentaires signalés');
                        } else {
                          List<Commentary>? signaledCommentaries = snapshot.data;
                          if (signaledCommentaries != null && signaledCommentaries.isNotEmpty) {
                            return Column(
                              children: signaledCommentaries.map((commentary) {
                                return ListTile(
                                  title: Text(commentary.content),
                                  subtitle: Text('Signalé'),
                                  leading: const Icon(Icons.report_problem, color: Colors.red),
                                );
                              }).toList(),
                            );
                          } else {
                            return const SizedBox(); // Aucun commentaire signalé
                          }
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      )
          : const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
