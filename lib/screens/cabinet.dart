import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersonalCabinet extends StatefulWidget {
  const PersonalCabinet({super.key});

  @override
  State<PersonalCabinet> createState() => _PersonalCabinetState();
}

class _PersonalCabinetState extends State<PersonalCabinet> {
  void _handleLogout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('accessToken');
    prefs.remove('refreshToken');
    // prefs.remove('ID_Device' );
    Navigator.pushNamedAndRemoveUntil(
        context, '/login', ModalRoute.withName('/login'));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text('Если у вас возникли вопросы вы можете написать по адресу:'),
            Text('silmarillgames@gmail.com'),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: _handleLogout,
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.red,
                  side: BorderSide(
                    color: Colors.red,
                  ),
                ),
                child: Text("Выход из системы"),
              ),
            )
          ]),
    );
  }
}
