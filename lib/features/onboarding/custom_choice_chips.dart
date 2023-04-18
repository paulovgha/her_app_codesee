import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

const double _kChoiceChipsHeight = 40.0;

// Creates a list of ChipData, each of which contains a
// label and an icon. The list is displayed by a GridView.

class ChipData {
  const ChipData(this.label, [this.iconData]);
  final String label;
  final IconData? iconData;
}

// Creates a ChipStyle from the specified values. [labelPadding] is optional.

class ChipStyle {
  const ChipStyle({
    required this.backgroundColor,
    required this.textStyle,
    required this.iconColor,
    required this.iconSize,
    this.labelPadding,
    required this.elevation,
  });
  final Color backgroundColor;
  final TextStyle textStyle;
  final Color iconColor;
  final double iconSize;
  final EdgeInsetsGeometry? labelPadding;
  final double elevation;
}

class CustomChoiceChips extends StatefulWidget {
  const CustomChoiceChips({
    super.key,
    required this.options,
    required this.onChanged,
    required this.controller,
    required this.selectedChipStyle,
    required this.unselectedChipStyle,
    required this.chipSpacing,
    this.rowSpacing = 0.0,
    required this.multiselect,
    this.initialized = true,
    this.alignment = WrapAlignment.start,
  });

  // List of data to be displayed as chips
  final List<ChipData> options;

  // Callback function for when the user selects a chip
  final void Function(List<String>?)? onChanged;

  // Controller for the form field
  final FormFieldController<List<String>> controller;

  // Style for the selected chip
  final ChipStyle selectedChipStyle;

  // Style for the unselected chip
  final ChipStyle unselectedChipStyle;

  // Spacing between each chip
  final double chipSpacing;

  // Spacing between each row of chips
  final double rowSpacing;

  // Whether the user can select multiple chips
  final bool multiselect;

  // Whether the form field is initialized with a value
  final bool initialized;

  // Alignment of the chips
  final WrapAlignment alignment;

  @override
  State<CustomChoiceChips> createState() => _CustomChoiceChipsState();
}

// A controller is required for the form field to interact with the rest of the form
// and the form field value will be the value of the form field
class FormFieldController<T> extends ValueNotifier<T?> {
  FormFieldController(this.initialValue) : super(initialValue);

  // The initial value of the form field
  final T? initialValue;

  // Reset the form field to its initial value
  void reset() => value = initialValue;
}

class _CustomChoiceChipsState extends State<CustomChoiceChips> {
  late List<String> choiceChipValues;
  ValueListenable<List<String>?> get changeSelectedValues => widget.controller;
  List<String> get selectedValues => widget.controller.value ?? [];

  @override
  void initState() {
    super.initState();

    // Populate the choice chip values with the initial values passed to the
    // controller.
    choiceChipValues = List.from(
      widget.controller.initialValue ?? [],
    );

    // If the choice chip values are not empty, and the form field has not
    // already been initialized, then call the onChanged callback.
    if (!widget.initialized && choiceChipValues.isNotEmpty) {
      SchedulerBinding.instance.addPostFrameCallback(
        (_) {
          if (widget.onChanged != null) {
            widget.onChanged!(choiceChipValues);
          }
        },
      );
    }

    // Register a listener on the changeSelectedValues stream. When the stream
    // is updated, set the state of the choice chip values to reflect the
    // changes. Then call the onChanged callback.
    changeSelectedValues.addListener(() {
      if (!listEquals(choiceChipValues, selectedValues)) {
        setState(() => choiceChipValues = List.from(selectedValues));
      }
      if (widget.onChanged != null) {
        widget.onChanged!(selectedValues);
      }
    });
  }

  @override
  void dispose() {
    // Remove the listener when the widget is disposed.
    changeSelectedValues.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Wrap(
        spacing: widget.chipSpacing,
        runSpacing: widget.rowSpacing,
        alignment: widget.alignment,
        children: [
          // Create a choice chip for each option in the widget's options list.
          ...widget.options.map(
            (option) {
              // Determine whether the chip is selected.
              final selected = choiceChipValues.contains(option.label);
              // Use the selected or unselected style, depending on the chip's state.
              final style = selected
                  ? widget.selectedChipStyle
                  : widget.unselectedChipStyle;

              return SizedBox(
                height: _kChoiceChipsHeight,
                child: ChoiceChip(
                  selected: selected,
                  // When the user taps on the chip, the onSelected callback is called.
                  // It will set the state of the Chip widget, which in turn will
                  // update the visual appearance of the widget
                  onSelected: widget.onChanged != null
                      ? (isSelected) {
                          // If the chip is being selected, it adds
                          // the label of the option to the List of labels
                          // stored in the state of the widget
                          if (isSelected) {
                            widget.multiselect
                                ? choiceChipValues.add(option.label)
                                : choiceChipValues = [option.label];
                            // The widget also updates the value of the
                            // controller passed to it
                            widget.controller.value =
                                List.from(choiceChipValues);
                            setState(() {});
                          } else {
                            // If the chip is being unselected, it removes
                            // the label of the option from the List of labels
                            // stored in the state of the widget
                            if (widget.multiselect) {
                              choiceChipValues.remove(option.label);
                              widget.controller.value =
                                  List.from(choiceChipValues);
                              setState(() {});
                            }
                          }
                        }
                      : null,
                  label: Text(
                    option.label,
                    style: style.textStyle,
                  ),
                  labelPadding: style.labelPadding,
                  avatar: option.iconData != null
                      ? Icon(
                          option.iconData,
                          size: style.iconSize,
                          color: style.iconColor,
                        )
                      : null,
                  elevation: style.elevation,
                  selectedColor: selected
                      ? widget.selectedChipStyle.backgroundColor
                      : null,
                  backgroundColor: selected
                      ? null
                      : widget.unselectedChipStyle.backgroundColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              );
            },
          ).toList(),
        ],
      );
}
