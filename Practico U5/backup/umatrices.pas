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
      elem:array [1..MAX_F,1..MAX_C] of integer;
      ElementoVector: array [1..1000] of integer;
      f:integer;
      c:integer;
      dim:integer;
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
      procedure multiplicacion(otraMatriz:matriz);

      function promedioTID():real;
      function promedioTSI():real;
      function sumaCol(Columna:integer):integer;
      function sumaFil(fila:integer):integer;
      function promediFila(fila:integer):real;
      function promedioColumna(columna:integer):real;
      function promedioMatriz():real;
      procedure buscarRepetitivo(a:integer);
      procedure cargarAVector();
      procedure cargarMatrizVector(m:Matriz);
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

procedure Matriz.multiplicacion(otraMatriz: matriz);
var fila,columna:integer;
begin

 if (self.getFilas()+Self.getCols())=(OtraMatriz.getFilas()+OtraMatriz.getCols()) then begin
   for columna:=1 to c do begin
 for fila:=1 to f do begin
    elem[fila,columna]:=elem[fila,columna]*OtraMatriz.getElem(fila,columna);
  end;
 end;
 end;

end;

function Matriz.promedioTID: real;
var i,j,s,n,ci:integer;
begin
 s:=0;
 n:=0;
 ci:=c;
  for i:=1 to f do begin
	  for j:=ci to c do begin
      ShowMessage(inttostr(elem[i,j]));
      s:=s+elem[i,j];
      n:=n+1;
    end;
    ci:=ci-1;
  end;
  Result := s/n;
end;

function Matriz.promedioTSI: real;
var i,j,s,n,cols,a,cont,fi:integer;
begin
 fi:=1;

 for cols:=c-1 downto 1 do begin
     while fi<=f-1 do begin
      if fi>=1 then begin
          for a:=fi downto 1 do begin
           ShowMessage(inttostr(elem[a,cols]));
             n:=n+elem[a,cols];
             cont:=cont+1;
          end;
      fi:=fi+1;
       break;
      end;
    end;
  end;

 Result := s/n;

end;

function Matriz.sumaCol(Columna: integer): integer;
var i,s:integer;
begin
		 for i:=1 to f do begin
      s:=s+elem[i,Columna];
     end;
     result:=s;
end;

function Matriz.sumaFil(fila: integer): integer;
var i,s:integer;
begin
		 for i:=1 to c do begin
      s:=s+elem[fila,i];
     end;
     Result:=s;
end;

function Matriz.promediFila(fila: integer): real;
var i,s,n:integer;
begin
 n:=0;
		 for i:=1 to f do begin
      s:=s+elem[fila,i];
      n:=n+1;
     end;
     result:=s/n;
end;

function Matriz.promedioColumna(columna: integer): real;
var i,s,n:integer;
begin
 n:=0;
		 for i:=1 to f do begin
      s:=s+elem[i,Columna];
      n:=n+1;
     end;
     result:=s/n;
end;

function Matriz.promedioMatriz: real;
var i,j,s,n:integer;
begin
 n:=0;
  for i:=1 to f do begin
   for j:=1 to c do begin
    s:=s+elem[i,j];
    n:=n+1;
   end;
  end;
  result:= s/n;
end;

procedure Matriz.buscarRepetitivo(a: integer);
var i,j,r:integer;
begin
 r:=0;
  for i:=1 to f do begin
   for j:=1 to c do begin
    if elem[i,j]=a then
    begin
     r:=r+1
    end;
   end;
  end;
  ShowMessage('El elemnto se repite '+IntToStr(r)+' veces');

end;

procedure Matriz.cargarAVector;
var posi,dimteclado:integer;
begin
 dim:=strtoint(inputbox('Introduzca la dimension del vector','',''));
  //dim:=dimteclado;

 for posi:=1 to dim do begin
  ElementoVector[posi]:=strtoint(inputbox('Introduzca el valor de la posicion: '+inttostr(posi),'',''));
 end;

end;

procedure Matriz.cargarMatrizVector(m:Matriz);
var columna:integer;
begin
 Self.cargarAVector();
 for columna:=1 to dim do begin
     elem[1,columna]:=self.ElementoVector[columna];
  end;
end;



end.

