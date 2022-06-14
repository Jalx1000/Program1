unit MatricesU;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, dialogs, math;
const
  MaxCols=1000;
  MaxFils=1000;

type

  { matriz }

  matriz=class
    elem:array[1..MaxFils,1..MaxCols] of integer;
    fils,cols:integer;
    dim:integer;


    ElementoVector:array[1..1000] of integer;

     public
       constructor create;
       procedure SetFils(f:integer);
       function GetFils():integer;

       procedure SetCols(c:integer);
       function GetCols():integer;

       procedure SetElem(f:integer; C:integer; ElemNuevo:integer);
       Function GetElem(f:integer; C:integer):integer;

       Function SumarBloque(FilsI,ColsI,FilsF,ColsF:integer):integer;
       Function PromedioTID():real;
       Function ContadorTID():Integer;
       Function PromedioTSI():real;
       Function PromedioTDS():real;
       Function PromedioTII():real;
       Function PromedioDP():real;
       Function PromedioDS():real;
       procedure SumarMatrices(OtraMatriz:matriz);
       procedure MultiplicarMatrices(OtraMatriz:Matriz);
       function sumacol(Columna: integer): integer;
       Function SumarFilas(Fila:Integer): integer;
       function promedioMatriz():Real;
       Function BuscRep(n:integer):string;
       Procedure CargarVector();
       procedure CargarMatrizConVector(MatrizAVector:Matriz);
       Function ElementoModaTSI():INTEGER;
       function Repetidos(numero:integer):integer;
       Function ElementoModaTID():Integer;
       function RepetidosTID(numero:integer):integer;
       procedure RestarMatrices(OtraMatriz:Matriz);
       procedure invertirNumeros();
       function determinanteCofactores(a:matriz):real;
       function Cofactor(f,c:integer):real;
       function multiplicarEnCruz():integer;
       function determinante():integer;
       function determinante2x2(): integer;
       function determinante3x3():integer;
       procedure transpuesta();
       procedure ordenarMatriz();



  end;

implementation

{ matriz }

constructor matriz.create;
 var f,c:integer;
begin
   fils:=0;
   cols:=0;

   for f:=1 to MaxFils do begin
     for c:=1 to MaxCols do begin
       elem[f,c]:=0;
     end;

   end;


end;

procedure matriz.SetFils(f: integer);
begin
   if (f>=0) and (f<=MaxFils) then begin
    fils:=f;
   end else begin
     showmessage('Introduzca una fila mayor igual a 0, y menor igual a 1000');
   end;


end;

function matriz.GetFils(): integer;
begin
 result:=fils;
end;

procedure matriz.SetCols(c: integer);
begin
   if (c>=0) and (c<=MaxFils) then begin
    cols:=c;
   end else begin
     showmessage('Introduzca una Columna mayor igual a 0, y menor igual a 1000');
   end;
end;

function matriz.GetCols(): integer;
begin
  result:=cols;
end;

procedure matriz.SetElem(f: integer; C: integer; ElemNuevo: integer);
begin
  if (f>0) and (f<=fils) and (c>0) and (c<=cols) then begin
   elem[f,c]:=ElemNuevo;
  end else begin
    showmessage('Hay un valor fuera de rango');
  end;
end;

function matriz.GetElem(f: integer; C: integer): integer;
begin
  if (f>0) and (f<=fils) and (c>0) and (c<=cols) then begin
    result:=elem[f,c];
  end else begin
    Result:=-999;
  end;

end;

function matriz.SumarBloque(FilsI, ColsI, FilsF, ColsF: integer): integer;
var i,j,r:integer;
begin
  r:=0;

 if (FilsF<=Fils) and (colsF<=cols) and (FilsI<=FilsF) and (colsi<=Colsf) then begin

  for i:=FilsI to FilsF do begin
    for j:=ColsI to ColsF do begin
       r:=r+elem[i,j];
    end;

  end;

 end else begin
   showmessage('Hay un elemento fuera de rango');
 end;

 result:=r;

end;

function matriz.PromedioTID(): real;
var columna,fila,a,r:integer;
     resultado:real;
begin

 fila:=fils;

    for Columna:=2 to cols do begin

     while fila>=2 do begin


      if fila<=fils then begin
          for a:=fila to fils do begin
             r:=r+elem[a,columna];
          end;
      fila:=fila-1;
       break;

     end;

    end;

  end;

  resultado:=r/self.ContadorTID;

  result:=resultado;



