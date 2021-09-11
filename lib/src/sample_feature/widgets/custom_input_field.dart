import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class CustomInputField extends StatelessWidget {
  const CustomInputField({
    Key? key,
    required this.textEditingController,
    required this.onPressed,
  }) : super(key: key);

  final TextEditingController textEditingController;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      keyboardType: TextInputType.multiline,
      minLines: 1,
      maxLines: 4,
      maxLength: 280,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
      decoration: InputDecoration(
        hintText: 'How are you all doing?',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: const Color(0xffF6FF8D),
        suffixIcon: ClipOval(
          child: Material(
            color: Colors.white.withOpacity(0.0),
            child: IconButton(
              onPressed: onPressed,
              icon: const Icon(Icons.send),
            ),
          ),
        ),
      ),
    );
  }
}
