import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/laf_values.dart';

class SingleLineInputContent extends StatefulWidget {
  static const keyPrefix = 'SingleLineInput';

  final int? characterLimit;
  final ValueChanged<String> onChanged;
  final VoidCallback? onRemove;
  final ValueChanged<String> onSubmitted;
  final String? hintText;
  final String? labelText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? obscureText;
  final String? errorString;
  final bool? enabledField;
  final String? initialText;

  const SingleLineInputContent({
    Key? key,
    this.characterLimit,
    required this.onChanged,
    this.onRemove,
    required this.onSubmitted,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText,
    this.errorString,
    this.enabledField,
    this.initialText,
    // required this.validator
  }) : super(key: key);

  @override
  SingleLineInputContentState createState() => SingleLineInputContentState();
}

class SingleLineInputContentState extends State<SingleLineInputContent> {
  late TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController.fromValue(
      TextEditingValue(text: widget.initialText ?? ''),
    );
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TextFormField(
          key: const ValueKey('${SingleLineInputContent.keyPrefix}-TextField'),
          style: Theme.of(context).textTheme.bodyMedium,
          decoration: (() {
            if (widget.onRemove != null) {
              return InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {
                    widget.onRemove!();
                  },
                  icon: const Icon(Icons.delete_outline),
                ),
              );
            } else {
              return InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(LAFSizes.size4.r)),
                    borderSide: BorderSide(
                      color: Theme.of(context).disabledColor,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(LAFSizes.size4.r)),
                    borderSide: BorderSide(
                      color: Theme.of(context).disabledColor,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(LAFSizes.size4.r)),
                  ),
                  helperText: '',
                  helperMaxLines: 3,
                  errorBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.all(Radius.circular(LAFSizes.size4.r)),
                      borderSide: BorderSide(
                        color: Theme.of(context).errorColor,
                      )),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.all(Radius.circular(LAFSizes.size4.r)),
                      borderSide: BorderSide(
                        color: Theme.of(context).errorColor,
                      )),
                  errorMaxLines: 1,
                  isDense: false,
                  prefixIcon: widget.prefixIcon,
                  suffixIcon: widget.suffixIcon,
                  hintText: widget.hintText,
                  filled: true,
                  hintStyle: Theme.of(context).textTheme.headline4,
                  contentPadding: EdgeInsets.fromLTRB(LAFPaddings.paddings6.w,
                      0, LAFPaddings.paddings6.w, 0),
                  // labelText: widget.labelText,
                  errorText: widget.errorString,
                  labelStyle: Theme.of(context).textTheme.subtitle2);
            }
          }()),
          minLines: 1,
          maxLines: 1,
          obscureText: widget.obscureText ?? false,
          controller: textEditingController,
          onChanged: (value) {
            widget.onChanged(value);
          },
          maxLength: widget.characterLimit,
          maxLengthEnforcement: widget.characterLimit != null
              ? MaxLengthEnforcement.enforced
              : MaxLengthEnforcement.none,
          textInputAction: TextInputAction.next,
          onFieldSubmitted: widget.onSubmitted,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter text';
            } else {
              return null;
            }
          },
          enabled: widget.enabledField,
        ),
      ],
    );
  }
}
