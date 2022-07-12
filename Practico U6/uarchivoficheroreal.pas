unit UArchivoFicheroReal;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;
type

  { ArchivoReal }

  ArchivoReal=class
      f:file of Real;
      nom,ext:string;
  public
      constructor crear(nombre: string; extNueva: string);
      procedure abrir();
      procedure cerrar();
      procedure setNombre(nombre:string);
      procedure setExt(extensionNueva:string);
      procedure escribirReal(r:real);
      function getNombreCompleto():string;
      function getExt():string;
      function leerLinea():real;
      function fin():boolean;
      function copiar():texto;
      procedure eliminar();
  end;

implementation

{ ArchivoReal }

constructor ArchivoReal.crear(nombre: string; extNueva: string);
begin

end;

procedure ArchivoReal.abrir;
begin

end;

procedure ArchivoReal.cerrar;
begin

end;

procedure ArchivoReal.setNombre(nombre: string);
begin

end;

procedure ArchivoReal.setExt(extensionNueva: string);
begin

end;

procedure ArchivoReal.escribirReal(r: real);
begin

end;

function ArchivoReal.getNombreCompleto: string;
begin

end;

function ArchivoReal.getExt: string;
begin

end;

function ArchivoReal.leerLinea: real;
begin

end;

function ArchivoReal.fin: boolean;
begin

end;

function ArchivoReal.copiar: texto;
begin

end;

procedure ArchivoReal.eliminar;
begin

end;

end.