end;

function matriz.ContadorTID(): Integer;
 var columna,fila,a,r,cont:integer;
      romper:boolean;

begin
 cont:=0;
 fila:=fils;

    for Columna:=2 to cols do begin

     while fila>=2 do begin


      if fila<=fils then begin
          for a:=fila to fils do begin
             cont:=cont+1;
          end;
      fila:=fila-1;
       break;

      end;

    end;

  end;
  result:=cont;

end;

function matriz.PromedioTSI(): real;
var columna,fila,a,r,cont:integer;
     resultado:real;
begin

 fila:=1;

    for Columna:=cols-1 downto 1 do begin

     while fila<=fils-1 do begin


      if fila>=1 then begin
          for a:=fila downto 1 do begin
             r:=r+elem[a,columna];
             cont:=cont+1;
          end;
      fila:=fila+1;
       break;

      end;


    end;

  end;


  resultado:=r/cont;

  result:=resultado;

end;

function matriz.PromedioTDS(): real;
var columna,fila,a,r,cont:integer;
     resultado:real;
begin

 fila:=1;

    for Columna:=2 to cols do begin

     while fila<=fils-1 do begin


      if fila>=1 then begin
          for a:=fila downto 1 do begin
             r:=r+elem[a,columna];
             cont:=cont+1;
          end;
      fila:=fila+1;
       break;


    end;

    end;

  end;


  resultado:=r/cont;

  result:=resultado;

end;

function matriz.PromedioTII(): real;
var columna,fila,a,r,cont:integer;
     resultado:real;
begin
 cont:=0;
 fila:=fils;

    for Columna:=cols-1 downto 1 do begin

     while fila>=2 do begin


      if fila<=fils then begin
          for a:=fila to fils do begin
             r:=r+elem[a,columna];
             cont:=cont+1;
             showmessage('entro');
          end;
      fila:=fila-1;
       break;

      end;


    end;

  end;

    showmessage(inttostr(r));
    showmessage(inttostr(cont));

  resultado:=r/cont;

  result:=resultado;

end;

function matriz.PromedioDP(): real;
var columna,fila,a,r,cont:integer;
     resultado:real;
begin

 fila:=1;

    for Columna:=1 to cols do begin

     while fila<=fils do begin


      if fila>1 then begin
       r:=r+elem[fila,columna];
       cont:=cont+1;
       fila:=fila+1;
       break;

      end else begin
         r:=r+elem[fila,columna];
        fila:=fila+1;
        cont:=cont+1;
        break;

      end;


    end;

  end;


  resultado:=r/cont;

  result:=resultado;



end;

function matriz.PromedioDS(): real;
var columna,fila,a,r,cont:integer;
     resultado:real;
begin

 fila:=fils;

    for Columna:=1 to cols do begin

     while fila>=1 do begin


      if fila<fils then begin
       r:=r+elem[fila,columna];
       cont:=cont+1;
       fila:=fila-1;
       break;

      end else begin
         r:=r+elem[fila,columna];
        fila:=fila-1;
        cont:=cont+1;
        break;

      end;


    end;

  end;


  resultado:=r/cont;

  result:=resultado;

end;

procedure matriz.SumarMatrices(OtraMatriz:matriz);
var fila,columna:integer;
begin

 if (self.getFils+Self.GetCols)=(OtraMatriz.getFils+OtraMatriz.GetCols) then begin
 for columna:=1 to cols do begin
  for fila:=1 to fils do begin
    elem[fila,columna]:=elem[fila,columna]+OtraMatriz.getElem(fila,columna);
  end;
 end;
 end;


end;

procedure matriz.MultiplicarMatrices(OtraMatriz: Matriz);
var fila,columna,r,columnaaux,filaaux:integer;
    termino:boolean;
    copia:array[1..100,1..100]of integer;
begin
 if self.getcols=Otramatriz.getfils then begin
    for fila:=1 to fils do begin
     for columna:=1 to cols do begin
      copia[fila,columna]:=self.getelem(fila,columna);
     end;
    end;


  if self.getcols=Otramatriz.getfils then begin
   for fila:=1 to fils do begin

    termino:=false;
    filaAux:=1;
    ColumnaAux:=0;
    termino:=false;
    r:=0;

    while termino=false do begin
      for columna:=1 to cols do begin
       r:=r+(Copia[fila,columna]*OtraMatriz.GetElem(columna,filaAux));


      end;

      ColumnaAux:=ColumnaAux+1;
      elem[fila,ColumnaAux]:=r;

      r:=0;

       if columnaAux=OtraMatriz.GetCols then begin
         termino:=true;
       end else begin
          filaAux:=filaAux+1;
       end;

    end;

   end;
  end;

  self.SetFils(fils);
  self.SetCols(otramatriz.getcols);



