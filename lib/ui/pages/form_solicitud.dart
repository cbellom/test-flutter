import 'package:flutter/material.dart';
import 'package:injector/injector.dart';
import 'package:componente_prestamo/domain/blocs/channel_bloc.dart';
import 'package:componente_prestamo/ui/widgets/button.dart';
import 'package:componente_prestamo/ui/widgets/input.dart';


class FormValues {
  String? amount;
  String? salary;

  FormValues({this.amount, this.salary});

  Map<String, dynamic> toJson() {
    return {
      "amount": this.amount,
      "salary": this.salary,
    };
  }
}

class FormSolicitud extends StatefulWidget {
  FormSolicitud({Key? key}) : super(key: key);

  @override
  _FormSolicitudState createState() => _FormSolicitudState();
}

class _FormSolicitudState extends State<FormSolicitud> {
  bool enableSubmition = false;
  String? groupValue = '';
  final FormValues formValues = FormValues();
  final formKey = GlobalKey<FormState>();

  _minMaxValidator(double min, double? max) {
    return (String value) {
      if (value == null || value.isEmpty) {
        return "Este campo es obligatorio";
      }

      final number = num.tryParse(value);

      if (number == null) {
        return "Este campo tiene que ser un número";
      }

      if (number < min) {
        return "El valor mínimo debe ser $min";
      }

      if (max != null && number > max) {
        return "El valor máximo es $max";
      }
    };
  }

  _onSubmit() {
    if (!this.enableSubmition) {
      return;
    } else {
      formKey.currentState?.save();

      final injector = Injector.appInstance;
      var channel = injector.get<ChannelBloc>();
      channel.sendMessage(event: 'submitFormTasa', data: formValues.toJson());

      const snackBar = SnackBar(
        content: Text('Su solicitud de crédito ha sido enviada'),
        backgroundColor: Colors.green,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  Widget appBarTitle = new Text(
    'Crédito personal',
    style: TextStyle(
      fontFamily: 'Bariol',
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Color(0xff4A4A4A),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBarTitle,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Color(0xff4A4A4A),
          onPressed: () {
            print('HEllo');
          },
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 15.0),
            child: GestureDetector(
              onTap: () {},
              child: Icon(Icons.chat_outlined),
            ),
          )
        ],
        actionsIconTheme: IconThemeData(color: Color(0xff4A4A4A)),
        backgroundColor: Colors.white,
        shadowColor: Colors.grey,
        toolbarHeight: 74,
      ),
      body: Container(
        color: Color(0xffe5e5e5),
        padding: EdgeInsets.all(40),
        child: Form(
          onChanged: () {
            if (formKey.currentState!.validate()) {
              setState(() {
                this.enableSubmition = true;
              });
            } else {
              setState(() {
                this.enableSubmition = false;
              });
            }
          },
          key: formKey,
          child: ListView(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  child: Text(
                    'Mi solicitud de crédito',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Bariol',
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Necesitamos de dos informaciones para poder generar tu solicitud',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Bariol',
                ),
              ),
              const SizedBox(height: 20),
              InputCurrency(
                hintText: '¿Cuanto dinero necesitas?',
                validator: this._minMaxValidator(20000, 350000),
                onSaved: (value) {
                  formValues.amount = value;
                },
              ),
              const SizedBox(height: 20),
              InputCurrency(
                hintText: 'Ingreso Mensual',
                validator: this._minMaxValidator(7000, null),
                onSaved: (value) {
                  formValues.salary = value;
                },
              ),
              const SizedBox(height: 20),
              Text(
                '¿Quieres que te enviemos novedades de tu solicitud por Whatsapp?',
                style: TextStyle(
                  fontFamily: 'Bariol',
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: <Widget>[
                  Radio(
                    activeColor: Colors.cyanAccent[400],
                    value: "Si",
                    groupValue: groupValue,
                    onChanged: (String? value) {
                      setState(() {
                        this.groupValue = value;
                      });
                    },
                  ),
                  Text(
                    "Si",
                    style: TextStyle(color: Colors.black),
                  ),
                  const SizedBox(width: 35),
                  Radio(
                    activeColor: Colors.cyanAccent[400],
                    value: "No",
                    groupValue: groupValue,
                    onChanged: (String? value) {
                      setState(() {
                        this.groupValue = value;
                      });
                    },
                  ),
                  Text(
                    "No",
                    style: TextStyle(color: Colors.black),
                  )
                ],
              ),
              const SizedBox(height: 35),
              CustomButton(
                inputText: "Enviar Solicitud",
                disabled: !this.enableSubmition,
                onPress: this._onSubmit,
              )
            ],
          ),
        ),
      ),
    );
  }
}
