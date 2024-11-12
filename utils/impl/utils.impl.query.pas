unit utils.impl.query;

interface

uses
  System.Generics.Collections,
  System.SysUtils,
  System.Rtti,
  System.TypInfo,

  utils.interfaces;

type
  TQuery = class(TInterfacedObject, iQuery)
  private
    FParent: TObject;

    constructor Create(Parent: IInterface);

    function Fields: String;
    function Params: String;
    function Where: String;
    function TableName: String;
    function FieldParamsUpdate: String;
  public
    class function New(Parent: IInterface): iQuery;
    procedure FieldParameter(var Value: TDictionary<String, Variant>);
    function SelectWithWhere(Value: Boolean): string;
    function Delete: String;
    function Update: String;
    function Insert: String;
  end;

implementation

uses
  utils.impl.rtthelper,
  utils.impl.atributos;

constructor TQuery.Create(Parent: IInterface);
begin
  FParent := TObject(Parent);
end;

function TQuery.Delete: String;
begin
  Result := 'DELETE FROM ' + TableName + ' WHERE ' + Where;
end;

procedure TQuery.FieldParameter(var Value: TDictionary<String, Variant>);
var
  lContexto: TRttiContext;
  lTipo: TRttiType;
begin
  lContexto := TRttiContext.Create;
  try
    lTipo := lContexto.GetType(FParent.ClassInfo);

    for var I in lTipo.GetFields do
    begin
      if not I.Tem<Campo> then
        Break;

      case I.GetValue(FParent).TypeInfo.Kind of
        tkInteger, tkInt64: begin
          if not (I.GetValue(FParent).AsInteger <= 0) then
            Value.Add(I.GetAttribute<Campo>.Name,I.GetValue(FParent).AsInteger);
        end;
        tkFloat: begin
          if I.GetValue(FParent).TypeInfo = TypeInfo(TDateTime) then
            Value.Add(I.GetAttribute<Campo>.Name, StrToDateTime(I.GetValue(FParent).ToString));

          if I.GetValue(FParent).TypeInfo = TypeInfo(Currency) then
            Value.Add(I.GetAttribute<Campo>.Name, I.GetValue(FParent).AsCurrency);
        end;
        tkLString,
        tkWString,
        tkUString,
        tkString: begin
          if not I.GetValue(FParent).AsString.IsEmpty then
            Value.Add(I.GetAttribute<Campo>.Name, I.GetValue(FParent).AsString);
        end;
        else
          Value.Add(I.GetAttribute<Campo>.Name, I.GetValue(FParent).AsString);
      end;
    end;
  finally
    lContexto.Free;
  end;
end;

function TQuery.FieldParamsUpdate: String;
var
  lContexto: TRttiContext;
  lTipo: TRttiType;
begin
  Result := '';

  lContexto := TRttiContext.Create;
  try
    lTipo := lContexto.GetType(FParent.ClassInfo);

    for var I in lTipo.GetFields do
    begin
      if not I.Tem<Campo> then
        Break;

      case I.GetValue(FParent).TypeInfo.Kind of
        tkInteger, tkInt64: begin
          if not (I.GetValue(FParent).AsInteger <= 0) then
            Result := Result + I.GetAttribute<Campo>.Name + ' = :' + I.GetAttribute<Campo>.Name + ', ';
        end;
        tkFloat: begin
          if I.GetValue(FParent).TypeInfo = TypeInfo(TDateTime) then
              Result := Result + I.GetAttribute<Campo>.Name + ' = :' + I.GetAttribute<Campo>.Name + ', ';

          if I.GetValue(FParent).TypeInfo = TypeInfo(Currency) then
            Result := Result + I.GetAttribute<Campo>.Name + ' = :' + I.GetAttribute<Campo>.Name + ', ';
        end;
        tkLString,
        tkWString,
        tkUString,
        tkString: begin
          if not I.GetValue(FParent).AsString.IsEmpty then
            Result := Result + I.GetAttribute<Campo>.Name + ' = :' + I.GetAttribute<Campo>.Name + ', ';
        end;
        else
          Result := Result + I.GetAttribute<Campo>.Name + ' = :' + I.GetAttribute<Campo>.Name + ', ';
      end;
    end;
  finally
    Result := Copy(Result, 0, Length(Result) - 2) + ' ';
    lContexto.Free;
  end;
end;

function TQuery.Fields: String;
var
  lContexto: TRttiContext;
  lTipo: TRttiType;
