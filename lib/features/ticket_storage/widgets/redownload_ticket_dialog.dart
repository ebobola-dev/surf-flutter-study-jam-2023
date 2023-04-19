import 'package:flutter/material.dart';
import 'package:surf_flutter_study_jam_2023/features/common/widgets/scale_on_create.dart';

class RedownloadTicketDialog extends StatelessWidget {
  final String ticketName;
  const RedownloadTicketDialog({
    Key? key,
    required this.ticketName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleOnCreate(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * .75,
            child: AlertDialog(
              actionsAlignment: MainAxisAlignment.center,
              contentPadding: const EdgeInsets.all(12.0),
              titlePadding: const EdgeInsets.all(16.0),
              actionsPadding: EdgeInsets.zero,
              insetPadding: EdgeInsets.zero,
              content: Text(
                'Вы уверены что хотите скачать билет "$ticketName" заново?\nСохранённый файл билета будет удалён перед скачиванием',
                textAlign: TextAlign.center,
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Отмена".toUpperCase()),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(
                    context,
                    true,
                  ),
                  child: Text(
                    "Скачать заново".toUpperCase(),
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
