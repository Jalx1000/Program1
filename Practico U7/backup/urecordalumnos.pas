unit URecordAlumnos;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;
type
  Alumnos=class
     ci:integer;
     registro:integer;
     nombre:string[50];
     sexo:char;
     domicilio:string[50];
     INF110,LIN110,MAT101,FIS101,INF119:Real;
  end;

implementation

end.

