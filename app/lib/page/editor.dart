import 'package:app/utils.dart' as utils;
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

// Model
import 'package:app/model/event.dart';

// Data
import 'package:app/data/events.dart';

// Widget
import 'package:app/widget/outlined_icon_button.dart';

class EditorPage extends StatefulWidget {
  const EditorPage({super.key});

  @override
  State<EditorPage> createState() => _EditorPageState();
}

class _EditorPageState extends State<EditorPage> {
  late TextEditingController titleController;
  int selectedImageIndex = 0;
  DateTime date = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 1);

  void submit() {
    if (titleController.text != "" || titleController.text.isNotEmpty) {
      events.add(Event(
        title: titleController.text,
        imageIndex: selectedImageIndex,
        targetDate: date,
      ));
    }

    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();

    titleController = TextEditingController();
  }

  @override
  void dispose() {
    titleController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: utils.colorText,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: utils.bgGradient,
        ),
        child: Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(height: 32),
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [utils.boxShadow],
                    ),
                    child: TextField(
                      controller: titleController,
                      autofocus: true,
                      maxLength: 12,
                      style: utils.h3TextStyle,
                      cursorColor: utils.color10,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: utils.color30,
                        hintText: "Title",
                        hintStyle: utils.h3TextStyleAlt,
                        counterStyle: utils.h5TextStyleAlt,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(width: 0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(width: 0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(width: 0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    height: 256,
                    child: Container(
                      decoration: BoxDecoration(
                        color: utils.color30,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [utils.boxShadow],
                      ),
                      child: GridView.count(
                        padding: const EdgeInsets.all(32),
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        scrollDirection: Axis.horizontal,
                        crossAxisCount: 2,
                        children: [
                          for (int i = 0; i < 7; i++) Material(
                            color: selectedImageIndex == i ? utils.overlayGrey : Colors.transparent,
                            shape: const CircleBorder(),
                            child: Ink(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: InkWell(
                                overlayColor: MaterialStateProperty.all<Color>(utils.color10Alt),
                                customBorder: const CircleBorder(),
                                onTap: () {
                                  setState(() => selectedImageIndex = i);
                                },
                                child: Transform.scale(
                                  scale: .7,
                                  child: Image.asset("assets/images/$i.png"),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Container(
                    decoration: BoxDecoration(
                      color: utils.color30,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [utils.boxShadow],
                    ),
                    child: SfDateRangePicker(
                      selectionMode: DateRangePickerSelectionMode.single,
                      onSelectionChanged: (DateRangePickerSelectionChangedArgs args) => date = args.value,
                      initialSelectedDate: date,
                      enablePastDates: false,
                      showNavigationArrow: true,
                      todayHighlightColor: utils.color10,
                      selectionColor: utils.color10,
                      selectionTextStyle: utils.h4TextStyle,
                      headerStyle: DateRangePickerHeaderStyle(
                        textStyle: utils.h3TextStyleAlt,
                      ),
                      monthCellStyle: DateRangePickerMonthCellStyle(
                        textStyle: utils.h4TextStyleAlt,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Center(
                    child: OutlinedIconButton(
                      onPressed: () => submit(),
                      iconData: Icons.check,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}