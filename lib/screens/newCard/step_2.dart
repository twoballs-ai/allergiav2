// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:allergia/models/allergen_by_cat.dart';
import 'package:allergia/screens/newCard/step_3.dart';
import 'package:allergia/services/remote_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AllergenInputByCat extends StatefulWidget {
  final int id;
  const AllergenInputByCat({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<AllergenInputByCat> createState() => _AllergenInputByCatState();
}

class _AllergenInputByCatState extends State<AllergenInputByCat> {
  final DioClient _client = DioClient();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: Container(
        child: FutureBuilder<List<AllergenByCat?>?>(
          future: _client.getAllergensByCat(id: widget.id),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<AllergenByCat?>? bycatcard = snapshot.data;
              // print('начало виджета ${snapshot.data}');
              if (bycatcard != null) {
                List<AllergenByCat?>? allergenByCatCardData = bycatcard;
                // // print(allergensData[0].name);
                return Column(children: [
                  SizedBox(height: size.height * 0.08),
                  Text(
                    'Шаг-2',
                    textDirection: TextDirection.ltr, // текст слева направо
                    textAlign: TextAlign.center, // выравнивание по центру
                    style: TextStyle(
                        color: Colors.teal, // зеленый цвет текста
                        fontSize: 22 // высота шрифта 26
                        ),
                  ),
                  Text(
                    'Выберите компонент на который у вас аллергическая реакция',
                    style: const TextStyle(
                      fontSize: 18.0,
                      color: Colors.black54,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: allergenByCatCardData.length,
                      itemBuilder: ((context, i) {
                        return Card(
                          child: Column(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => AddNewCardScreen(
                                          idCard: allergenByCatCardData[i]!.id,
                                        ),
                                      ));
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.indigo,
                                  shape: const CircleBorder(), //<-- SEE HERE
                                  padding: const EdgeInsets.all(10),
                                ),
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.green,
                                  size: 18,
                                ),
                              ),
                              Text('Виновник аллергии:'),
                              Text(
                                allergenByCatCardData[i]!.name,
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.black45,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                    allergenByCatCardData[i]!.image),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      ('Аллерген:'),
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                        color: Colors.black45,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      allergenByCatCardData[i]!.allergen.name,
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                        color: Colors.black45,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      ('категория аллергена:'),
                                      style: const TextStyle(
                                        fontSize: 13.0,
                                        color: Color.fromARGB(115, 177, 0, 0),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      allergenByCatCardData[i]!.category.name,
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                        color: Colors.black45,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
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
