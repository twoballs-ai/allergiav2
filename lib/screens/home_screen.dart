// import 'package:allergia/models/food_post.dart';
// import 'package:allergia/screens/details/food_list_details_screen.dart';
import 'package:allergiav2/models/allergen_post.dart';
import 'package:allergiav2/services/remote_service.dart';
import 'package:flutter/material.dart';
// import '../Home/allergen_list_screen.dart';
// import '../Home/food_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Дневник аллергика'),
      ),
      body: Column(
        children: <Widget>[
          const Text('Карточки аллергии', maxLines: 1),
          FutureBuilder<List<AllergenPost>?>(
            future: _client.getAllergens(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<AllergenPost>? cardlist = snapshot.data;
                print('начало виджета ${snapshot.data}');
                if (cardlist != null) {
                  List<AllergenPost> allergensData = cardlist;
                  // print(allergensData[0].name);
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: allergensData.length,
                    itemBuilder: ((context, i) {
                      return Card(
                        child: InkWell(
                          splashColor: Colors.blue.withAlpha(30),
                          onTap: () {},
                          child: ListTile(
                            title: Text(
                              allergensData[i].name,
                              style: const TextStyle(
                                fontSize: 18.0,
                                color: Colors.black54,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            subtitle: Text(
                              allergensData[i].name,
                              style: const TextStyle(
                                fontSize: 14.0,
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            isThreeLine: true,
                          ),
                        ),
                      );
                    }),
                  );
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
