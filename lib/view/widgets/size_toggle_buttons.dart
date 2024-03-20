import 'package:flutter/material.dart';

class SizeToggleButtons extends StatefulWidget {
  final List<int> sizes;
  final Function(int) onSelected;
  const SizeToggleButtons(
      {required this.sizes, required this.onSelected, super.key});

  @override
  State<SizeToggleButtons> createState() => _SizeToggleButtonsState();
}

class _SizeToggleButtonsState extends State<SizeToggleButtons> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    //for responsiveness I have compare the toggle buttons children with device size
    final deviceSize = MediaQuery.of(context).size;
    final iconSize = deviceSize.width * 0.04;
    final textSize = deviceSize.width * 0.03;
    final buttonWidth = deviceSize.width / 4.3;
    final buttonHeight = deviceSize.height / 17;

    return Align(
      alignment: Alignment.centerLeft,
      child: ToggleButtons(
        color: Colors.white.withOpacity(0.5),
        selectedColor: Colors.white,
        // fillColor: const Color.fromRGBO(59, 44, 38, 1),
        fillColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        focusColor: Colors.transparent,
        splashColor: Colors.transparent,

        isSelected: List.generate(
            widget.sizes.length, (index) => index == selectedIndex),
        onPressed: (index) {
          setState(() {
            selectedIndex = index;
          });
          widget.onSelected(widget.sizes[index]);
        },
        children: widget.sizes
            .map(
              (size) => Container(
                height: buttonHeight,
                width: buttonWidth,
                padding: const EdgeInsets.symmetric(horizontal: 5),
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(59, 44, 38, 1),
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    width: 1,
                    color: selectedIndex == widget.sizes.indexOf(size)
                        ? Colors.white
                        : Colors.transparent,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Icon(
                        Icons.coffee_outlined,
                        size: iconSize,
                      ),
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        ' $size ml',
                        style: TextStyle(fontSize: textSize),
                      ),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
