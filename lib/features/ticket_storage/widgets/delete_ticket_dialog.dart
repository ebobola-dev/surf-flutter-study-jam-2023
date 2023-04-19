import 'package:flutter/material.dart';
import 'package:surf_flutter_study_jam_2023/features/common/widgets/scale_on_create.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/domian/entities/ticket_deleting_options/ticket_deleting_options.dart';

class DeleteTicketDialog extends StatelessWidget {
  final String ticketName;
  final bool ticketDownloaded;
  const DeleteTicketDialog({
    Key? key,
    required this.ticketName,
    required this.ticketDownloaded,
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
              content: ticketDownloaded
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextButton(
                          onPressed: () => Navigator.pop(
                            context,
                            TicketDeletingOptions.deleteTicket,
                          ),
                          child: Text(
                            "Удалить билет",
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(
                            context,
                            TicketDeletingOptions.deleteTicketFile,
                          ),
                          child: Text(
                            "Удалить только файл билета",
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    )
                  : Text(
                      'Вы уверены что хотите удалить билет?',
                      textAlign: TextAlign.center,
                    ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Отмена".toUpperCase()),
                ),
                if (!ticketDownloaded)
                  TextButton(
                    onPressed: () => Navigator.pop(
                      context,
                      TicketDeletingOptions.deleteTicket,
                    ),
                    child: Text(
                      "Удалить".toUpperCase(),
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
