class DatabaseConfig {
  static const ticketDatabaseName = 'tickets';
  static const createSQLQuery = '''CREATE TABLE ${ticketDatabaseName} (
          url TEXT PRIMARY KEY,
          downloadingStatus TEXT,
          totalSize INTEGER,
          downloadedSize INTEGER,
          savedFileFullPath TEXT
          )
          ''';
}
