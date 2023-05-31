import 'package:flutter/material.dart';
import 'package:wiki_projet/DataBase/DbHelper.dart';
import 'package:wiki_projet/Models/ProjectModel.dart';

class ProjectListPage extends StatefulWidget {
  @override
  _ProjectListPageState createState() => _ProjectListPageState();
}

class _ProjectListPageState extends State<ProjectListPage> {
  List<Project> _projects = [];
  List<bool> _expandedList = [];

  @override
  void initState() {
    super.initState();
    _loadProjects();
  }

  void _loadProjects() async {
    List<Project>? projects = await DbHelper.getAllProjects();
    if (projects != null) {
      setState(() {
        _projects = projects;
        _expandedList = List.generate(_projects.length, (index) => false);
      });
    }
  }

  void _showAddProjectDialog() {
    String title = '';
    String description = '';
    String resources = '';
    String languages = '';
    String time = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: AlertDialog(
            title: Text('Ajouter un projet'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration: InputDecoration(labelText: 'Titre'),
                  onChanged: (value) {
                    title = value;
                  },
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Description'),
                  onChanged: (value) {
                    description = value;
                  },
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Ressources'),
                  onChanged: (value) {
                    resources = value;
                  },
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Langages'),
                  onChanged: (value) {
                    languages = value;
                  },
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Temps estimé'),
                  onChanged: (value) {
                    time = value;
                  },
                ),
              ],
            ),
            actions: [
              TextButton(
                child: Text('Annuler'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text('Ajouter'),
                onPressed: () async {
                  // Créez une instance du projet à partir des valeurs saisies
                  Project projectModelToAdd = Project(
                    id: _projects.length + 1,
                    title: title,
                    description: description,
                    resources: resources,
                    languages: languages,
                    time: time,
                  );

                  // Ajoutez le projet à la base de données
                  await DbHelper.addProject(projectModelToAdd);

                  setState(() {
                    _projects.add(projectModelToAdd);
                    _expandedList.add(false);
                  });
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des projets'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              _showAddProjectDialog();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: ExpansionPanelList(
            elevation: 1,
            expandedHeaderPadding: EdgeInsets.all(0),
            expansionCallback: (int index, bool isExpanded) {
              setState(() {
                _expandedList[index] = !isExpanded;
              });
            },
            children: _projects.asMap().entries.map<ExpansionPanel>((entry) {
              int index = entry.key;
              Project project = entry.value;
              return ExpansionPanel(
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ListTile(
                    title: Text(project.title),
                  );
                },
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: [
                          Icon(Icons.description, color: Colors.blue),
                          SizedBox(width: 8.0),
                          Text(
                            'Description:',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 32.0),
                      child: Text(
                        project.description,
                        style: TextStyle(fontSize: 16.0, color: Colors.grey),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: [
                          Icon(Icons.folder, color: Colors.green),
                          SizedBox(width: 8.0),
                          Text(
                            'Ressources:',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 32.0),
                      child: Text(
                        project.resources,
                        style: TextStyle(fontSize: 16.0, color: Colors.grey),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: [
                          Icon(Icons.code, color: Colors.orange),
                          SizedBox(width: 8.0),
                          Text(
                            'Langages:',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 32.0),
                      child: Text(
                        project.languages,
                        style: TextStyle(fontSize: 16.0, color: Colors.grey),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: [
                          Icon(Icons.timer, color: Colors.red),
                          SizedBox(width: 8.0),
                          Text(
                            'Temps estimé:',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 32.0),
                      child: Text(
                        project.time,
                        style: TextStyle(fontSize: 16.0, color: Colors.grey),
                      ),
                    ),
                  ],
                ),
                isExpanded: _expandedList[index],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ProjectListPage(),
  ));
}
