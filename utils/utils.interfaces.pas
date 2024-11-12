unit utils.interfaces;

interface

uses
  System.Generics.Collections;

type
  iQuery = interface;

  iUtils = interface
    function Query: iQuery;
  end;

  iQuery = interface
    procedure FieldParameter(var Value: TDictionary<String, Variant>); 
    function SelectWithWhere(Value: Boolean): String;
    function Delete: String;
    function Update: String;
    function Insert: String;
  end;

implementation

end.
