import 'package:flutter/material.dart';
import 'package:second_note_app/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onsaved, this.isloading = false});
  final void Function()? onsaved;
  final bool isloading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: kcolor),
      onPressed: onsaved,
      child: isloading
          ? SizedBox(
            height:24 ,
            width: 24,
            child: CircularProgressIndicator(color: Colors.black))
          : Text('Save', style: TextStyle(color: Colors.black)),
    );
  }
}
