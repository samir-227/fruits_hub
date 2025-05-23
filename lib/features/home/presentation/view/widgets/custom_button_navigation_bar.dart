import 'package:flutter/material.dart';
import 'package:fruits_hub/features/home/domain/entities/navigation_bar_entity.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/navigation_bar_item.dart';

class CustomButtonNavigationBar extends StatefulWidget {
  const CustomButtonNavigationBar({super.key, required this.onItemTapped});
  final ValueChanged<int> onItemTapped;
  @override
  State<CustomButtonNavigationBar> createState() =>
      _CustomButtonNavigationBarState();
}

class _CustomButtonNavigationBarState extends State<CustomButtonNavigationBar> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      width: 375,
      height: 70,
      decoration: ShapeDecoration(
        color: colors.surface,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        shadows: [
          BoxShadow(
            color: colors.onSurfaceVariant,
            blurRadius: 1,
            offset: const Offset(0, -.2),
            spreadRadius: .5,
          ),
        ],
      ),
      child: Row(
        children: BottomNavigationBarEntity.getBottomNavigationBarItems(context)
            .asMap()
            .entries
            .map((e) {
          final key = e.key;
          final value = e.value;
          return Expanded(
            flex: selectedIndex == key ? 3 : 2,
            child: GestureDetector(
              onTap: () => setState(() {
                selectedIndex = key;
                widget.onItemTapped(key);
              }),
              child: NavigationBarItem(
                bottomNavigationBarEntity: value,
                isActive: key == selectedIndex,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
