unit utils.impl.rtthelper;

interface

uses
  System.Rtti;

type
  TRttiTypeHelper = class helper for TRttiType
    function Tem<T: TCustomAttribute>: Boolean;
    function GetAttibute<T: TCustomAttribute>: T;
  end;

  TRttiFieldHelper = class helper for TRttiField
    function Tem<T: TCustomAttribute>: Boolean;
    function GetAttibute<T: TCustomAttribute>: T;
  end;

implementation

{ TRttiTypeHelper }

function TRttiTypeHelper.GetAttibute<T>: T;
var
  lAtributo: TCustomAttribute;
begin
  Result := nil;
  for lAtributo in GetAttributes do
    if lAtributo is T then
      Exit((lAtributo as T));
end;

function TRttiTypeHelper.Tem<T>: Boolean;
begin
  Result := GetAttibute<T> <> nil;
end;

{ TRttiFieldHelper }

function TRttiFieldHelper.GetAttibute<T>: T;
var
  lAtributo: TCustomAttribute;
begin
  Result := nil;
  for lAtributo in GetAttributes do
    if lAtributo is T then
      Exit((lAtributo as T));
end;

function TRttiFieldHelper.Tem<T>: Boolean;
begin
  Result := GetAttibute<T> <> nil;
end;

end.
