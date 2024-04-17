import 'package:flutter/material.dart';

class ReadNotes extends StatelessWidget {
  String title;
  String description;
  ReadNotes({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios_new)),
        backgroundColor: Colors.blue.withOpacity(.4),
        title: const Text(
          "Ver Detalhes da Tarefa",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
        ),
      ),
      body: Container(
          width: w,
          height: h,
          color: Colors.blue.withOpacity(.1),
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              const Text("Título:",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 19)),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(right: 40),
                child: Container(
                  padding: const EdgeInsets.all(2),
                  height: 40,
                  width: w,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(.5),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 8),
                    height: 40,
                    width: w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      title,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              const Text("Descrição:",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 19)),
              const SizedBox(height: 10),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(8),
                width: w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  description,
                  textAlign: TextAlign.justify,
                ),
              ),
              const SizedBox(height: 60),
            ],
          )),
    );
  }
}
