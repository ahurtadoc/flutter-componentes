import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  const ListaPage({Key? key}) : super(key: key);

  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  List<int> _listaNumeros = [];
  int _ultimoItem = 0;
  bool _isLoading = false;
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    _agregar10();
    _scrollController.addListener(() {
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        // _agregar10();
        fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Listas'),
        ),
        body: Stack(children: [
          _crearLista(),
          _crearLoading(),
        ]),
    );
  }

  Widget _crearLista() {
    return RefreshIndicator(
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _listaNumeros.length,
        itemBuilder: (BuildContext context, int index) {
          final imagen = _listaNumeros[index];
        return FadeInImage(
          placeholder: AssetImage('assets/jar-loading.gif'),
          image: NetworkImage('https://picsum.photos/id/$imagen/500/300'),
          fadeInDuration: Duration(milliseconds: 200),
          // height: 300,
          // fit: BoxFit.cover,
        );
      },
      ),
      onRefresh: _obtenerPagina1,
    );
  }

  Future _obtenerPagina1() async{
      final duration = Duration(seconds: 2);
      Timer(duration, (){
        _listaNumeros.clear();
        _ultimoItem ++;
        _agregar10();
      });
      return Future.delayed(duration);
  }

  void _agregar10 () {
    for (var i = 1; i<10; i++) {
      _ultimoItem ++;
      _listaNumeros.add(_ultimoItem);
    }
    setState(() {
    });
  }

  Future fetchData() async{
    setState(() {
      _isLoading = true;
    });
    return Timer(Duration(seconds: 2), respuestaHttp);
  }

  void respuestaHttp() {
    _isLoading = false;
    _scrollController.animateTo(_scrollController.position.pixels + 100,
        duration: Duration(milliseconds: 250),
        curve: Curves.fastOutSlowIn);

    _agregar10();
  }

  Widget _crearLoading() {
    if(_isLoading){
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
            ],
          ),
          SizedBox(height: 15.0)
        ],
      );
    }else{
      return Container();
    }

  }
}