end else begin
 showmessage('El numero de columnas de la primer matriz, debe ser igual al numero de filas de la segunda');
end;

end;

  function matriz.sumacol(Columna: integer): integer;
var fila,r:integeR;
begin
 for fila:=1 to fils do begin
  r:=r+elem[fila,columna];
 end;

 result:=r;


end;

function matriz.SumarFilas(Fila: Integer): integer;
 var Columna,r:integeR;
begin
   for Columna:=1 to cols do begin
    r:=r+elem[fila,Columna];
   end;

   result:=r;

end;

function matriz.promedioMatriz(): Real;
var fila,columna,r:integer;
    decimal:real;
begin
  for fila:=1 to fils do begin
   for columna:=1 to cols do begin
    r:=elem[fila,columna]+r;
   end;
  end;

  Decimal:=r/(fils*cols);

  result:=decimal;

end;

function matriz.BuscRep(n: integer): string;
var fila,columna,r:integer;

begin
 r:=0;
  for fila:=1 to fils do begin
   for columna:=1 to cols do begin
    if elem[fila,columna]=n then begin
     result:='El elemento repetido se encuentra en la posicion: '+inttostr(fila)+'x'+inttostr(columna);
    end;
   end;
  end;



end;

procedure matriz.CargarVector();
var posi,dimteclado:integer;
begin
 dimteclado:=strtoint(inputbox('Introduzca la dimension del vector','',''));
  dim:=dimteclado;

 for posi:=1 to dim do begin
  ElementoVector[posi]:=strtoint(inputbox('Introduzca el valor de la posicion: '+inttostr(posi),'',''));
 end;

end;

procedure matriz.CargarMatrizConVector(MatrizAVector: Matriz);
var columna:integer;
begin
 self.cargarVector();
 for columna:=1 to dim do begin
     elem[1,columna]:=self.ElementoVector[columna];
  end;
end;

function matriz.ElementoModaTSI(): INTEGER;
var columna,fila,a,r,cont:integer;
     resultado:real;
     comparacion,masrepetido,segundomasrepetido,respuesta:integer;
begin

 fila:=1;

    for Columna:=cols downto 1 do begin

     while fila<=fils do begin


      if fila>1 then begin
          for a:=fila downto 1 do begin
           Comparacion:=elem[a,columna];
           SegundoMasRepetido:=self.repetidos(comparacion);

           if MasRepetido<SegundoMasRepetido then begin
            MasRepetido:=SegundoMasRepetido;
            Respuesta:=Comparacion;
           end;


          end;
      fila:=fila+1;
       break;

      end else begin
        r:=elem[fila,columna];
       MasRepetido:=self.repetidos(r);
       respuesta:=R;
        fila:=fila+1;
        break;

      end;


    end;

  end;



result:=respuesta;

end;

function matriz.Repetidos(numero:integer): integer;
var columna,fila,a,r,cont:integer;
     vecesRepetido:integer;
begin

 fila:=1;

    for Columna:=cols downto 1 do begin

     while fila<=fils do begin


      if fila>1 then begin
          for a:=fila downto 1 do begin
             r:=elem[a,columna];
              if numero=r then begin
              vecesRepetido:= vecesRepetido+1;
              end;
          end;
      fila:=fila+1;
       break;

      end else begin

        r:=elem[fila,columna];
        if numero=r then begin
        vecesRepetido:= vecesRepetido+1;
        end;
        fila:=fila+1;
        cont:=cont+1;
        break;

      end;


    end;

  end;


  result:=vecesRepetido;

end;

function matriz.ElementoModaTID(): Integer;
var columna,fila,a,r:integer;
     resultado:real;
     comparacion,segundomasrepetido,masrepetido,respuesta:integer;
begin

 fila:=fils;

    for Columna:=1 to cols do begin

     while fila>=1 do begin


      if fila<fils then begin
          for a:=fila to fils do begin

           Comparacion:=elem[a,columna];
           SegundoMasRepetido:=self.repetidosTID(comparacion);

           if MasRepetido<SegundoMasRepetido then begin
            MasRepetido:=SegundoMasRepetido;
            Respuesta:=Comparacion;
           end;




          end;
      fila:=fila-1;
       break;

      end else begin
      r:=elem[fila,columna];
       MasRepetido:=self.repetidosTID(r);
       respuesta:=R;

        fila:=fila-1;
        break;

      end;


    end;

  end;

    result:=respuesta;


