import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled4/models/note_model.dart';
import 'package:untitled4/src/views/create_note_activity/components/buttom.dart';
import 'package:untitled4/src/views/create_note_activity/create_notes_screen.dart';
import 'package:untitled4/src/views/read_note_activity/read_note_screen.dart';

class ListNotesScreen extends StatefulWidget {
  const ListNotesScreen({super.key});

  @override
  State<ListNotesScreen> createState() => _ListNotesScreenState();
}

class _ListNotesScreenState extends State<ListNotesScreen> {
  List<String> titles = [];
  List<String> descriptions = [];

  @override
  void initState() {
    super.initState();
    loadNotes();
  }

  Future<void> loadNotes() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    List<String>? titlesLoaded = shared.getStringList('title');
    List<String>? descriptionsLoded = shared.getStringList('description');
    if (titlesLoaded != null) {
      setState(() {
        titles = titlesLoaded;
        descriptions = descriptionsLoded!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.withOpacity(.4),
        centerTitle: true,
        title: const Text(
          "Listar Tarefas",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.blue.withOpacity(.1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 160,
              //color: Colors.amber,
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ReadNotes(
                                        title: titles[index],
                                        description: descriptions[index],
                                      )));
                        },
                        child: Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.all(5),
                          height: 50,
                          child: Text(titles[index]),
                        ),
                      ),
                      if (index == titles.length - 1)
                        Container(height: 1.5, color: Colors.black)
                    ],
                  );
                },
                separatorBuilder: (context, index) =>
                    Container(height: 1.5, color: Colors.black),
                itemCount: titles.length,
              ),
            ),
            InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CreateNotes())),
                child:
                    buttom(150, 50, Colors.blue.withOpacity(.8), "Nova Nota")),
          ],
        ),
      ),
    );
  }
}
