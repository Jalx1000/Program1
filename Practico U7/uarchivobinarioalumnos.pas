unit UArchivoBinarioAlumnos;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Dialogs, URecordAlumnos;
type

  { ArchivoBinarioAlumnos }

  ArchivoBinarioAlumnos=class
    private
      f:file of Alumno;
      nom,ext:string;
      modo:integer;
    public
      constructor crear(nombre: string; extNueva: string);
      procedure abrir();
      procedure cerrar();
      procedure setNombre(nombre:string);
      procedure setExt(extensionNueva:string);
      procedure escribirRecord(r:Alumno);
      procedure escribirAlumno(ci, registro: integer; nombre: string; sexo: char; domicilio: string; INF110, LIN100, MAT101, FIS101, INF119: real);
      function getNombreCompleto():string;
      function getExt():string;
      function leerRecord():Alumno ;
      function fin():boolean;
      procedure aCrearArchivoAlumnosBase();
      procedure eliminar();
      function mostrarDato(cantidadPorLinea:integer):string;
      function accederPorRegistro(reg:integer):Alumno;
      function mostrarAccederPorRegistro(reg:integer):String;
  end;
implementation

{ ArchivoBinarioAlumnos }

constructor ArchivoBinarioAlumnos.crear(nombre: string; extNueva: string);
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
         WriteLn('ERROR AL CREAR EL ARCHIVO DE ArchivoBinario :'+ getNombreCompleto());

    end;

    modo:=0 //LECTURA
end;

procedure ArchivoBinarioAlumnos.abrir();
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

procedure ArchivoBinarioAlumnos.cerrar();
begin
  close(f);
  modo:=0;
end;

procedure ArchivoBinarioAlumnos.setNombre(nombre: string);
begin
   nom:=nombre;
end;

procedure ArchivoBinarioAlumnos.setExt(extensionNueva: string);
begin
 ext:=extensionNueva;
end;

procedure ArchivoBinarioAlumnos.escribirRecord(r: Alumno);
begin
  write(f,r);
end;

procedure ArchivoBinarioAlumnos.escribirAlumno(ci, registro: integer; nombre: string; sexo: char; domicilio: string; INF110, LIN100, MAT101, FIS101, INF119: real);
var r: Alumno;
begin
  r.ci:=ci;
  r.registro := registro;
  r.nombre := nombre;
  r.sexo := sexo;
  r.domicilio := domicilio;
  r.INF110 := INF110;
  r.LIN100 := LIN100;
  r.MAT101 := MAT101;
  r.FIS101 := FIS101;
  r.INF119 := INF119;
  escribirRecord(r);
end;

function ArchivoBinarioAlumnos.getNombreCompleto(): string;
begin
   Result:=nom+'.'+ext;
end;

function ArchivoBinarioAlumnos.getExt(): string;
begin
   Result:=ext;
end;



function ArchivoBinarioAlumnos.leerRecord(): Alumno;
  var r:Alumno;
  begin
         if(modo=1)then
         begin
              read(f,r); //s:=leerRecord(archivo );
              Result:=r;
         end
         else
         begin
            Result:=r;
         end;
        end;

function ArchivoBinarioAlumnos.fin(): boolean;
begin
  Result:=EOF(f);
end;

procedure ArchivoBinarioAlumnos.aCrearArchivoAlumnosBase;
//var r:Alumno;
begin
  escribirAlumno(111,202001,'Alumno01','H','Av. Busch',70 ,80 , 50, 20, 80);
  escribirAlumno(222,202002,'Alumno02','H','Av. Centenario',80, 50, 100, 30, 90);
  escribirAlumno(333,202003,'Alumno03','H','Av. Santos Dumont',50, 90, 80, 90, 70);
  escribirAlumno(444,202004,'Alumno04','M','Av. Lujan',90, 80, 80, 70, 60);


end;

procedure ArchivoBinarioAlumnos.eliminar;
begin
  Assign(f,getNombreCompleto());
  Erase(f);
end;

function ArchivoBinarioAlumnos.mostrarDato(cantidadPorLinea: integer): string;
var s:string;
  	r:Alumno;
    c:integer;
begin
  c:=0;
  s:=' CI, Reg, Nombre, Domicilio, notas: INF110, LIN100, MAT101, FIS101, INF119'+Chr(10)+Chr(13);
  abrir();
  while (not fin()) do
  begin
     s:=s+Chr(10)+Chr(13);
     r:=leerRecord();
     s:=s+IntToStr(r.ci)+'-';
     s:=s+IntToStr(r.registro)+'-';
     s:=s+r.nombre+'-';
     s:=s+r.sexo+'-';
     s:=s+r.domicilio+'-';
     s:=s+FloatToStr(r.INF110)+'-';
     s:=s+FloatToStr(r.LIN100)+'-';
     s:=s+FloatToStr(r.MAT101)+'-';
     s:=s+FloatToStr(r.FIS101)+'-';
     s:=s+FloatToStr(r.INF119);
     c:=c+1;
     if(c=cantidadPorLinea)then begin
          s:=s+Chr(10)+Chr(13);
          c:=0;
     end;

  end;
  cerrar();
  Result:=s;
end;

function ArchivoBinarioAlumnos.accederPorRegistro(reg: integer): Alumno;
var rActual,rRes,r:Alumno;
begin
  abrir();
  while (not fin) do begin
     rActual:=leerRecord();
     if(reg=rActual.registro) then begin
		   rRes:=rActual;
     end;
  end;
  cerrar();
  Result:=rRes;
end;

function ArchivoBinarioAlumnos.mostrarAccederPorRegistro(reg: integer): String;
var r:Alumno;
s:string;
begin
  r:=accederPorRegistro(reg);
	s:=' CI, Reg, Nombre, Domicilio, notas: INF110, LIN100, MAT101, FIS101, INF119'+Chr(10)+Chr(13);
  s:=s+Chr(10)+Chr(13);
  s:=s+IntToStr(r.ci)+'-';
  s:=s+IntToStr(r.registro)+'-';
  s:=s+r.nombre+'-';
  s:=s+r.sexo+'-';
  s:=s+r.domicilio+'-';
  s:=s+FloatToStr(r.INF110)+'-';
  s:=s+FloatToStr(r.LIN100)+'-';
  s:=s+FloatToStr(r.MAT101)+'-';
  s:=s+FloatToStr(r.FIS101)+'-';
  s:=s+FloatToStr(r.INF119);
     Result:=s;
end;

end.


