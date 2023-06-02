import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wiki_projet/Models/CommentaryModel.dart';
import 'package:wiki_projet/Models/UserModel.dart';
import 'package:wiki_projet/Views/ViewFullContentPage.dart';
import 'package:wiki_projet/Users/GlobalsColors.dart';
import '../DataBase/DbHelper.dart';

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

  Future<void> _signalCommentary(int? commentaryId) async {
    bool isCommentarySignaled = await DbHelper.signalCommentary(commentaryId!);

    if (isCommentarySignaled) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Commentaire signalé avec succès')),
      );
      _getCommentaryList();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur lors du signalement du commentaire')),
      );
    }
  }

  Commentary? commentary;
  bool showComments = false;
  List<String>? comments;
  final String title = "cc";
  final String content = "content1";

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
                  int userId = await getCurrentUserId();
                  String userName = await getCurrentUserEmail();

                  Commentary newCommentary = Commentary(
                    id: commentary?.id,
                    isSignaled: 0,
                    userName: userName,
                    content: commentController.text,
                    userId: userId,
                    date: DateTime.now(),
                  );
                  await DbHelper.addCommentary(newCommentary, userId);
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

  Future<int> getCurrentUserId() async {
    User? user = await DbHelper.getCurrentUser();
    if (user != null) {
      return user.id!;
    } else {
      throw Exception("No logged-in user found.");
    }
  }

  Future<String> getCurrentUserEmail() async {
    User? user = await DbHelper.getCurrentUser();
    if (user != null) {
      return user.mail;
    } else {
      throw Exception("No logged-in user found.");
    }
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
              subtitle: AnimatedCrossFade(
                firstChild: Text(
                  content,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                secondChild: Text(
                  content,
                  maxLines: 100,
                  overflow: TextOverflow.ellipsis,
                ),
                crossFadeState:
                showComments ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                duration: const Duration(milliseconds: 300),
              ),
              trailing: IconButton(
                icon: Icon(Icons.remove_red_eye),
                onPressed: () {
                  _viewFullContent(context);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton.icon(
                    onPressed: toggleComments,
                    icon: Icon(showComments ? Icons.expand_less : Icons.expand_more),
                    label: Text(showComments ? 'Voir moins' : 'Voir plus'),
                  ),
                  ElevatedButton.icon(
                    onPressed: addComment,
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      minimumSize: Size(0, 30),
                      backgroundColor: GlobalsColors.mainColor,
                    ),
                    icon: Icon(Icons.add_comment, size: 16),
                    label: Text('Ajouter commentaire', style: TextStyle(fontSize: 12)),
                  ),
                ],
              ),
            ),
            if (showComments)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    if (comments != null && comments!.isNotEmpty)
                      ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: comments!.map((comment) {
                          Commentary? selectedCommentary;
                          try {
                            selectedCommentary = commentaryList?.firstWhere(
                                  (commentary) => commentary.content == comment,
                            );
                          } catch (e) {
                            // Handle the case when no matching commentary is found
                            selectedCommentary = null;
                          }

                          if (selectedCommentary != null) {
                            String userName = selectedCommentary.userName ?? 'Unknown User';
                            String date = DateFormat.yMd().add_Hm().format(selectedCommentary.date ?? DateTime.now());

                            return ListTile(
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(comment),
                                  SizedBox(height: 4),
                                  Text(
                                    'By $userName on $date',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () {
                                      _deleteCommentary(selectedCommentary!);
                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.report),
                                    onPressed: () {
                                      _signalCommentary(selectedCommentary?.id);
                                    },
                                  ),
                                ],
                              ),
                            );
                          } else {
                            return Container();
                          }
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
