PROGRAM WorkWithQueryString(INPUT, OUTPUT);
USES
  DOS;
  
FUNCTION GetQueryStringParameter(Key: STRING): STRING;
VAR
  QueryString, Param: STRING;
  StartPos, EndPos: INTEGER;
BEGIN {GetQueryStringParameter}
  {Получаем значение QUERY_STRING}
  QueryString := GetEnv('QUERY_STRING');
  
  {Ищем начало параметра}
  StartPos := Pos(Key + '=', QueryString);
  
  {Если параметр найден}
  IF StartPos > 0 THEN
  BEGIN
    {Пропускаем имя параметра и знак '='}
    StartPos := StartPos + Length(Key) + 1;
    
    {Ищем конец значения параметра (до следующего & или конца строки)}
    EndPos := Pos('&', Copy(QueryString, StartPos, Length(QueryString) - StartPos + 1));
    
    {Если найден символ &, обрезаем строку до него}
    IF EndPos > 0 THEN
      Param := Copy(QueryString, StartPos, EndPos - 1)
    ELSE
      Param := Copy(QueryString, StartPos, Length(QueryString) - StartPos + 1);
  END
  ELSE
    Param := ''; {Если параметр не найден, возвращаем пустую строку}
  
  GetQueryStringParameter := Param;
END; {GetQueryStringParameter}

BEGIN {WorkWithQueryString}
  WRITELN('Content-Type: text/plain');
  WRITELN;
  WRITELN('First Name: ', GetQueryStringParameter('first_name'));
  WRITELN('Last Name: ', GetQueryStringParameter('last_name'));
  WRITELN('Age: ', GetQueryStringParameter('age'))
END. {WorkWithQueryString}