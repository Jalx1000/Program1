unit UMatrices;

{$mode ObjFPC}{$H+}

interface
uses
  Classes, SysUtils, Dialogs;
const MAX_F=1024;
const MAX_C=1024;
type

    { Matriz }

    Matriz=class
		private
      f:integer;
      c:integer;

      elem:array [1..MAX_F,1..MAX_C] of integer;
    public
      constructor crear();
      function getElem(fil,col:integer):integer;
      function getFilas():integer;
      function getCols():integer;
      procedure cargar();
      procedure setElem(fil,col,elemN:integer);
      procedure setFilas(fil:integer);
      procedure setColumnas(cols:integer);

      procedure suma(otraMatriz:matriz);
    end;
implementation

{ Matriz }

constructor Matriz.crear;
var i,j:integer;
begin
  f:=0;
  c:=0;
  for i:=1 to MAX_F do begin
    for j:=1 to MAX_C do begin
      elem[i,j]:=0;
    end;
  end;
end;

function Matriz.getElem(fil, col: integer): integer;
//var i,j:integer;
begin
  Result:=elem[fil,col];
end;

function Matriz.getFilas: integer;
begin
  Result:=f;
end;

function Matriz.getCols: integer;
begin
  Result:=c;
end;

procedure Matriz.cargar;
var i,j:integer;
begin
  f:=StrToInt(InputBox('Ingrese filas','',''));
  c:=StrToInt(InputBox('Ingrese columnas','',''));
  for i:=1 to f do begin
    for j:=1 to c do begin
      elem[i,j]:=StrToInt(InputBox('Introduzca Elem ','Fila: '+IntToStr(i)+' columna: '+IntToStr(j),''));
    end;
  end;
end;

procedure Matriz.setElem(fil, col, elemN: integer);
//var i,j:integer;
begin
   elem[fil,col]:=elemN;
end;

procedure Matriz.setFilas(fil: integer);
begin
  f:=fil;
end;

procedure Matriz.setColumnas(cols: integer);
begin
  c:=cols;
end;

procedure Matriz.suma(otraMatriz: matriz);
var fila,columna:integer;
begin

 if (self.getFilas()+Self.getCols())=(OtraMatriz.getFilas()+OtraMatriz.getCols()) then begin
   for columna:=1 to c do begin
 for fila:=1 to f do begin
    elem[fila,columna]:=elem[fila,columna]+OtraMatriz.getElem(fila,columna);
  end;
 end;
 end;

end;

end.

