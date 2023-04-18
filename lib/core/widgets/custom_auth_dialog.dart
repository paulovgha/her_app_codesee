import 'package:flutter/material.dart';

enum TypeRouter { pop, pushNamed, pushReplacementNamed }

Future<void> customAuthDialog(BuildContext context,
    {required String customMessage,
    required String customMessageButton,
    required String? customRoute,
    required TypeRouter customTypeRouter}) async {
  return await showDialog<void>(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      title: Text(
        textAlign: TextAlign.center,
        customMessage,
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
      actions: <Widget>[
        Center(
          child: TextButton(
            onPressed: () {
              switch (customTypeRouter) {
                case TypeRouter.pop:
                  Navigator.of(context).pop();
                  break;
                case TypeRouter.pushNamed:
                  Navigator.of(context).pushNamed(customRoute!);
                  break;
                case TypeRouter.pushReplacementNamed:
                  Navigator.of(context).pushReplacementNamed(customRoute!);
                  break;
              }
            },
            child: Text(
              customMessageButton,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )
      ],
    ),
  );
}
