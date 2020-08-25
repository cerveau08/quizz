import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';
import 'package:quizz/widgets/custom_text.dart';
import 'package:quizz/models/question.dart';
class PageQuizz extends StatefulWidget {
  
  @override
  _PageQuizzState createState() => _PageQuizzState();
}

class _PageQuizzState extends State<PageQuizz> {

  Question question;

  List<Question> listeQuestions = [
    Question('La capitale du Senegal est Dakar', true,'', 'senegal.png'),
    Question('La capitale de l\'Afrique du Sud est Johannesburg', false,'', 'southAfrica.png'),
    Question('La capitale du Niger est Niamey', true,'', 'niger.png'),
    Question('La capitale du Mali est Kati', false,'', 'mali.png'),
    Question('La capitale du Nigeria est Lagos', false,'', 'nigeria.png'),
    Question('La capitale du Maroc est Casablanca', false,'', 'maroc.png'),
    Question('La capitale de la Gambie est Farafenni', false,'', 'gambie.png'),
    Question('La capitale de la Guinee Conakry est Conakry', true,'', 'guinee.png'),
    Question('La capitale du Gabon est Port-Gentil', false,'', 'gabon.png'),
    Question('La capitale de la Libye est Benghazi', false,'', 'libye.png'),
    Question('La capitale de la Mauritanie est Nouakchott', true,'', 'mauritanie.png'),
    Question('La capitale du Liberia est Monrovia', true,'', 'liberia.png'),
    Question('La capitale du Kenya est Nairobi', true,'', 'kenya.png'),
    Question('La capitale du Cameroun est Douala', false,'', 'cameroun.png'),
    Question('La capitale de la Somalie est Mogadishu', true,'', 'somalie.png'),
    Question('La capitale de Djibouti est Djibouti', true,'', 'djibouti.png'),
    Question('La capitale du Burkina Faso est Ouagadougou', true,'', 'faso.png'),
    Question('La capitale du Benin est Cotonou', false,'', 'benin.png'),
    Question('La capitale du Togo est Lome', true,'', 'togo.png'),
    Question('La capitale du Ghana est Kumasi', false,'', 'ghana.png'),
    Question('La capitale de l\'Ethiopie est Addis Abeba', true,'', 'ethiopi.png'),
    Question('La capitale de la Centre Afrique est Bangui', true,'', 'centreA.png'),
    Question('La capitale du Congo est Brazzaville', true,'', 'congo.png'),
    Question('La capitale de l\'Eswatini est Mbabane', true,'', 'eswatini.png'),
    Question('La capitale du Cap Vert est Praia', true,'', 'capVert.png'),
    Question('La capitale de l\'Algerie est Alger', true,'', 'algerie.png'),
    Question('La capitale de l\'Egypte est Alexandrie', false,'', 'egypt.jpeg'),
    Question('La capitale de la Tanzanie est Dodoma', false,'', 'tanzani.png'),
    Question('La capitale de la Zambie est Lusaka', true,'', 'zambie.png'),
    Question('La capitale de Lesotho est Maseru', true,'', 'lesotho.png'),
    Question('La capitale du Tunisie est Carthage', false,'', 'tunisie.png'),
    Question('La capitale de la Guinne Bissau est Bafata', false,'', 'bissau.png'),
    Question('La capitale de la Sierra Leone est Freetown', true,'', 'sierra.png'),
    Question('La capitale de la Mozambique est Beira', false,'', 'mozambique.png'),
    Question('La capitale de la Cote d\'Ivoire est Abidjan', false,'', 'ivoire.png'),
    Question('La capitale du Soudan est Bahri', false,'', 'soudan.png'),
    Question('La capitale de l\'Ouganda est Entebbe', false,'', 'ouganda.png'),
    Question('La capitale de Zimbabwe est Bulawayo', false,'', 'zimbabwe.png'),
    Question('La capitale du Tchad est N\'Diamena', true,'', 'tchad.jpeg'),
    Question('La capitale du Soudan du Sud est Juba', true,'', 'soudanSud.png'),
    Question('La capitale du Seychelle est Victoria', true,'', 'seychelle.png'),
    Question('La capitale du Sao Tome et Principe est Trindade', false,'', 'saotome.png'),
    Question('La capitale du Rwanda est Kamembe', false,'', 'rwanda.png'),
    Question('La capitale de la RD Congo est Kinshasa', true,'', 'rdc.png'),
    Question('La capitale de la Namibie est Swakopmund', false,'', 'namibie.png'),
    Question('La capitale de l\'Ile Maurice est Vacoas-Phoenix', false,'', 'maurice.png'),
    Question('La capitale du Bostwana est Lobaste', false,'', 'bostwana.png'),
    Question('La capitale de l\'Angola est Cabinda', false,'', 'angola.png'),
    Question('La capitale de l\'Erythree est Assab', false,'', 'erythre.png'),
    Question('La capitale du Madagascar est Antananarivo', true,'', 'madagascar.png'),
    Question('La capitale de la Guinee Equatorial est Bata', false,'', 'equatorial.png'),
    Question('La capitale du Comores est Domoni', false,'', 'comores.png'),
    Question('La capitale du Burundi est Bujumbura', true,'', 'burundi.png'),
    Question('La capitale du Malawi est Lilongwe', true,'', 'malawi.png'),
  ];
  int index = 0;
  int score = 0;

