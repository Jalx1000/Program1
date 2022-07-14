unit Cadenas;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

 type

 { cad }

 cad=class
   private
       Cadenita:string;
        Caracter:string;
        Posicion:string;
        CharCambiado:String;
        palabra:string;
        palabra2:string;
   public
         constructor create();

         procedure SetCadenita(n:string);
         function GetCadenita():string;

         procedure SetCaracter(m:string);
         function GetCaracter():string;

         procedure setposicion (l:string);
         Function getPosicion():string;

          procedure setCharCambiado (o:string);
         Function getCharCambiado():string;

         procedure setInsertPalabra (j:string);
         Function getInsertPalabra():string;

          procedure setpalabra2 (k:string);
         Function getPalabra2():string;


         function addchar():string;
         function insertchar():string;
         function elimchar():string;
         function Intercambiar():string;
         function Cantidad():string;
         function Buscar():string;
         function CantPalabritas():integer;
         function InsertarPalabra():string;
         Function eliminarPalabra():string;
         procedure cambiarPalabra(palabras:string; palabras2:string);
         function BuscarPalabra(n:string): boolean;
         function AddPalabra():string;
         function invertir():string;
         Function Rotar():string;
         Function Mayuscula():string;
         function minuscula():string;
         Function Titulo():string;
         Function ContarParrafos():integer;

         function BuscarInvertido(BuscarEn:string):integer;
         Function TotalCaracteres():integer;
         Function LetraTermina():string;
         function NumDePalabrasTerminan(n:string):integer;





  end;



implementation

{ cad }

constructor cad.create();
begin
  cadenita:='';
  caracter:='';
  Posicion:='';
end;

procedure cad.SetCadenita(n: string);
begin
    Cadenita:=n;
end;

function cad.GetCadenita(): string;
begin
    Result:=Cadenita;
end;

procedure cad.SetCaracter(m: string);
begin
    Caracter:=m;
end;

function cad.GetCaracter(): string;
begin
    Result:=Caracter
end;

procedure cad.setposicion(l: string);
begin
  Posicion:=l;
end;

function cad.getPosicion(): string;
begin
  Result:=Posicion;
end;

procedure cad.setCharCambiado(o: string);
begin
  Charcambiado:=o;
end;

function cad.getCharCambiado(): string;
begin
 result:=charcambiado;
end;

procedure cad.setInsertPalabra(j: string);
begin
  palabra:=j;
end;

function cad.getInsertPalabra(): string;
begin
   result:=palabra;
end;

procedure cad.setpalabra2(k: string);
begin
  palabra2:=k;
end;

function cad.getPalabra2(): string;
begin
 result:=palabra2;
end;

function cad.addchar(): string;
var r:string;
  t:integer;
begin
    t:=length(caracter);


    if t=1 then begin
       r:=Cadenita+caracter;
    end else begin
        r:= cadenita;
    end;


    Result:=r;


end;

function cad.insertchar(): string;
var r:string;
    t,t2,posi:integer;
begin
t:=length(cadenita);
t2:=length(Caracter);

     if t2=1 then begin
       for posi:=1 to t do begin

         if posi=strtoint(posicion) then begin
           r:=r+caracter;

         end;
          r:=r+cadenita[posi];
       end;

       end
       else begin

             r:=Cadenita

      end;
   Result:=r
end;

function cad.elimchar(): string;
var r:string;
    t,t2,posi:integer;
begin
t:=length(Cadenita);
t2:=length(Caracter);


   if t2=1 then begin

     for posi:=1 to t do begin
       if cadenita[posi]=Caracter then begin

       end else begin
        r:=r+Cadenita[posi];

       end;
     end;
   end;
  Result:=r;
end;

function cad.Intercambiar(): string;
var t,t2,t3,posi:integer;
    r:string;

begin
    t:=length(cadenita);
    t2:=length(caracter);
    t3:=length(charcambiado);



    if (t2=1) and (t3=1) then begin
        for posi:=1 to t do begin

          if cadenita[posi]=caracter then begin
             r:=r+charcambiado
          end else begin
              r:=r+cadenita[posi];
          end;

        end;
    end else begin
      r:=cadenita;
    end;
  result:=r;

end;

function cad.Cantidad(): string;
var t,posi,a:integer;

begin
  t:=length(cadenita);
  for posi:=1 to t do begin
    if cadenita[posi]=' ' then begin
       a:=a+1;
    end;

  end;
  t:=t-a;
  result:=inttostr(t)+' caracteres';


end;

function cad.Buscar(): string;
var t,posi:integer;
begin
  t:=length(cadenita);

  for posi:=1 to t do begin
    if cadenita[posi]=caracter then begin
       break;
    end;

  end;

  result:='Posicion: '+inttostr(posi);

end;

