import 'package:elementary/elementary.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/domian/entities/ticket.dart';

class TicketStorageModel extends ElementaryModel {
  final List<Ticket> _ticketList = [];

  List<Ticket> get ticketList => _ticketList;

  //? Returns [false] if ticket already in ticketList, if success added -> return true
  bool addTicket(String url) {
    if (_ticketList.map((ticket) => ticket.url).contains(url)) {
      return false;
    }
    _ticketList.add(Ticket(url: url));
    return true;
  }
}
