PROGRAM Greeting(INPUT, OUTPUT);
USES DOS;
VAR
  QueryString, Name: STRING;
  PosName: INTEGER;
BEGIN {Greeting}
  WRITELN('Content-Type: text/plain');
  WRITELN;
  
  {Получаем значение QUERY_STRING}
  QueryString := GetEnv('QUERY_STRING');
  
  {Ищем параметр name}
  PosName := Pos('name=', QueryString);
  
  {Если параметр name найден}
  IF PosName = 1 THEN
  BEGIN
    {Извлекаем значение параметра name}
    Name := Copy(QueryString, 6, Length(QueryString) - 5); {6, так как 'name=' занимает 5 символов}
    {Обрезаем всё после имени, если есть другие параметры (например, &)}
    IF Pos('&', Name) > 0 THEN
      Name := Copy(Name, 1, Pos('&', Name) - 1);
    WRITELN('Hello, dear ', Name, '!');
  END
  ELSE
    WRITELN('Hello, Anonymous!');
END. {Greeting}