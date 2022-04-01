import 'package:flutter/material.dart';
import 'package:mobprog_perpusku/theme.dart';

class DashboardWidget extends StatefulWidget {
  final int index;
  final ValueChanged<int> onChangedTab;

  const DashboardWidget({
    Key? key,
    required this.index,
    required this.onChangedTab,
  }) : super(key: key);

  @override
  State<DashboardWidget> createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget> {
  @override
  Widget build(BuildContext context) {
    final placeholder = Opacity(
      opacity: 0,
      child: IconButton(
        onPressed: null,
        icon: Icon(Icons.no_cell),
      ),
    );

    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 8,
      color: blackColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildTabItem(
                  index: 0,
                  icon: Icon(
                    Icons.home,
                    color: whiteColor,
                    size: 30,
                  ),
                ),
                SizedBox(
                  width: 25,
                ),
                buildTabItem(
                  index: 1,
                  icon: Icon(
                    Icons.favorite,
                    color: whiteColor,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
          placeholder,
          Container(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // buildTabItem(
                //   index: 0,
                //   icon: Icon(
                //     Icons.home,
                //     color: whiteColor,
                //     size: 26,
                //   ),
                // ),
                // SizedBox(
                //   width: 25,
                // ),
                buildTabItem(
                  index: 2,
                  icon: Icon(
                    Icons.search,
                    color: whiteColor,
                    size: 30,
                  ),
                ),
                SizedBox(
                  width: 25,
                ),
                buildTabItem(
                  index: 3,
                  icon: Icon(
                    Icons.book,
                    color: whiteColor,
                    size: 30,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildTabItem({required int index, required Icon icon}) {
    final isSelected = index == widget.index;

    return IconTheme(
      data: IconThemeData(
        opacity: isSelected ? 1 : 0.4,
      ),
      child: IconButton(
        icon: icon,
        onPressed: () => widget.onChangedTab(index),
      ),
    );
  }
}
