import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  final ValueChanged<String>? onChanged;

  const SearchBar({
    super.key,
    required this.onChanged,
  });

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 30,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black54,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(999),
        ),
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(
                left: 12.0,
                right: 10,
              ),
              child: Text(
                "Busca: ",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 12.0,
                ),
                child: TextFormField(
                  onChanged: widget.onChanged,
                  cursorColor: Colors.grey,
                  decoration: const InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
