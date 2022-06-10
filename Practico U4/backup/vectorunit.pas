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
    function cantRep(elemABuscar:integer):integer;
    function getElem(pos:integer):integer;
    procedure cargarElem();
    procedure insertarElem(elemN:integer);//pone un elemento en la ultima posicion
    procedure setElem(elemN:integer;pos:integer);
    procedure eliminarElem(pos:integer);
    function corteControlC():integer;
    function frecuenciaCC():integer;
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
  dim:=0;
end;
function vector.getDim: integer;
begin
  Result:=dim;
end;
function vector.cantRep(elemABuscar: integer): integer;
var i,c,elemActual:integer;
begin
  c:=0;
  for i:=1 to dim do
  begin
    elemActual:=elem[i];
    if(elemABuscar=elemActual)then
      begin
      		 c:=c+1;
      end;
  end;
  Result:=c;
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
     for i:=1 to dim do
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
var i,j:integer;
    encontro:boolean;
begin
  encontro:=false;
  i:=1;
  while ((i < dim) and not encontro) do
  begin
    if( i=pos) then
  	  begin
        encontro:=true;
        for j:=i to (dim-1) do
        		begin
              elem[j]:=elem[j+1];
            end;
      end;
    i:=i+1;
  end;
  dim:=dim-1
end;

function vector.corteControlC: integer;
var i,cc:integer;
begin
  i:=1;
  cc:=0;
  while i<= dim-1 do
  begin
    if elem[i]<>elem[i+1] then
          begin
            cc:=cc+1
          end;
    i:=i+1;
  end;
  Result:=cc;
end;

function vector.frecuenciaCC: integer;
var i,fcc:integer;
begin
  i:=1;
  fcc:=0;
  while i<= dim-1 do
  begin
    if elem[i]<>elem[i+1] then
          begin

          end else
          begin
            fcc:=fcc+1;
          end;
    i:=i+1;
  end;
  Result:=fcc;
end;

end.

