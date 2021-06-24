import 'package:flutter/material.dart';

class InputCurrency extends StatelessWidget {
  final String? hintText;
  final Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final String? errorText;
  final String? Function(String?)? validator;

  InputCurrency(
      {Key? key,
        this.hintText,
        this.onChanged,
        this.onSaved,
        this.errorText,
        this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: this.onChanged,
      onSaved: this.onSaved,
      validator: this.validator,
      decoration: InputDecoration(
        hintText: this.hintText,
        labelText: this.hintText,
        errorText: this.errorText,
        hintStyle: TextStyle(
          fontSize: 12,
          color: Colors.grey,
        ),
        border: OutlineInputBorder(
          borderSide: new BorderSide(color: Colors.teal, width: 0.1),
        ),
      ),
      keyboardType: TextInputType.number,
    );
  }
}
