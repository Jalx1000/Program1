unit UArchivoTexto;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;
type

  { Texto }

  Texto=class
    private
      f:text;
      nom,ext:string;
      modo:integer;
    public
      constructor crear(nombre,extNuevo:string);
      procedure setNombre(nombre:string);
      procedure setExt(extensionNueva:string);
      function getNombreCompleto():string;
      function getExt():string;
  end;

implementation

{ Texto }

constructor Texto.crear(nombre, extNuevo: string);
begin
     nom:=nombre;
     ext:=extNuevo;
     modo:=3;
     Assign(f,nom);
     {$I-}
       Rewrite(f); //rewrite := si existe un nombre con el mismo archivo lo
                   //sobreescribe(no debe estar abierto)
                   //si no existe lo crea
     {$I+}
     if(IOResult<>0)then begin
       writelb('Error al crear el archivo de texto: '+getNombreCompleto());
     end;
     modo:=0; //escritura

end;

procedure Texto.setNombre(nombre: string);
begin

end;

procedure Texto.setExt(extensionNueva: string);
begin

end;

function Texto.getNombreCompleto: string;
begin

end;

function Texto.getExt: string;
begin

end;

end.

