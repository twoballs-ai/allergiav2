// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:allergia/models/allergen_card.dart';
import 'package:allergia/services/remote_service.dart';

class allergenCardScreen extends StatefulWidget {
  final int pk;
  const allergenCardScreen({
    Key? key,
    required this.pk,
  }) : super(key: key);

  @override
  State<allergenCardScreen> createState() => _allergenCardScreenState();
}

class _allergenCardScreenState extends State<allergenCardScreen> {
  final DioClient _client = DioClient();

  Future<void> delete() async {
    var res = await _client.deleteCard(pk: widget.pk);

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    // print(res);
    if (res == 204) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Карточка удалена: '),
        backgroundColor: Colors.lightGreen.shade300,
      ));
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/wrapper', (Route<dynamic> route) => false);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Ошибка: ${res.detail}'),
        backgroundColor: Colors.red.shade300,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: Container(
        child: FutureBuilder<AllergenCard?>(
          future: _client.getAllergenCard(widget.pk),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              AllergenCard? card = snapshot.data;
              // print('начало виджета ${snapshot.data}');
              if (card != null) {
                AllergenCard? allergenCardData = card;
                // // print(allergensData[0].name);
                return Column(children: [
                  SizedBox(height: size.height * 0.08),
                  Text(
                    "Карточка аллергии: ${allergenCardData.name}",
                    textDirection: TextDirection.ltr, // текст слева направо
                    textAlign: TextAlign.center, // выравнивание по центру
                    style: TextStyle(
                        color: Colors.teal, // зеленый цвет текста
                        fontSize: 22 // высота шрифта 26
                        ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: allergenCardData.carriers.length,
                    itemBuilder: ((context, i) {
                      return Card(
                        margin: const EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        elevation: 20,
                        shadowColor: Colors.amber[900],
                        child: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomLeft,
                              end: Alignment(0.8, 1),
                              colors: [
                                Color.fromARGB(26, 199, 13, 236),
                                Color.fromARGB(75, 28, 155, 240),
                                Color.fromARGB(55, 183, 212, 18)
                              ],
                              // tileMode: TileMode.mirror,
                            ),
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: size.height * 0.02),
                              Text(
                                'Компонент: ${allergenCardData.carriers[i]!.name}',
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  color: Color.fromARGB(255, 71, 71, 71),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(height: size.height * 0.03),
                              CircleAvatar(
                                backgroundColor: Colors.amber[900],
                                radius: 55,
                                child: CircleAvatar(
                                  radius: 50,
                                  backgroundImage: NetworkImage(
                                      allergenCardData.carriers[i]!.image),
                                ),
                              ),
                              SizedBox(height: size.height * 0.03),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Аллерген:',
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        color: Color.fromARGB(255, 71, 71, 71),
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      allergenCardData
                                          .carriers[i]!.allergen.name,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                        color: Color.fromARGB(255, 71, 71, 71),
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      ('Категория:'),
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                        color: Color.fromARGB(255, 71, 71, 71),
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      allergenCardData
                                          .carriers[i]!.category.name,
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                        color: Color.fromARGB(255, 71, 71, 71),
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: size.height * 0.02),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                  ElevatedButton.icon(
                    onPressed: delete,
                    icon: Icon(
                      Icons.delete,
                      color: Colors.green[100],
                      size: 30.0,
                    ), //icon data for elevated button
                    label: Text("Удалить карточку: '${allergenCardData.name}'"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[700], // background
                      foregroundColor: Colors.yellow[100], // foreground
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                    ), //label text
                  )
                ]);
              }
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
