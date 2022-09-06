import 'package:flutter/material.dart';

import '../model/draggable_list_items.dart';

class GenerateRowList extends StatelessWidget {
  final List<DraggableListItems> items;

  const GenerateRowList({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5.0, right: 5.0, bottom: 25.0),
          child: Wrap(
            spacing: 5.0,
            children: List.generate(
              items.length,
              (index) {
                return Draggable<String>(
                  data: items[index].item,
                  feedback: Opacity(
                    opacity: 0.4,
                    child: Text(items[index].item),
                  ),
                  child: FilterChip(
                    label: Text(items[index].item),
                    onSelected: (val) {},
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
