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
      constructor crear(nombre,extNuevo:string);
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

constructor Texto.crear(nombre, extNuevo: string);
begin
     nom:=nombre;
     ext:=extNuevo;
     modo:=3;
     Assign(f,getNombreCompleto());
     {$I-}
       Rewrite(f); //rewrite := si existe un nombre con el mismo archivo lo
                   //sobreescribe(no debe estar abierto)
                   //si no existe lo crea
     {$I+}
     if(IOResult<>0)then begin
       writeln('Error al crear el archivo de texto: '+getNombreCompleto());
     end;
     modo:=0; //lectura
end;

procedure Texto.abrir;
begin
  Assign(f,getNombreCompleto());
  {$I-}
    reset(f);
  {$I+}
  if (IOResult<>0)then begin
    Writeln('ERROR AL LEER/ABRIR ARCHIVO DE TEXTO: '+getNombreCompleto());
    Exit;
  end;
  modo:=1; //modo:=1 siginifica lectura y modo:0 siginifica escritura
end;

procedure Texto.cerrar;
begin
  close(f);
  modo:=0;
end;

procedure Texto.setNombre(nombre: string);
begin

end;

procedure Texto.setExt(extensionNueva: string);
begin

end;

procedure Texto.escribirLinea(lin: string);
begin
  writeln(f,lin);
end;

function Texto.getNombreCompleto: string;
begin
  Result:=nom+'.'+ext;
end;

function Texto.getExt: string;
begin

end;

function Texto.leerLinea: string;
var s:string;
begin
  if (modo=1) then begin
    readln(f,s);  //LeerLinea(archivo)
    Result:=s;
  end else begin
    Result:=null;
  end;
end;

function Texto.fin: boolean;
begin
  Result:=EOF(f);
end;

function Texto.copiar: texto;
var s:string;
  auxF:Array [1..1024] of string;
  copia:Texto;
  i,j:integer;
begin
  //abrir();
  //mientras no leyo la ultima linea(no termino de  leer todo el documento)
  i:=1;
  while (not fin()) do begin
    //iremos linaea por lineal
    s:=leerLinea();
    auxF[i]:=s;
    i:=i+1;
  end;
  cerrar();
  copia:=Texto.crear('Copia','txt');//creamos el archivo donde se var a copiar
  //copia.abrir();
  for j:=1 to i do begin
    copia.escribirLinea(auxF[j]);
  end;
  copia.cerrar();
  Result:=copia;
end;

end.

