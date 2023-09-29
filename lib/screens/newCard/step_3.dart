// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:allergia/services/remote_service.dart';
import 'package:allergia/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AddNewCardScreen extends StatefulWidget {
  final int idCard;
  const AddNewCardScreen({
    Key? key,
    required this.idCard,
  }) : super(key: key);

  @override
  State<AddNewCardScreen> createState() => _AddNewCardScreenState();
}

class _AddNewCardScreenState extends State<AddNewCardScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController textController = TextEditingController();
  final DioClient _client = DioClient();

  Future<void> addCard() async {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Пожалуйста ждите'),
        backgroundColor: Colors.green.shade300,
      ));

      var res = await _client.addNewCard(
          CardName: textController.text, id: widget.idCard);

      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      // print('hi');
      // print(res);
      if (res == 'Created') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Карточка добавлена: '),
          backgroundColor: Colors.lightGreen.shade300,
        ));
        Navigator.of(context).pushNamedAndRemoveUntil(
            '/wrapper', (Route<dynamic> route) => false);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Ошибка: ${res.name}'),
          backgroundColor: Colors.red.shade300,
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: ListView(
        children: <Widget>[
          SizedBox(height: size.height * 0.08),
          Text(
            'Шаг-3',
            textDirection: TextDirection.ltr, // текст слева направо
            textAlign: TextAlign.center, // выравнивание по центру
            style: TextStyle(
                color: Colors.teal, // зеленый цвет текста
                fontSize: 22 // высота шрифта 26
                ),
          ),
          Text(
            'Назовите вашу карточку аллергии, в будущем вы получите больше возможностей для взаимодедйствия с ней.',
            style: const TextStyle(
              fontSize: 18.0,
              color: Colors.black54,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: size.height * 0.08),
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                controller: textController,
                validator: (value) {
                  return Validator.validateText(value ?? "");
                },
                decoration: InputDecoration(
                  // hintText: "Почтовый адрес",
                  isDense: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: 'Введите название создаваемой карточки',
                ),
              ),
            ),
          ),
          ElevatedButton.icon(
            onPressed: addCard,
            icon: Icon(
              Icons.save,
              color: Colors.green[100],
              size: 30.0,
            ), //icon data for elevated button
            label: Text("сохранить и создать карточку"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.cyan[300], // background
              foregroundColor: Colors.yellow[100], // foreground
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0),
              ),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            ),
          )
        ],
      ),
    );
  }
}
