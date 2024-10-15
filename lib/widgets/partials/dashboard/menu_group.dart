import 'package:flutter/material.dart';
import 'package:aify/utils/theme.dart';

class DashMenuGroup extends StatelessWidget {
  final String title;
  final String? actionName;
  final VoidCallback? action;
  final Widget child;

  const DashMenuGroup(
      {super.key,
      required this.title,
      required this.actionName,
      required this.action,
      required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 32),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              if (actionName != null)
                TextButton(
                  onPressed: action,
                  child: Row(children: [
                    Text(
                      actionName!,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(width: 8),
                    const Icon(Icons.arrow_forward,
                        color: AppTheme.textPrimaryColor)
                  ]),
                )
            ],
          ),
          const SizedBox(height: 8),
          child
        ],
      ),
    );
  }
}
