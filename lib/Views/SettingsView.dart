import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:wiki_projet/Models/UserModel.dart';
import 'package:wiki_projet/DataBase/DbHelper.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wiki_projet/Users/GlobalsColors.dart';
import 'package:wiki_projet/Views/LoginView.dart';
import 'package:wiki_projet/Models/InformationModel.dart';

class SettingsView extends StatefulWidget {
  SettingsView({Key? key}) : super(key: key);

  @override
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  File? _imageFile;
  String? _selectedLanguage;
  User? _currentUser;
  String? _userPicturePath;
  String? _newUsername;
  String? _newEmail;
  String? _newPassword;
  Information? _information; // Ajout de la variable _information

  @override
  void initState() {
    super.initState();
    _selectedLanguage = 'Français';
    _getCurrentUser();
  }

  Future<void> _getCurrentUser() async {
    _currentUser = await DbHelper.getCurrentUser();
    _getUserPicture();
    _getInformationByUserId(); // Appel de la méthode pour récupérer les informations
    setState(() {});
  }

  Future<void> _getUserPicture() async {
    final currentUser = _currentUser;
    if (currentUser != null) {
      final picturePath = await DbHelper.getUserPicture(currentUser.id!);
      setState(() {
        _userPicturePath = picturePath;
      });
    }
  }

  Future<void> _getInformationByUserId() async {
    final currentUser = _currentUser;
    if (currentUser != null) {
      final information = await DbHelper.getInformationByUserId(currentUser.id!);
      setState(() {
        _information = information;
        _newGithubLinkController.text = information?.lienGithub ?? '';
        _newCompanyController.text = information?.entreprise ?? '';
        _newPreferredLanguageController.text = information?.langagePrefere ?? '';
      });
    }
  }

  Future<void> pickImage() async {
    final pickedFile = await FilePicker.platform.pickFiles(type: FileType.image);
    final currentUser = _currentUser;

    if (pickedFile != null && currentUser != null) {
      setState(() {
        _imageFile = File(pickedFile.files.single.path!);
        addUserPicture(currentUser.id!, _imageFile!.path);
      });
    }
  }

  List<String> _languageOptions = ['Français', 'English'];

  Future<void> addUserPicture(int userId, String imagePath) async {
    final updatedRows = await DbHelper.addUserPicture(userId, imagePath);
    if (updatedRows > 0) {
      _getUserPicture();
    }
  }

  void saveInformation() {
    final currentUser = _currentUser;
    if (currentUser != null) {
      final newInformation = Information(
        id: currentUser.id!,
        lienGithub: _newGithubLinkController.text,
        entreprise: _newCompanyController.text,
        langagePrefere: _newPreferredLanguageController.text,
        userId: currentUser.id!,
      );

      DbHelper.addInformationPersonnel(newInformation).then((rowsAffected) {
        if (rowsAffected > 0) {
          setState(() {
            _information = newInformation;
          });
          _showSnackbar('Informations enregistrées avec succès');
        } else {
          _showSnackbar('Erreur lors de l\'enregistrement des informations');
        }
      });
    }
  }

  final _newGithubLinkController = TextEditingController();
  final _newCompanyController = TextEditingController();
  final _newPreferredLanguageController = TextEditingController();

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void logout() {
    _currentUser = null;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => LoginView(),
      ),
    );
  }

  @override
  void dispose() {
    _newGithubLinkController.dispose();
    _newCompanyController.dispose();
    _newPreferredLanguageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Paramètres'),
            DropdownButton<String>(
              value: _selectedLanguage,
              onChanged: (newValue) {
                setState(() {
                  _selectedLanguage = newValue;
                });
              },
              items: _languageOptions
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ],
        ),
        backgroundColor: GlobalsColors.mainColor,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GestureDetector(
                  onTap: pickImage,
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.grey,
                        width: 2,
                      ),
                      image: _imageFile != null
                          ? DecorationImage(
                        image: FileImage(_imageFile!),
                        fit: BoxFit.cover,
                      )
                          : _userPicturePath != null
                          ? DecorationImage(
                        image: FileImage(File(_userPicturePath!)),
                        fit: BoxFit.cover,
                      )
                          : null,
                    ),
                    child: _imageFile == null && _userPicturePath == null
                        ? SvgPicture.asset('assets/images/Avatar.svg', height: 30)
                        : null,
                  ),
                ),
                const SizedBox(height: 16),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    _currentUser?.mail ?? 'Email de l\'utilisateur',
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Informations',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _newGithubLinkController,
                  decoration: InputDecoration(
                    labelText: 'Lien GitHub',
                    prefixIcon: Icon(Icons.link),
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _newCompanyController,
                  decoration: InputDecoration(
                    labelText: 'Entreprise',
                    prefixIcon: Icon(Icons.business),
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _newPreferredLanguageController,
                  decoration: InputDecoration(
                    labelText: 'Langue préférée',
                    prefixIcon: Icon(Icons.language),
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: saveInformation, // Appel de la méthode pour enregistrer les informations
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(16),
                    primary: Colors.green,
                  ),
                  child: const Text(
                    'Enregistrer',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: logout,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(16),
                    primary: Colors.red,
                  ),
                  child: const Text(
                    'Déconnexion',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