begin
  lContexto := TRttiContext.Create;
  try
    lTipo := lContexto.GetType(FParent.ClassInfo);

    for var I in lTipo.GetFields do
    begin
      if not I.Tem<Campo> then
        Break;

      case I.GetValue(FParent).TypeInfo.Kind of
        tkInteger, tkInt64: begin
          if not (I.GetValue(FParent).AsInteger <= 0) then
            Result := Result + I.GetAttribute<Campo>.Name + ', ';
        end;
        tkFloat: begin
          if I.GetValue(FParent).TypeInfo = TypeInfo(TDateTime) then
              Result := Result + I.GetAttribute<Campo>.Name + ', ';

          if I.GetValue(FParent).TypeInfo = TypeInfo(Currency) then
            Result := Result + I.GetAttribute<Campo>.Name + ', ';
        end;
        tkLString,
        tkWString,
        tkUString,
        tkString: begin
          if not I.GetValue(FParent).AsString.IsEmpty then
            Result := Result + I.GetAttribute<Campo>.Name + ', ';
        end;
        else
          Result := Result + I.GetAttribute<Campo>.Name + ', ';
      end;
    end;
  finally
    Result := Copy(Result, 0, Result.Length-2);
    lContexto.Free;
  end;
end;

function TQuery.Insert: String;
begin
  Result := 'INSERT INTO ' + TableName;
  Result := Result + '('+ Fields + ') ';
  Result := Result + ' VALUES (' + Params + ');';
end;

class function TQuery.New(Parent: IInterface): iQuery;
begin
  Result := Self.Create(Parent);
end;

function TQuery.Params: String;
var
  ctxRtti   : TRttiContext;
  typRtti   : TRttiType;
  lField: TRttiField;
begin
  ctxRtti := TRttiContext.Create;
  try
    typRtti := ctxRtti.GetType(FParent.ClassInfo);
    for var I in typRtti.GetFields do
    begin
      if not I.Tem<Campo> then
        Break;

      case I.GetValue(FParent).TypeInfo.Kind of
        tkInteger, tkInt64: begin
          if not (I.GetValue(FParent).AsInteger <= 0) then
            Result  := Result + ':' + I.GetAttribute<Campo>.Name + ', ';
        end;
        tkFloat: begin
          if I.GetValue(FParent).TypeInfo = TypeInfo(TDateTime) then
              Result  := Result + ':' + I.GetAttribute<Campo>.Name + ', ';

          if I.GetValue(FParent).TypeInfo = TypeInfo(Currency) then
            Result  := Result + ':' + I.GetAttribute<Campo>.Name + ', ';
        end;
        tkLString,
        tkWString,
        tkUString,
        tkString: begin
          if not I.GetValue(FParent).AsString.IsEmpty then
            Result  := Result + ':' + I.GetAttribute<Campo>.Name + ', ';
        end;
        else
          Result  := Result + ':' + I.GetAttribute<Campo>.Name + ', ';
      end;
    end;
  finally
    Result := Copy(Result, 0, Length(Result) - 2) + ' ';
    ctxRtti.Free;
  end;
end;

function TQuery.SelectWithWhere(Value: Boolean): String;
begin
  Result := 'SELECT * FROM ' + TableName;
  if not Value then
    Exit;

  Result := Result + ' WHERE ' + Where;
end;

function TQuery.TableName: String;
var
  vCtxRtti: TRttiContext;
  vTypRtti: TRttiType;
begin
  vCtxRtti := TRttiContext.Create;
  try
    vTypRtti := vCtxRtti.GetType(FParent.ClassInfo);
    if vTypRtti.Tem<Tabela> then
      Result := vTypRtti.GetAttribute<Tabela>.Name;
  finally
    vCtxRtti.Free;
  end;
end;

function TQuery.Update: String;
begin
  Result := 'UPDATE ' + TableName;
  Result := Result + ' SET ' + FieldParamsUpdate;
  Result := Result + '  WHERE ' + Where;
end;

function TQuery.Where: String;
var
  lCtxRtti: TRttiContext;
  lTipo: TRttiType;
begin
  Result := '';

  lCtxRtti := TRttiContext.Create;
  try
    lTipo := lCtxRtti.GetType(FParent.ClassInfo);

    for var I in lTipo.GetFields do
    begin
      if not I.Tem<PK> then
        Continue;

      Result := Result + I.GetAttribute<Campo>.Name + ' = :' + I.GetAttribute<Campo>.Name + ' AND ';
    end;
  finally
    Result := Copy(Result, 0, Length(Result) - 4) + ' ';
    lCtxRtti.Free;
  end;
end;

end.