end;

function matriz.RepetidosTID(numero: integer): integer;
var columna,fila,a,r:integer;
     resultado:real;
     vecesRepetido:integer;
begin

 fila:=fils;

    for Columna:=1 to cols do begin

     while fila>=1 do begin


      if fila<fils then begin
          for a:=fila to fils do begin
                r:=elem[a,columna];
              if numero=r then begin
              vecesRepetido:= vecesRepetido+1;
              end;

          end;
      fila:=fila-1;
       break;

      end else begin
        r:=elem[fila,columna];
        if numero=r then begin
        vecesRepetido:= vecesRepetido+1;
        end;

        fila:=fila-1;
        break;

      end;


    end;

  end;


   result:=vecesRepetido;

end;

procedure matriz.RestarMatrices(OtraMatriz: Matriz);
var fila,columna:integer;
begin

 if (self.getFils+Self.GetCols)=(OtraMatriz.getFils+OtraMatriz.GetCols) then begin
 for columna:=1 to cols do begin
  for fila:=1 to fils do begin
    elem[fila,columna]:=elem[fila,columna]-OtraMatriz.getElem(fila,columna);
  end;
 end;
 end;


end;

procedure matriz.invertirNumeros();
var fila,columna,filaaux:integer;
    copia:array[1..100,1..100]of integer;
begin
    for fila:=1 to fils do begin
     for columna:=1 to cols do begin
      copia[fila,columna]:=self.getelem(fila,columna);
     end;
    end;

   filaaux:=fils+1;

  for columna:=1 to cols do begin
   for fila:=1 to fils do begin

   if filaaux=1 then begin
   filaaux:=fils
   end else begin
   filaaux:=filaaux-1;
   end;

    elem[fila,columna]:=copia[filaaux,columna];


   end;
  end;
end;

function matriz.determinanteCofactores(a:matriz): real;
begin

end;

function matriz.Cofactor(f, c:integer): real;


begin

end;

function matriz.multiplicarEnCruz(): integer;
begin

end;

function matriz.determinante(): integer;
begin
  if cols=1 and fils then begin
  result:=elem[1,1];
  end else begin

  end;
end;

function matriz.determinante2x2(): integer;
var a1,a2,b1,b2:integer;
begin
   a1:=elem[1,1];
   a2:=elem[2,2];
   b1:=elem[1,2];
   b2:=elem[2,1];

   result:=(a1*a2)-(b1*b2);

end;

function matriz.determinante3x3(): integer;
var a1,a2,a3,b1,b2,b3:integer;
begin
 a1:=elem[1,1]*elem[2,2]*elem[3,3];
 a2:=elem[1,2]*elem[2,3]*elem[3,1];
 a3:=elem[1,3]*elem[2,1]*elem[3,2];

 b1:=elem[3,1]*elem[2,2]*elem[1,3];
 b2:=elem[3,2]*elem[2,3]*elem[1,1];
 b3:=elem[3,3]*elem[2,1]*elem[1,2];

 result:=(a1+a2+a3)-(b1+b2+b3);



end;

procedure matriz.transpuesta();
var copia:array[1..100,1..100]of integer;
     fila,columna:integeR;
begin
for fila:=1 to fils do begin
 for columna:=1 to cols do begin
  copia[fila,columna]:=self.getelem(fila,columna);
 end;
end;

 for fila:=1 to cols do begin
  for columna:=1 to fils do begin
    elem[fila,columna]:=copia[columna,fila];
  end;
 end;



end;

procedure matriz.ordenarMatriz();
var p,d,aux,dim,fp,cp,fd,cd:integeR;
begin
  dim:=fils*cols;

  for p:=1 to dim-1 do begin
   for d:=p+1 to dim do begin
     fp:=((p-1) div cols)+1;
     cp:=((p-1) mod cols)+1;
     fd:=((d-1) div cols)+1;
     cd:=((d-1) mod cols)+1;

     if (elem[fd,cd]<elem[fp,cp]) then begin
     aux:=elem[fd,cd];
     elem[fd,cd]:=elem[fp,cp];
     elem[fp,cp]:=aux;
     end;

   end;
  end;


end;

end.

