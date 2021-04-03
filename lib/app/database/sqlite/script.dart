final createTable = '''
  CREATE TABLE annotations(
    id INTEGER NOT NULL PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    subtitulo VARCHAR(255),
    descricao LONGTEXT
  )
''';

final insert = '''
  INSERT INTO annotations(titulo, subtitulo, descricao)
  VALUES ('Lista de compras','Lembrar de comprar...','Arroz')
''';

final insert2 = '''
  INSERT INTO annotations(titulo, subtitulo, descricao)
  VALUES ('Lista de tarefas','Lembrar de estudar...','DDM')
''';
