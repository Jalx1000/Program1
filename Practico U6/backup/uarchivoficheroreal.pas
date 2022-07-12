unit UArchivoFicheroReal;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;
type
  ArchivoReal=class;
  private
      f:file of real;
      nom,ext:string;
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
      procedure eliminar();
  end;

implementation

end.

