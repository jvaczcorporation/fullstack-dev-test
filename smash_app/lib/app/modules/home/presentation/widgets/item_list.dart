import 'package:flutter/material.dart';

class ItemList extends StatelessWidget {
  final GestureTapCallback? onTap;
  final String description;

  const ItemList({
    super.key,
    required this.description,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: onTap,
          child: SizedBox(
            height: 40,
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                    ),
                    child: Text(description),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 10.0,
                  ),
                  child: Visibility(
                    visible: onTap != null,
                    child: const Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.black54,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        const Divider(),
      ],
    );
  }
}
