import 'package:flutter/material.dart';
import 'package:cnpj_cpf_formatter/cnpj_cpf_formatter.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'CPF',
                helperText: 'just CPF formatting',
              ),
              inputFormatters: [
                CnpjCpfFormatter(
                  eDocumentType: EDocumentType.CPF,
                )
              ],
            ),
            SizedBox(
              height: 16,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'CNPJ',
                helperText: 'just CNPJ formatting',
              ),
              inputFormatters: [
                CnpjCpfFormatter(
                  eDocumentType: EDocumentType.CNPJ,
                )
              ],
            ),
            SizedBox(
              height: 16,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'CNPJ/CPF',
                helperText: 'CNPJ and CPF formatting',
              ),
              inputFormatters: [
                CnpjCpfFormatter(
                  eDocumentType: EDocumentType.BOTH,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