  @override
  void initState() {
    super.initState();
    question = listeQuestions[index];
  }

  @override
  Widget build(BuildContext context) {
    double taille = MediaQuery.of(context).size.width * 0.8;
    return Scaffold(
      appBar: AppBar(
        title: CustomText("Le quizz"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomText("Question numero ${index + 1}", color: Colors.grey[900],),
            CustomText("Score: $score / $index", color: Colors.grey[900],),
            Card(
              elevation: 10,
              child: Container(
                height: taille,
                width: taille,
                child: Image.asset(
                  "assets/images/${question.imagePath}",
                  //fit: BoxFit.cover
                ),
              ),
            ),
            CustomText(
              question.question,
              color: Colors.grey[900],
              factor: 1.3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                boutonBool(true),
                boutonBool(false)
              ],
            )
          ],
        ),
      ),
    );
  }

  RaisedButton boutonBool (bool b) {
    return RaisedButton(
      elevation: 10,
      onPressed: (() => dialogue(b)),
      color: Colors.blue,
      child: CustomText((b)? "Vrai": "Faux"),
    );
  }

  Future<Null> dialogue(bool b) async {
    bool bonneReponse = (b == question.reponse);
    String vrai = "assets/images/win.jpeg";
    String faux = "assets/images/lose.jpeg";

    if (bonneReponse) {
      score++;
    }

    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: CustomText((bonneReponse)? "C'est gagne!": "perdu...", factor: 1.4, color: (bonneReponse)? Colors.green: Colors.red),
          contentPadding: EdgeInsets.all(20),
          children: [
            Image.asset((bonneReponse)? vrai: faux,),
            Container(height: 25,),
            CustomText(question.explication, factor: 1.25, color: Colors.grey[900]),
            Container(height: 25,),
            RaisedButton(
              onPressed: () {
                Navigator.pop(context);
                questionSuivante();
              },
              child: CustomText("Au Suivant", factor: 1.25,),
              color: Colors.blue,
            )
          ],
        );
      }
    );
  }
  

  Future<Null> alerte() async {
    return showDialog(context: context,
      barrierDismissible: false,
      builder: (BuildContext buildContext) {
        return AlertDialog(
          title: CustomText("C'est fini", color: Colors.blue, factor: 1.25,),
          contentPadding: EdgeInsets.all(10),
          content: CustomText("Votre score: $score / $index", color: Colors.grey[900]),
          actions: [
            FlatButton(
              onPressed: (() {
                Navigator.pop(buildContext);
                Navigator.pop(context);
              }),
              child: CustomText("Ok", factor: 1.25, color: Colors.blue,),
            )
          ],
        );
      }
    );
  }

  void questionSuivante() {
    if (index < listeQuestions.length) {
      index++;
      setState(() {
        question = listeQuestions[index];
      });
    } else {
      alerte();
    }
  }
}