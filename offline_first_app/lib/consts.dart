const String DATABASE_NAME = 'offline_first.db';

const String CREATE_POKEMON_TABLE = '''

    create table pokemon (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT,
      url TEXT
    )

''';

