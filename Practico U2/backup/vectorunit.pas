unit VectorUnit;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils,Dialogs;
	const MAX_ELE=1200;
type

  { vector }

  vector = class
  private
	  dim : integer; //DIMENSION DEL VECTOR
    elem : array [1..MAX_ELE] of integer; //TODO EL VECTOR //VECTOR ES SOLO DE ENTEROS
  public
	  constructor crear;
    function getDim():integer;

    function getElem(pos:integer):integer;
    procedure cargarElem();
    procedure insertarElem(elemN:integer);//pone un elemento en la ultima posicion
    procedure setElem(elemN:integer;pos:integer);
    procedure eliminarElem(pos:integer);
	end;

implementation

{ vector }

constructor vector.crear;
var i:integer;
begin
  for i:=1 to MAX_ELE do
  begin
    elem[i]:=0;
  end;
  dim:=1;
end;

function vector.getDim: integer;
begin
  Result:=dim;
end;

function vector.getElem(pos: integer): integer;
begin
  Result:=elem[pos];
end;

procedure vector.cargarElem();
var i:integer;
		dimTeclado,elemTeclado:String;
begin
  	 dimTeclado:=InputBox('Introducir dim','','');
     dim:=StrToInt(dimTeclado);
     for i:=0 to dim do
     begin
       elemTeclado:=InputBox('Introducir elem: ' + IntToStr(i),'','');
       elem[i]:=StrToInt(elemTeclado);
     end;
end;


procedure vector.insertarElem(elemN: integer);
begin
   dim:=dim+1;
 	elem[dim]:=elemN;
end;

procedure vector.setElem(elemN: integer; pos: integer);
begin
   if(pos<=dim) then
   begin
     elem[pos]:=elemN;
   end;
end;

procedure vector.eliminarElem(pos: integer);
var i:integer;
begin
  for i:=1 to (dim-1) do
  begin
    elem[i]:=elem[i+1];
  end;
  dim:=dim-1
end;


end.

