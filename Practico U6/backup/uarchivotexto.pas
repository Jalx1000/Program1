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
      function getNombreCompleto():string;
      function getExt():string;
      function leerLinea():string;
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
     modo:=0; //escritura

end;

procedure Texto.abrir;
begin
  Assign(f,getNombreCompleto());
  {$I-}
    reset(f);
  {$I+}
  if (IOResult<>0)then begin
    Writeln('ERROR AL LEER/ABRIR ARCHIVO DE TEXTO: '+getNombreCompleto());
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
  end;
    Result:null;
end;

end.

