class AddedTicketError {
  final String message;
  AddedTicketError({
    required String tikcetName,
  }) : message = 'Билет "$tikcetName" уже добавлен';
}
