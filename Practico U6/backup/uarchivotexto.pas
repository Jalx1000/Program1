unit UArchivoTexto;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Dialogs;
type

  { Texto }

  Texto=class
    private
      f:text;
      nom,ext:string;
      modo:integer;
    public
      constructor crear(nombre: string; extNueva: string);
      procedure abrir();
      procedure cerrar();
      procedure setNombre(nombre:string);
      procedure setExt(extensionNueva:string);
      procedure escribirLinea(lin:string);
      function getNombreCompleto():string;
      function getExt():string;
      function leerLinea():string;
      function fin():boolean;
      function copiar():texto;
  end;

implementation

{ Texto }

constructor Texto.crear(nombre: string; extNueva: string);
begin
       //0:=LECTURA
       //1:=Escritura
   nom:=nombre;
   ext:=extNueva;
   modo:=3;
   assign(f,getNombreCompleto());
    {$I-}
       rewrite(f); //rewrite= si existe un archivo con el mismo nombre, lo sobreescribe (no debe estar abierto)
                 //SI NO EXISTE lo crea
    {$I+}
    if(IOResult<>0)then
    begin
         WriteLn('ERROR AL CREAR EL ARCHIVO DE TEXTO :'+ getNombreCompleto());

    end;

    modo:=0 //LECTURA
end;

procedure Texto.abrir();
begin
  assign(f,getNombreCompleto());
  {$I-}
       reset(f);
  {$I+}
     if(IOResult<>0)then
    begin
         WriteLn('ERROR AL LEER/ABRIR EL ARCHIVO DE TEXTO :'+ getNombreCompleto());
         exit;
    end;
    modo:=1 //Escritura
end;

procedure Texto.cerrar();
begin
  close(f);
  modo:=0;
end;

procedure Texto.setNombre(nombre: string);
begin
   nom:=nombre;
end;

procedure Texto.setExt(extensionNueva: string);
begin
 ext:=extensionNueva;
end;

procedure Texto.escribirLinea(lin: string);
begin
  writeln(f,lin);
end;

function Texto.getNombreCompleto(): string;
begin
   Result:=nom+'.'+ext;
end;

function Texto.getExt(): string;
begin

end;



function Texto.leerLinea(): string;
  var s:string;
  begin
         if(modo=1)then
         begin
              readln(f,s); //s:=leerLinea(archivo );
              Result:=s;
         end
         else
         begin
            Result:=null;

         end;

        end;

function Texto.fin(): boolean;
begin
  Result:=EOF(f);
end;

function Texto.copiar(): texto;
var s:string;
    auxF:Array[1..1024] of string;
    i,j:integer;
  copia:Texto;
begin
  i:=1;

 abrir();
 //mientras no leyo la ultima linea (no termino de leer todo el archivo)
 while(not fin())do


begin
  //Linea por linea
   s:=leerLinea();
   auxF[i]:=s;
   i:=i+1;

end;
cerrar();
copia:=Texto.crear('copia','txt'); //el archivo donde copiare
//copia.abrir();
for j:=1 to i do
begin
   copia.escribirLinea(auxF[j]);
end;

copia.cerrar();
Result:=copia;
end;

end.
