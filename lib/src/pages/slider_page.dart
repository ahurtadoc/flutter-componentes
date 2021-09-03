import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({Key? key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 100.0;
  bool _bloquearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Slider'),
        ),
        body: Container(
          padding: EdgeInsets.only(top: 50.0),
          child: Column(
            children: <Widget>[
              _crearSlider(),
              _crearCheckbox(),
              _crearSwitch(),
              Expanded(
                  child: _crearImagen()
              ),
            ],
          ),
        ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de imagen',
      // divisions: 20,
      value: _valorSlider,
      min: 10.0,
      max: 400.0,
      onChanged: (_bloquearCheck) ? null : (valor){
        setState(() {
          _valorSlider = valor;
        });
      },
    );
  }

  Widget _crearCheckbox() {
    return CheckboxListTile(
      title: Text('Bloquear Slide'),
      value: _bloquearCheck,
      onChanged: (valor) => setState((){
        _bloquearCheck = valor!;
      })
    );
  }

  Widget _crearSwitch() {
    return SwitchListTile(
        title: Text('Bloquear Slide'),
        value: _bloquearCheck,
        onChanged: (valor) => setState((){
          _bloquearCheck = valor;
        })
    );
  }

  Widget _crearImagen() {
    return Image(
      image: NetworkImage('https://as.com/meristation/imagenes/2019/01/13/noticias/1547367178_327214_1547367386_noticia_normal.jpg'),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }


}
