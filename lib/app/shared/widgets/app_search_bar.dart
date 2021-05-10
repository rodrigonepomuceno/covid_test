import 'package:covid19/app/shared/themes/app_colors.dart';
import 'package:covid19/app/shared/utils/app_time_trigger.dart';
import 'package:flutter/material.dart';

class AppSearchBar extends StatefulWidget {
  final Function onSuffixTap;
  final Function onChanged;
  final Function onFinishWriting;
  final String hintText;

  const AppSearchBar({
    Key key,
    this.onSuffixTap,
    this.onChanged,
    this.onFinishWriting,
    this.hintText,
  }) : super(key: key);

  _AppSearchBarState createState() => _AppSearchBarState();
}

class _AppSearchBarState extends State<AppSearchBar> {
  var textController = TextEditingController();
  var textFocus = FocusNode();
  var timeTrigger = AppTimerTrigger();

  @override
  void initState() {
    super.initState();
    textFocus.addListener(() {
      setState(() {});
    });
    textController.addListener(() {
      setState(() {});
      if (widget.onFinishWriting != null) {
        timeTrigger.setTimer(
            milliseconds: 500, callBack: widget.onFinishWriting);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    textController.dispose();
    textFocus.dispose();
    timeTrigger.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      duration: Duration(milliseconds: 300),
      decoration: BoxDecoration(
        color: textFocus.hasFocus || textController.text.isNotEmpty
            ? AppColors.white
            : AppColors.gray,
        borderRadius: BorderRadius.all(Radius.circular(100)),
        border: Border.all(
          color: textFocus.hasFocus || textController.text.isNotEmpty
              ? AppColors.appBlue
              : Colors.transparent,
          width: 1,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: TextField(
          controller: textController,
          focusNode: textFocus,
          onChanged: widget.onChanged,
          decoration: InputDecoration(
              hintText: widget.hintText,
              border: InputBorder.none,
              isDense: true,
              suffixIcon: !textFocus.hasFocus && textController.text.isEmpty
                  ? Icon(
                      Icons.search,
                      color: Colors.black,
                      size: 23,
                    )
                  : textController.text.isEmpty
                      ? InkWell(
                          onTap: () {
                            textController.text = '';
                            widget.onSuffixTap();
                            textFocus.unfocus();
                          },
                          child: Icon(
                            Icons.close,
                            color: Colors.black,
                            size: 20,
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            textController.text = '';
                            widget.onSuffixTap();
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                            size: 25,
                          ),
                        ),
              suffixIconConstraints: BoxConstraints()),
        ),
      ),
    );
  }
}
