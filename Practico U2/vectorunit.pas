unit VectorUnit;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;
	const MAX_ELE=1200;
type

  { vector }

  vector = class
  private
	  dim : integer; //DIMENSION DEL VECTOR
    vectorElem : array [1..MAX_ELE] of integer; //TODO EL VECTOR //VECTOR ES SOLO DE ENTEROS
  public
	  constructor crear;
    function getDim():integer;
    function getElemPos(pos:integer):integer;
    procedure setVectorInsertarElem(vectorElem:integer);//pone un elemento en la ultima posicion
    procedure setVectorElem(vectorElem:integer;pos:integer);
	end;

implementation

{ vector }

constructor vector.crear;
var i:integer;
begin
  for i=1 to MAX_ELE do
  begin
    vectorElem[i]=0;
  end;
  dim:=0;
end;

function vector.getDim: integer;
begin
  Result:=dim;
end;

function vector.getElemPos(pos: integer): integer;
begin
  Result:=vectorElem[pos];
end;

procedure vector.setVectorInsertarElem(vectorElem: integer);
begin
  dim=dim+1;
  vectorElem[dim]=vectorElem;
end;

procedure vector.setVectorElem(vectorElem: integer; pos: integer);
begin

end;

end.

