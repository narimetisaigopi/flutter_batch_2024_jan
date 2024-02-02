import 'package:flutter/material.dart';

class DrawerItemWidget extends StatelessWidget {
  final String title;
  final Function()? onTap;
  const DrawerItemWidget({super.key, this.title = "", this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton.icon(
            onPressed: onTap,
            icon: const Icon(
              Icons.logout,
              color: Colors.black,
            ),
            label: Text(title)),
        const Divider(),
      ],
    );
  }
}
