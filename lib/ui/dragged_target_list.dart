import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/drag_drop_bloc.dart';

class DraggedTargetList extends StatelessWidget {
  final DragDropState state;

  const DraggedTargetList({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DragTarget<String>(
      onAccept: (value) {
        if (!state.items.contains(value)) {
          context.read<DragDropBloc>().add(
                AddItemEvent(item: value),
              );
        }
      },
      builder: (_, candidateData, rejectedData) {
        return SingleChildScrollView(
          controller: ScrollController(),
          child: Wrap(
            children: List.generate(
              state.items.length,
              (index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 3.0, right: 3.0),
                  child: InputChip(
                    label: Text(state.items[index]),
                    onDeleted: () {
                      context.read<DragDropBloc>().add(
                            DeleteItemEvent(index: index),
                          );
                    },
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
