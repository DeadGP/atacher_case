// ignore_for_file: unused_field

import 'dart:html';

import 'package:animate_do/animate_do.dart';
import 'package:attache_case/src/pages/pdf.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Index extends StatefulWidget {
  const Index({Key? key}) : super(key: key);

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade600,
        elevation: 25.0,
        actions: <Widget>[
          TextButton(
              onPressed: () {},
              child: Text(
                'Acerca de',
                style: GoogleFonts.andada(
                    textStyle: Theme.of(context).textTheme.headline3,
                    fontSize: 25.0,
                    fontWeight: FontWeight.w800,
                    fontStyle: FontStyle.italic),
              )),
          const SizedBox(
            width: 5.0,
          ),
          TextButton(
              onPressed: () {},
              child: Text(
                'Proyectos',
                style: GoogleFonts.andada(
                    textStyle: Theme.of(context).textTheme.headline3,
                    fontSize: 25.0,
                    fontWeight: FontWeight.w800,
                    fontStyle: FontStyle.italic),
              )),
          const SizedBox(
            width: 5.0,
          ),
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) =>
                            PDFCV(context: _scaffoldKey.currentContext)));
              },
              child: Text(
                'Ver CV',
                style: GoogleFonts.andada(
                    textStyle: Theme.of(context).textTheme.headline3,
                    fontSize: 25.0,
                    fontWeight: FontWeight.w800,
                    fontStyle: FontStyle.italic),
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _title(),
            const SizedBox(
              height: 5.0,
            ),
            _acerca(),
            const SizedBox(
              height: 25.0,
            ),
            _info(),
            const SizedBox(
              height: 25.0,
            ),
            _projects(),
          ],
        ),
      ),
      key: _scaffoldKey,
    );
  }

  Widget _title() {
    return Center(
        child: Text(
      'full stack Developer JR',
      style: GoogleFonts.abel(
          textStyle: Theme.of(context).textTheme.headline3,
          fontSize: 35.0,
          fontWeight: FontWeight.w800,
          fontStyle: FontStyle.italic),
    ));
  }

  Widget _acerca() {
    return Text(
      '''Soy un desarrollador full stack, utilizando tecnologías como Node.JS (Express.JS), con experiencía en base de datos MySql, MariaDB, PostgreSql, SqlServer.
      Lenguajes de programación como Dart (Framework Flutter), desarrollando aplicaciones móviles para Android, páginas Web.
      Estudié en la Universidad de Colima, Facultad de Ingeniería Mecánica y Eléctrica, obteniendo el título de Ingenierío en Sistemas Computaciones.
      ''',
      style: GoogleFonts.abel(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.normal),
    );
  }

  Widget _info() {
    return Text('Da clic en la imagen para ver la información',
        style: GoogleFonts.abel(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal));
  }

  downloadFile(url) {
    AnchorElement anchorElement = AnchorElement(href: url);
    anchorElement.download = "CV";
    anchorElement.click();
  }

  Widget _projects() {
    return Column(
      children: [
        Row(
          children: [
            FadeIn(
              delay: const Duration(milliseconds: 5),
              child: SizedBox(
                  width: 200.0,
                  height: 400.0,
                  child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      elevation: 15.0,
                      color: const Color.fromARGB(255, 63, 9, 212),
                      child: InkWell(
                          onTap: () async {
                            Alert(
                                context: context,
                                title: 'Profesiomap',
                                desc:
                                    '''Primer proyecto: aplicación móvil para android, desarrollada en Flutter, 
                                  para la red social académica Professiomap.''',
                                buttons: [
                                  DialogButton(
                                    color: Colors.transparent,
                                    child: Image.asset('assets/git.png'),
                                    onPressed: () {
                                      downloadFile(
                                          'https://github.com/DeadGP/Professiomap-frontEnd');
                                    },
                                    width: 50.0,
                                  ),
                                  DialogButton(
                                    child: const Text('Aceptar'),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    width: 120.0,
                                  )
                                ]).show();
                          },
                          splashColor: Colors.amber,
                          child: Ink.image(
                            image: const AssetImage('assets/login.jpg'),
                            fit: BoxFit.cover,
                          )))),
            ),
            FadeIn(
                child: SizedBox(
              width: 200.0,
              height: 400.0,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 15.0,
                color: const Color.fromARGB(255, 63, 9, 212),
                child: InkWell(
                  onTap: () async {
                    Alert(context: context).show();
                  },
                  splashColor: Colors.amber,
                  child: Ink.image(
                    image: const AssetImage('assets/back_end.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )),
          ],
        )
      ],
    );
  }
}
