import 'package:elementary/elementary.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/domian/entities/ticket.dart';

class TicketStorageModel extends ElementaryModel {
  final List<Ticket> _ticketList = [];

  List<Ticket> get ticketList => _ticketList;
}
