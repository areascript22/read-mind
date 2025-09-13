import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

import '../../../../../../core/common/widget/custom_button.dart';
import '../widgets/textfield_code_course.dart';

class EnrollCourse extends StatefulWidget {
  const EnrollCourse({super.key});

  @override
  State<EnrollCourse> createState() => _EnrollCourseState();
}

class _EnrollCourseState extends State<EnrollCourse> {
  final codeTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.close),
        ),
        title: const Text("Unirse a un curso1"),
        actions: [
          //create button

          //Icon
          //IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
      ),
      body:
      true
          ? Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Profile
            const Text(
              "Accederas como",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text("Jose".substring(0, 2)),
                ),
                SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Jose Luis",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text("jluisgg2002@gmail.com"),
                  ],
                ),
              ],
            ),
            //Divider
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Divider(),
            ),
            //Code message
            const Text(
              "Pídele al propietario del curso el código del curso, y luego, ingrésalo aquí.",
            ),
            //TextField
            const SizedBox(height: 20),
            TextFieldCodeCourse(
              label: "Código del curso",
              textEditingController: codeTextController,
            ),
            const SizedBox(height: 15),
            CustomButton(
              onTap: () {
                //Join course logic
              },
              child: const Text("Unirse"),
            ),

            //Indications
            const SizedBox(height: 10),
            Divider(),
            const Text(
              "Indicaciónes para acceder con un código de la clase",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(left: 20, top: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("• Usa una cuenta autorizada"),
                  SizedBox(height: 6),
                  Text(
                    "• Usa un código de la clase que tenga entre 6 y 8 letras o números, sin espacios ni símbolos",
                  ),
                ],
              ),
            ),

            //Help messages
            const SizedBox(height: 20),
            RichText(
              text: TextSpan(
                style: const TextStyle(color: Colors.black),
                children: [
                  const TextSpan(
                    text:
                    "Si tienes problemas para unirte a la clase, revisa la ayuda ",
                  ),
                  TextSpan(
                    text: "Centro de ayuda",
                    style: const TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer:
                    TapGestureRecognizer()
                      ..onTap = () {
                        // Your function here
                        // print("Centro de ayuda tapped!");
                      },
                  ),
                ],
              ),
            ),
          ],
        ),
      )
          : Center(
        child: Column(
          children: [
            Text("Usuario no autenticado, vuelve a iniciar sesión"),
          ],
        ),
      ),
    );
  }
}
