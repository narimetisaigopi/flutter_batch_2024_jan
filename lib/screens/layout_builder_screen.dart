import 'package:flutter/material.dart';

class LayoutBuilderScreen extends StatefulWidget {
  const LayoutBuilderScreen({super.key});

  @override
  State<LayoutBuilderScreen> createState() => _LayoutBuilderScreenState();
}

class _LayoutBuilderScreenState extends State<LayoutBuilderScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: LayoutBuilder(builder: (ctx, boxContraints) {
        return Container(
          color: Colors.green,
          width: 200,
          height: 500,
          child: Text('''
Media Query Width: ${size.width}\n
Media Query Height: ${size.height}\n
          maxwidth: ${boxContraints.maxWidth}\n
          maxHeight: ${boxContraints.maxHeight}\n
          minWidth: ${boxContraints.minWidth}\n
          minHeight: ${boxContraints.minHeight}\n'''),
        );
      }),
    );
  }
}
