import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled4/models/note_model.dart';
import 'package:untitled4/src/views/create_note_activity/components/buttom.dart';
import 'package:untitled4/src/views/list_notes_activity/list_notes_screen.dart';

class CreateNotes extends StatefulWidget {
  const CreateNotes({super.key});

  @override
  State<CreateNotes> createState() => _CreateNotesState();
}

class _CreateNotesState extends State<CreateNotes> {
  TextEditingController title = TextEditingController(text: "");
  TextEditingController description = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    Future addTarefa(String title, String description) async {
      NoteModel newNote = NoteModel(title: title, description: description);
      SharedPreferences shared = await SharedPreferences.getInstance();
      if (shared.getStringList("title") == null) {
        shared.setStringList("title", [title]);
        shared.setStringList("description", [description]);
      } else {
        List<String>? listTitle = shared.getStringList("title");
        List<String>? listDescription = shared.getStringList("description");
        listTitle!.add(title);
        listDescription!.add(description);
        shared.setStringList("title", listTitle);
        shared.setStringList("description", listDescription);
      }
      setState(() {});
    }

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios_new)),
        backgroundColor: Colors.blue.withOpacity(.4),
        title: const Text(
          "Criar Tarefa",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
            width: w,
            height: h,
            color: Colors.blue.withOpacity(.1),
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50, right: 40),
                  child: TextFormField(
                    textInputAction: TextInputAction.done,
                    scrollController: ScrollController(),
                    maxLines: 1,
                    textAlign: TextAlign.start,
                    style: const TextStyle(color: Colors.black),
                    controller: title,
                    onChanged: (value) {
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      isDense: true,
                      contentPadding: const EdgeInsets.all(10),
                      hintText: 'Titulo',
                      hintStyle: const TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                      ),
                      labelStyle: const TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide:
                            const BorderSide(color: Colors.black, width: 1.8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(
                            color: Colors.black.withOpacity(.5), width: 1.8),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Form(
                  child: TextFormField(
                    textInputAction: TextInputAction.done,
                    scrollController: ScrollController(),
                    maxLines: 10,
                    textAlign: TextAlign.start,
                    style: const TextStyle(color: Colors.black),
                    controller: description,
                    onChanged: (value) {
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      isDense: true,
                      contentPadding: const EdgeInsets.all(10),
                      hintText: 'Descrição...',
                      hintStyle: const TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                      ),
                      labelStyle: const TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide:
                            const BorderSide(color: Colors.black, width: 1.8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(
                            color: Colors.black.withOpacity(.5), width: 1.8),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 60),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                        onTap: () async {
                          if (title.text.isNotEmpty &&
                              description.text.isNotEmpty) {
                            await addTarefa(title.text, description.text);
                            title.clear();
                            description.clear();
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ListNotesScreen()));
                          }
                        },
                        child:
                            buttom(150, 50, Colors.blue.withOpacity(.6), "OK")),
                    InkWell(
                        onTap: () {
                          title.clear();
                          description.clear();
                        },
                        child: buttom(150, 50, Colors.redAccent.withOpacity(.8),
                            "Cancelar")),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
