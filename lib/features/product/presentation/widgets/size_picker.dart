import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/app/extensions/utils_extension.dart';
import 'package:flutter/material.dart';

class SizePicker extends StatefulWidget {
  const SizePicker({super.key, required this.sizes, required this.onSelected, this.initialSize});
  final String?initialSize;
  final List<String> sizes;
  final Function(String) onSelected;

  @override
  State<SizePicker> createState() => _SizePickerState();
}

class _SizePickerState extends State<SizePicker> {
  String? _selectedColor;

  @override
  void initState() {
    super.initState();
    _selectedColor = widget.initialSize!;
  }
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 12,
      children: [
        Text('Size',style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),),
        SizedBox(
          height: 30,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.sizes.length,
              itemBuilder: (context,index){
                String color = widget.sizes[index];
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
