import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';

class IncDecButton extends StatefulWidget {
  const IncDecButton({
    super.key,
    required this.onChange,
    this.initialValue = 1,});
  final Function(int)? onChange;
  final int initialValue;

  @override
  State<IncDecButton> createState() => _IncDecButtonState();
}

class _IncDecButtonState extends State<IncDecButton> {
  int _counter = 1;

  @override
  void initState() {
    _counter = widget.initialValue!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.themeColor.withAlpha(80),
            borderRadius: BorderRadius.circular(5),
          ),
          child: InkWell(
            onTap: () {
              if (_counter > 1) {
                setState(() {
                  _counter--;
                });
                widget.onChange!(_counter);
              }
            },
            child: Icon(Icons.remove, color: Colors.white),
          ),
        ),
        SizedBox(width: 10),
        Text(_counter.toString(), style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(width: 10),
        Container(
          decoration: BoxDecoration(
            color: AppColors.themeColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: InkWell(
            onTap: () {
              setState(() {
                _counter++;
              });
              widget.onChange!(_counter);
            },
            child: Icon(Icons.add, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
