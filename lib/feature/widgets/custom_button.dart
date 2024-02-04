import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({required this.onTap, required this.label,super.key});

  final Future<void> Function() onTap;

  final String label;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {



  late bool _isLoading;

  @override
  void initState() {
    super.initState();
    _isLoading = false;
  }

  Future<void> _onTap() async{
    _toggleState();
    await widget.onTap();
    _toggleState();
  }

  void _toggleState() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _isLoading == false ? _onTap : null, 
      child: _isLoading == false ? 
      Text(widget.label) : 
      const CircularProgressIndicator.adaptive(),
      );
  }
}
