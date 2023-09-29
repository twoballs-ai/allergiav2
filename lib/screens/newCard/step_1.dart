// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:allergia/screens/newCard/step_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:allergia/services/remote_service.dart';

class CategoryValueInput extends StatefulWidget {
  const CategoryValueInput({
    Key? key,
  }) : super(key: key);

  @override
  State<CategoryValueInput> createState() => _CategoryValueInputState();
}

class _CategoryValueInputState extends State<CategoryValueInput> {
  final DioClient _client = DioClient();

  Future<dynamic> categoryItems() async {
    var res = await _client.getCategoryItems();

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    // print(res);
    return res;
  }

  @override
  initState() {
    categoryItems();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: Column(children: [
        SizedBox(height: size.height * 0.08),
        Text(
          'Шаг-1', textDirection: TextDirection.ltr, // текст слева направо
          textAlign: TextAlign.center, // выравнивание по центру
          style: TextStyle(
              color: Colors.teal, // зеленый цвет текста
              fontSize: 22 // высота шрифта 26
              ),
        ),
        const Text(
          'Выберите категорию аллергии',
          style: const TextStyle(
            fontSize: 18.0,
            color: Colors.black54,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: size.height * 0.04),
        const Text(
            'В данный момент вы можете создать карточку аллергии только с одной аллергией, в будущем вы сможете создавать многокомпонентную карточку аллергии.'),
        SizedBox(height: size.height * 0.04),
        FutureBuilder<dynamic>(
            future: categoryItems(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<dynamic>? categorylist = snapshot.data;
                return Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: categorylist?.length,
                    itemBuilder: ((context, i) {
                      return Card(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AllergenInputByCat(
                                    id: categorylist[i]["id"]),
                              ),
                            );
                          },
                          child: ListTile(
                            leading: Icon(Icons.food_bank),
                            title: Text(categorylist![i]["name"].toString()),
                            subtitle: Text(''),
                          ),
                        ),
                      );
                    }),
                  ),
                );
              }
              return const CircularProgressIndicator();
              // if (!snapshot.hasData) {
              //   return CircularProgressIndicator();
              // }
              // List<dynamic> categorylist = snapshot.data;
              // if (categorylist != null) {
              //   List<dynamic> categoryData = categorylist;
              //   // print(categoryData);
              //   return Card(
              //     child: Text("d"),
              //   );
              // }
            }),
      ]),
    );
  }
}
