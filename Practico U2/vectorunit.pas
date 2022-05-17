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
    function esEnteroPrimo(num:integer):boolean;

  public
	  constructor crear;
    function getDim():integer;
    function cantRep(elemABuscar:integer):integer;
    function getElemModa():integer;
    function getElem(pos:integer):integer;
    procedure cargarElem();
    procedure insertarElem(elemN:integer);//pone un elemento en la ultima posicion
    procedure setElem(elemN:integer;pos:integer);
    procedure eliminarElem(pos:integer);
    procedure eliminarPrimos();
    procedure eliminarRep();
  end;

implementation

{ vector }

function vector.esEnteroPrimo(num: integer): boolean;
var i,c:integer;
    b:boolean;
begin
  c:=0;
  b:=false;
  for i:=1 to num do
  begin
    if(num mod i=0)then
    begin
      c:=c+1;
    end;
  end;
  if((c<=2) and (c>=1))then
    begin
    b:=true;
    end;

  Result:=b;
end;
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
function vector.getElemModa: integer;
var i,elemModa,elemActual:integer;
begin
  elemModa:=elem[1];
  for i:=1 to dim do
  begin
	  elemActual:=elem[i];
    if(cantRep(elemActual)>elemModa) then
      begin
           elemModa:=elemActual;
      end;
  end;
  Result:=elemModa;
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
procedure vector.eliminarPrimos;
var i:integer;
begin
  i:=1;
  while i<=dim do
  begin
    if(esEnteroPrimo(elem[i])) then
    begin
      eliminarElem(i);
    end else
    begin
      i:=i+1;
    end;
  end;
end;
procedure vector.eliminarRep;
var i,elemActual:integer;
begin
  i:=1;
  while i<=dim do
  begin
    elemActual:=elem[i];
    if(cantRep(elemActual)>1) then
      begin
        eliminarElem(i);
      end else
        i:=i+1;
	end;
end;


end.

