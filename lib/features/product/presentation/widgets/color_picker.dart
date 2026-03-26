import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/app/extensions/utils_extension.dart';
import 'package:flutter/material.dart';

class ColorPicker extends StatefulWidget {
  const ColorPicker({super.key, required this.colors, required this.onSelected, this.initialColor});
  final String?initialColor;
  final List<String> colors;
  final Function(String) onSelected;

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  String? _selectedColor;

  @override
  void initState() {
    super.initState();
    _selectedColor = widget.initialColor!;
  }
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 12,
      children: [
        Text('Color',style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),),
        SizedBox(
          height: 30,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
           itemCount: widget.colors.length,
           itemBuilder: (context,index){
             String color = widget.colors[index];
              return GestureDetector(
                onTap: (){
                  _selectedColor = color;
                  widget.onSelected(color);
                  setState(() {});
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(right: 8),
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                    color: _selectedColor == color ? AppColors.themeColor : Colors.transparent,
                  ),
                  child: Text(color,style: TextStyle(color: _selectedColor == color ? Colors.white : Colors.black54),
                ),
                ));
             }
                 ),
        ),
      ],
    );
  }
}
