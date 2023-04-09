import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:surf_flutter_study_jam_2023/assets/colors/theme_colors.dart';
import 'package:surf_flutter_study_jam_2023/assets/srtings/icons_paths.dart';
import 'package:surf_flutter_study_jam_2023/config/animations.dart';
import 'package:surf_flutter_study_jam_2023/features/common/widgets/scale_on_create.dart';
import 'package:surf_flutter_study_jam_2023/utils/uri_util.dart';

class AddTicketDialog extends StatefulWidget {
  const AddTicketDialog({
    Key? key,
  }) : super(key: key);

  @override
  State<AddTicketDialog> createState() => _AddTicketDialogState();
}

class _AddTicketDialogState extends State<AddTicketDialog> {
  final textController = TextEditingController();
  bool showErase = false;
  bool isValidUrl = false;

  @override
  void initState() {
    super.initState();
    textController.addListener(() {
      if (textController.text.isNotEmpty && !showErase) {
        setState(() {
          showErase = true;
        });
      }
      if (textController.text.isEmpty && showErase) {
        setState(() {
          showErase = false;
        });
      }
    });
  }

  void valid() {
    final url = textController.text;
    setState(() {
      isValidUrl = UriUtil.isValidPdfUri(url);
    });
  }

  void add() {}

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Center(
        child: Material(
          color: Colors.transparent,
          child: ScaleOnCreate(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * .75,
              child: AlertDialog(
                title: const Text(
                  "Добавьте билет",
                  textAlign: TextAlign.center,
                ),
                actionsAlignment: MainAxisAlignment.center,
                contentPadding: const EdgeInsets.all(8.0),
                titlePadding: const EdgeInsets.all(16.0),
                actionsPadding: EdgeInsets.zero,
                insetPadding: EdgeInsets.zero,
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: textController,
                      style: Theme.of(context).textTheme.bodyMedium!,
                      onSubmitted: (_) => add(),
                      onChanged: (_) => valid(),
                      maxLines: 3,
                      decoration: InputDecoration(
                        counterText: '',
                        labelText: 'Введите url',
                        suffixIcon: AnimatedSize(
                          duration: Animations.mediumSpeed,
                          curve: Animations.curve,
                          child: showErase
                              ? GestureDetector(
                                  onTap: () => textController.clear(),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 12.0,
                                      horizontal: 6.0,
                                    ),
                                    child: SvgPicture.asset(
                                      IconPaths.crossCircle,
                                      colorFilter: const ColorFilter.mode(
                                        dividerColor,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                  ),
                                )
                              : const SizedBox(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    AnimatedSize(
                      duration: Animations.mediumSpeed,
                      curve: Animations.curve,
                      child: !isValidUrl
                          ? Text(
                              'Неверная ссылка',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: Colors.red),
                            )
                          : const SizedBox(),
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text("Отмена".toUpperCase()),
                  ),
                  TextButton(
                    onPressed: isValidUrl ? valid : null,
                    child: Text("Добавить".toUpperCase()),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
