import 'package:flutter/material.dart';
import 'package:wiki_projet/Models/CommentaryModel.dart';
import 'package:wiki_projet/dbFiles/dbHelper.dart';
import 'package:wiki_projet/users/colors.dart';

class CommentaryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Espace Echange'),
        backgroundColor: GlobalsColors.mainColor,
      ),
      body: ListView.builder(
        itemCount: 5, // Nombre de rectangles à afficher
        itemBuilder: (context, index) {
          return RectangleItem();
        },
      ),
    );
  }
}

class RectangleItem extends StatefulWidget {
  @override
  _RectangleItemState createState() => _RectangleItemState();
}

class _RectangleItemState extends State<RectangleItem> {
  List<Commentary>? commentaryList = [];

  @override
  void initState() {
    super.initState();
    _getCommentaryList();
  }

  Future<void> _getCommentaryList() async {
    commentaryList = await DbHelper.getAllCommentary();
    setState(() {
      // Update the comments list when commentaryList changes
      comments = commentaryList?.map((commentary) => commentary.content).toList();
    });
  }

  Future<void> _deleteCommentary(Commentary commentary) async {
    int rowsDeleted = await DbHelper.deleteCommentary(commentary);

    if (rowsDeleted > 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Commentaire supprimé avec succès')),
      );
      _getCommentaryList();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur lors de la suppression du commentaire')),
      );
    }
  }

  Commentary? commentary;
  bool showComments = false;
  List<String>? comments = [];
  final String title = "cc";
  final String content =
      "OUUUUUUUUUUUUUUUUUUUUUUOUUUUUUUUUUUUUUUUUUUUUUOUUUUUUUUUUUUUUUUUUUUUUOUUUUUUUUUUUUUUUUUUUUUUOUUUUUUUUUUUUUUUUUUUUUUOUUUUUUUUUUUUUUUUUUUUUUOUUUUUUUUUUUUUUUUUUUUUUOUUUUUUUUUUUUUUUUUUUUUUOUUUUUUUUUUUUUUUUUUUUUUOUUUUUUUUUUUUUUUUUUUUUUOUUUUUUUUUUUUUUUUUUUUUUOUUUUUUUUUUUUUUUUUUUUUUOUUUUUUUUUUUUUUUUUUUUUUOUUUUUUUUUUUUUUUUUUUUUUOUUUUUUUUUUUUUUUUUUUUUU";

  final TextEditingController commentController = TextEditingController();

  void toggleComments() {
    setState(() {
      showComments = !showComments;
    });
  }

  void _viewFullContent(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FullContentPage(content: content),
      ),
    );
  }

  void addComment() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Ajouter un commentaire',
            style: TextStyle(fontSize: 15, color: GlobalsColors.textColor),
          ),
          content: TextField(
            controller: commentController,
            decoration: InputDecoration(
              hintText: 'Entrez votre commentaire',
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: GlobalsColors.mainColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: GlobalsColors.textColor),
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Annuler',
                style: TextStyle(fontSize: 15, color: GlobalsColors.textColor),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text(
                'Ajouter',
                style: TextStyle(fontSize: 15, color: GlobalsColors.textColor),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: GlobalsColors.mainColor,
              ),
              onPressed: () async {
                if (commentController.text.isNotEmpty) {
                  Commentary newCommentary =
                  Commentary(content: commentController.text, id: commentary?.id);
                  await DbHelper.addCommentary(newCommentary);
                  _getCommentaryList();
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        color: Colors.grey[300],
        child: Column(
          children: [
            ListTile(
              title: Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                content,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  _viewFullContent(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: GlobalsColors.mainColor,
                ),
                child: const Text('Voir l\'intégralité du texte'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: toggleComments,
                child: Text(
                  showComments ? 'Cacher les commentaires' : 'Voir les commentaires',
                  style: TextStyle(fontSize: 15, color: GlobalsColors.textColor),
                ),
              ),
            ),
            if (showComments)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: addComment,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: GlobalsColors.mainColor,
                      ),
                      child: const Text('Ajouter un commentaire'),
                    ),
                    if (comments != null && comments!.isNotEmpty)
                      ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: comments!.map((comment) {
                          return ListTile(
                            title: Text(comment),
                            trailing: IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                Commentary? selectedCommentary = commentaryList?.firstWhere(
                                      (commentary) => commentary.content == comment

                                );
                                if (selectedCommentary != null) {
                                  _deleteCommentary(selectedCommentary);
                                }
                              },
                            ),
                          );
                        }).toList(),
                      ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class FullContentPage extends StatelessWidget {
  final String content;

  const FullContentPage({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contenu complet'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Text(
            content,
            style: TextStyle(fontSize: 16.0),
          ),
        ),
      ),
    );
  }
}
