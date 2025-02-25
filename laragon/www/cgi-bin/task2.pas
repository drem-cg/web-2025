PROGRAM SarahRevere(INPUT, OUTPUT);
USES DOS;
VAR
  QueryString: STRING;
BEGIN {SarahRevere}
  WRITELN('Content-Type: text/plain');
  WRITELN;
  
  {Получаем значение QUERY_STRING}
  QueryString := GetEnv('QUERY_STRING');
  
  {Проверяем значение lanterns}
  IF Pos('lanterns=1', QueryString) > 0 THEN
    WRITELN('The British are coming by land.')
  ELSE IF Pos('lanterns=2', QueryString) > 0 THEN
    WRITELN('The British are coming by sea.')
  ELSE
    WRITELN('Sarah didn''t say.');
END. {SarahRevere}