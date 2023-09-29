// import 'package:allergia/models/food_post.dart';
// import 'package:allergia/screens/details/food_list_details_screen.dart';
import 'package:allergia/models/allergen_post.dart';
import 'package:allergia/screens/newCard/step_3.dart';
import 'package:allergia/screens/allergen_card_screen.dart';
import 'package:allergia/screens/newCard/step_1.dart';
import 'package:allergia/services/remote_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import '../Home/allergen_list_screen.dart';
// import '../Home/food_list_screen.dart';

class HomeScreen extends StatefulWidget {
  final String? accesstoken;
  const HomeScreen({
    Key? key,
    this.accesstoken,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final myController = TextEditingController();
  Map<String, dynamic> body = <String, dynamic>{};
  final DioClient _client = DioClient();

  // @override
  // void initState() {
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   myController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: Column(
        textDirection: TextDirection.ltr,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: size.height * 0.05),
          const Text(
            "Добро пожаловать в дневник аллергика",
            textDirection: TextDirection.ltr, // текст слева направо
            textAlign: TextAlign.center, // выравнивание по центру
            style: TextStyle(
                color: Colors.teal, // зеленый цвет текста
                fontSize: 22 // высота шрифта 26
                ),
          ),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CategoryValueInput()));
            },
            label: Text("Добавить новую карточку аллергии"),
            icon: Icon(
              Icons.add_card,
              color: Colors.green[100],
              size: 30.0,
            ), //icon data for elevated button
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.cyan[300], // background
              foregroundColor: Colors.yellow[100], // foreground
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0),
              ),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            ),
          ),
          FutureBuilder<List<AllergenPost?>?>(
            future: _client.getAllergens(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<AllergenPost?>? cardlist = snapshot.data;
                // print('начало виджета ${snapshot.data}');
                if (cardlist != null && cardlist.length != 0) {
                  List<AllergenPost?>? allergensData = cardlist;
                  // print(cardlist.runtimeType);
                  return Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: allergensData.length,
                      itemBuilder: ((context, i) {
                        // print('next');

                        return Card(
                          margin: const EdgeInsets.all(10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          elevation: 20,
                          shadowColor: Colors.cyanAccent[50],
                          child: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment(0.8, 1),
                                colors: [
                                  Color.fromARGB(157, 236, 221, 13),
                                  Color.fromARGB(99, 111, 231, 115),
                                  Color.fromARGB(213, 24, 241, 205)
                                ],
                                // tileMode: TileMode.mirror,
                              ),
                            ),
                            child: SizedBox(
                              child: InkWell(
                                splashColor: Colors.blue.withAlpha(30),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              allergenCardScreen(
                                                pk: allergensData[i]!.pk,
                                              )));
                                },
                                child: Column(
                                  children: [
                                    SizedBox(height: size.height * 0.02),
                                    Text(
                                      "Карточка аллергии:  ${allergensData[i]!.name}",
                                      style: const TextStyle(
                                        fontSize: 20.0,
                                        color: Color.fromARGB(255, 71, 71, 71),
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(height: size.height * 0.03),
                                    ListView.builder(
                                      shrinkWrap: true,
                                      physics: ScrollPhysics(),
                                      itemCount:
                                          allergensData[i]!.carriers.length,
                                      itemBuilder: ((context, j) {
                                        return Column(children: [
                                          CircleAvatar(
                                            backgroundColor:
                                                Colors.cyanAccent[100],
                                            radius: 55,
                                            child: CircleAvatar(
                                              radius: 50,
                                              backgroundImage: NetworkImage(
                                                  allergensData[i]!
                                                      .carriers[j]
                                                      .image),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              'Компонент: ${allergensData[i]!.carriers[j].name}',
                                              style: const TextStyle(
                                                fontSize: 18.0,
                                                color: Color.fromARGB(
                                                    255, 71, 71, 71),
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: size.height * 0.03),
                                          Row(
                                            children: [
                                              const Expanded(
                                                child: Text(
                                                  'Аллерген:',
                                                  textAlign: TextAlign.end,
                                                  style: TextStyle(
                                                    fontSize: 18.0,
                                                    color: Color.fromARGB(
                                                        255, 71, 71, 71),
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  allergensData[i]!
                                                      .carriers[j]
                                                      .allergen
                                                      .name,
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                    fontSize: 18.0,
                                                    color: Color.fromARGB(
                                                        255, 71, 71, 71),
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  ('Kатегория:'),
                                                  style: const TextStyle(
                                                    fontSize: 18.0,
                                                    color: Color.fromARGB(
                                                        255, 71, 71, 71),
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  allergensData[i]!
                                                      .carriers[j]
                                                      .category
                                                      .name,
                                                  style: const TextStyle(
                                                    fontSize: 18.0,
                                                    color: Color.fromARGB(
                                                        255, 71, 71, 71),
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(height: size.height * 0.02),
                                        ]);
                                      }),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );

                        // Card(

                        //   margin: EdgeInsets.all(10),
                        //   elevation: 20,
                        //   shape: RoundedRectangleBorder(
                        //       borderRadius:
                        //           BorderRadius.all(Radius.circular(10))),
                        //   shadowColor: Colors.red[100],
                        //   child: SizedBox(
                        //     child: InkWell(

                        //       splashColor: Colors.blue.withAlpha(30),
                        //       onTap: () {
                        //         Navigator.push(
                        //             context,
                        //             MaterialPageRoute(
                        //                 builder: (context) =>
                        //                     allergenCardScreen(
                        //                       pk: allergensData[i]!.pk,
                        //                     )));
                        //       },
                        //       child: Column(
                        //         children: [
                        //           Text(
                        //             "Карточка аллергии:${allergensData[i]!.name}",
                        //             style: const TextStyle(
                        //               fontSize: 18.0,
                        //               color: Colors.black54,
                        //               fontWeight: FontWeight.w600,
                        //             ),
                        //           ),
                        //           ListView.builder(
                        //             shrinkWrap: true,
                        //             physics: ScrollPhysics(),
                        //             itemCount:
                        //                 allergensData[i]!.carriers.length,
                        //             itemBuilder: ((context, j) {
                        //               return Column(children: [
                        //                 Text('Виновник аллергии:'),
                        //                 Text(
                        //                   allergensData[i]!.carriers[j].name,
                        //                   style: const TextStyle(
                        //                     fontSize: 18.0,
                        //                     color: Colors.black45,
                        //                     fontWeight: FontWeight.w600,
                        //                   ),
                        //                 ),
                        //                 CircleAvatar(
                        //                   backgroundImage: NetworkImage(
                        //                       allergensData[i]!
                        //                           .carriers[j]
                        //                           .image),
                        //                 ),
                        //                 Row(
                        //                   children: [
                        //                     Expanded(
                        //                       child: Text(
                        //                         ('Аллерген:'),
                        //                         style: const TextStyle(
                        //                           fontSize: 18.0,
                        //                           color: Colors.black45,
                        //                           fontWeight: FontWeight.w600,
                        //                         ),
                        //                       ),
                        //                     ),
                        //                     Expanded(
                        //                       child: Text(
                        //                         allergensData[i]!
                        //                             .carriers[j]
                        //                             .allergen
                        //                             .name,
                        //                         style: const TextStyle(
                        //                           fontSize: 18.0,
                        //                           color: Colors.black45,
                        //                           fontWeight: FontWeight.w600,
                        //                         ),
                        //                       ),
                        //                     ),
                        //                     Expanded(
                        //                       child: Text(
                        //                         ('категория аллергена:'),
                        //                         style: const TextStyle(
                        //                           fontSize: 13.0,
                        //                           color: Color.fromARGB(
                        //                               115, 177, 0, 0),
                        //                           fontWeight: FontWeight.w600,
                        //                         ),
                        //                       ),
                        //                     ),
                        //                     Expanded(
                        //                       child: Text(
                        //                         allergensData[i]!
                        //                             .carriers[j]
                        //                             .category
                        //                             .name,
                        //                         style: const TextStyle(
                        //                           fontSize: 18.0,
                        //                           color: Colors.black45,
                        //                           fontWeight: FontWeight.w600,
                        //                         ),
                        //                       ),
                        //                     )
                        //                   ],
                        //                 )
                        //               ]);
                        //             }),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // );
                      }),
                    ),
                  );
                } else {
                  return Text('В данный момент у вас нет карточек.');
                }
              }
              return const CircularProgressIndicator();
            },
          ),
        ],
      ),
    );
  }
}
