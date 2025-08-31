import 'package:flutter/material.dart';

class GoogleAccountModalExample extends StatelessWidget {
  const GoogleAccountModalExample({super.key});

  void showAccountModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Colors.white,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Cuenta Principal
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://example.com/tu_foto.jpg', // Aquí pones la URL de tu foto
                    ),
                    radius: 20,
                  ),
                  title: Text(
                    'José Luis Guaman',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('jluisgg2002@gmail.com'),
                ),
                SizedBox(height: 10),
                // Botón Administrar tu cuenta
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[200],
                    foregroundColor: Colors.black,
                    minimumSize: Size(double.infinity, 40),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text('Administrar tu Cuenta de Google'),
                ),
                Divider(height: 30),
                // Cuentas secundarias
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.orange,
                    child: Text('A', style: TextStyle(color: Colors.white)),
                  ),
                  title: Text('AreaScript'),
                  subtitle: Text('areascript22@gmail.com'),
                  onTap: () {},
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.pink,
                    child: Text('T', style: TextStyle(color: Colors.white)),
                  ),
                  title: Text('taxigo'),
                  subtitle: Text('taxigo11032025@gmail.com'),
                  onTap: () {},
                ),
                Divider(height: 30),
                // Agregar otra cuenta
                ListTile(
                  leading: Icon(Icons.add),
                  title: Text('Agregar otra cuenta'),
                  onTap: () {},
                ),
                // Administrar cuentas
                ListTile(
                  leading: Icon(Icons.manage_accounts),
                  title: Text('Administrar cuentas'),
                  onTap: () {},
                ),
                Divider(height: 30),
                // Política y condiciones
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Política de Privacidad',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    Text(
                      '•',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Condiciones del Servicio',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Google Account Modal')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => showAccountModal(context),
          child: Text('Mostrar Ventana de Cuentas'),
        ),
      ),
    );
  }
}
