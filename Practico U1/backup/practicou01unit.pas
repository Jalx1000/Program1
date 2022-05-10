unit PracticoU01Unit;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils,Dialogs;
type
  //abecedario=(a,b,c,d,e,f,g,h,i,j,l,m,n,o,p,q,r,s,t,w,v,w,x,y,z);
  { PracticoU1 }

  PracticoU1=class
    private
    public
      procedure ejercicio1(k:integer);
      procedure ejercicio2(n:integer);
      procedure ejercicio3(n:integer);
      procedure ejercicio4(n:integer);
      function ejercicio5(n,m:integer):integer;
      function ejercicio6(n,m:integer):integer;
      //ejercicio7 esta hechi multilplicacion
      //ejercicio8 esta hecho divicion
  end;

implementation

{ PracticoU1 }

procedure PracticoU1.ejercicio1(k: integer);
var c:integer;
begin
  c:=1;
  while(c<=k)do
  begin
       ShowMessage(IntToStr(c));
       c:=c+1;
  end;
end;
procedure PracticoU1.ejercicio2(n: integer);
var  c,suma:integer;
begin
     suma:=0;
     c:=0;
     while (c<=n) do
     begin

     //suma:=suma+1;
     suma:=suma+c;

     c:=c+1;
     end;
     ShowMessage(IntToStr(suma));
end;
procedure PracticoU1.ejercicio3(n: integer);
var i:integer;
    abecedario:Ansistring;
begin
     //abecedario:=Ord(97);
     //i:=Ord(n);
     writeln(abecedario);
     //ShowMessage(abecedario);

     //for i:=1 to n do
     //begin
     //     ShowMessage(abecedario[i]);
     //end;


     //if(i = Ord('a')) then
     //begin
     //
     //end;

end;
 //resolver ejercicio 3
procedure PracticoU1.ejercicio4(n: integer);
var par,impar:integer;
begin
     par:=2;
     impar:=1;
   if((n mod 2) =0) then begin
     while  par<=n do
          begin
               ShowMessage(IntToStr(par));
               par:=par+2;
          end;
   end else if((n mod 2) <>0 ) then
       begin
            while  impar<=n do
                   begin
                      ShowMessage(IntToStr(impar));
                      impar:=impar+2;
                   end;
       end;
end;
function PracticoU1.ejercicio5(n,m: integer): integer;
var a,c:integer;
begin
     c:=1;
     a:=0;
     while (c<=m) do
     begin
        c:=c+1;
        a:=a+n;
     end;
     result:=a;
end;
function PracticoU1.ejercicio6(n,m: integer): integer;
var c:integer;
begin
  c:=0;
  while (n>=m) do
  begin
     n:=n-m;
     c:=c+1;
  end;
  result:=c;
end;


end.