function cad.CantPalabritas(): integer;
var r,t,posi:integer;
begin
  cadenita:=trim(cadenita);
  t:=length(cadenita);
  for posi:=1 to t do begin
    if cadenita[posi]=' ' then begin
      r:=r+1;
    end;
  end;
    r:=r+1;
  result:=r;
end;

function cad.InsertarPalabra(): string;
var r,a:string;
    t:integer;
begin
  t:=length(cadenita);

  if strtoint(posicion)<=t then begin
  insert(Palabra,cadenita,strtoint(posicion));

  end;
 result:=cadenita;

end;

function cad.eliminarPalabra(): string;
var t,t2,posi,a,p,k:integer;
begin
   t:=length(cadenita);
   t2:=length(palabra);
   a:=1;

   for posi:=1 to t do begin
     if cadenita[posi]=palabra[a] then begin
       a:=a+1;

       if p=0 then begin
         p:=posi;
       end;

       if a=t2 then begin
         a:=2;
         break;
       end;

     end else begin
       a:=1;
       p:=0;
     end;

   end;

   if a=2 then begin
   delete(cadenita,p,t2);
   end else begin
   cadenita:=cadenita;
   end;

   result:=trim(cadenita);
end;

procedure cad.cambiarPalabra(palabras: string; palabras2: string);
var t,t2,posi,a,p,k:integer;
begin
   t:=length(cadenita);
   t2:=length(palabras);
   a:=1;

   for posi:=1 to t do begin
     if cadenita[posi]=palabras[a] then begin
       a:=a+1;

       if p=0 then begin
         p:=posi;
       end;

       if a=t2 then begin
         a:=2;
         break;
       end;

     end else begin
       a:=1;
       p:=0;
     end;

   end;

   if a=2 then begin
   delete(cadenita,p,t2);
   insert(Palabras2,cadenita,p);
   end else begin
   cadenita:=cadenita;
   end;

end;

function cad.BuscarPalabra(n: string): boolean;
var t,t2,posi,a,p,k:integer;
begin
   t:=length(cadenita);
   t2:=length(n);
   a:=1;

   for posi:=1 to t do begin
     if cadenita[posi]=n[a] then begin
       a:=a+1;

       if p=0 then begin
         p:=posi;
       end;

       if a=t2 then begin
         a:=2;
         break;
       end;

     end else begin
       a:=1;
       p:=0;
     end;

   end;

   if a=2 then begin
   result:=true;

   end else begin
   result:=false;
   end;

end;

function cad.AddPalabra(): string;
 var r:string;
begin
  r:=cadenita+palabra;
  result:=r;
end;

function cad.invertir(): string;
var t,posi:integer;
    r:string;
begin
  t:=length(cadenita);

  for posi:=1 to t do begin

    r:=cadenita[posi]+r;
  end;

  result:=r;
end;

function cad.Rotar(): string;
var t,posi:integer;
    r:array[1..500] of char;
    resultado:string;
begin
  t:=length(cadenita);

  for posi:=1 to t do begin

    if posi+1>t then begin
    r[1]:=cadenita[t];
    end else begin
    r[posi+1]:=cadenita[posi];
    end;

  end;

  for posi:=1 to t do begin
    resultado:=resultado+r[posi]
  end;

  result:=resultado

end;

function cad.Mayuscula(): string;
begin
  cadenita:=uppercase(cadenita);
  result:=cadenita;
end;

function cad.minuscula(): string;
begin
 cadenita:=lowercase(cadenita);
  result:=cadenita;
end;

function cad.Titulo(): string;
begin
  Cadenita:=UpperCase(cadenita);
  cadenita:=Cadenita;

  result:=cadenita;
end;

function cad.ContarParrafos(): integer;
var t,parrafos:integer;
begin
  t:=length(cadenita);

  if cadenita[t]='.' then begin
   Parrafos:=1
  end;

  result:=parrafos;

end;

function cad.BuscarInvertido(BuscarEn: string): integer;
var t,posi:integer;
begin
  t:=length(cadenita);

  for posi:=t downto 1 do begin
    if cadenita[posi]=BuscarEn then begin
       break;
    end;

  end;

  result:=posi;
end;

function cad.TotalCaracteres(): integer;
begin
  result:=length(cadenita);
end;

function cad.LetraTermina(): STRING;
var posi:integeR;
begin
  for posi:=1 to length(cadenita) do begin
    if cadenita[posi]=' ' then begin
      result:=cadenita[posi-1];
      BREAK;
    end;

  end;
end;

function cad.NumDePalabrasTerminan(n: string): integer;
var posi:integer;
    cantidad2:integer;
begin
  For posi:=1 to length(cadenita) do begin
    if cadenita[posi]=' ' then begin
      if cadenita[posi-1]=n then begin
        Cantidad2:=cantidad2+1;
      end;
    end;
  end;


  result:=cantidad2;
end;

end.

