unit ArchivoFicheroU;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,dialogs;

 type

   { ArchivoReal }


   ArchivoReal=class

    private
     f:file of real;
     nom:String;
     ext:string;
     est:integer;

     public
     constructor create();

      procedure SetNom(n:string);
      function GetNom():string;
      procedure SetExt(m:string);
      function GetExt():string;

      procedure crear;
      procedure abrir();
      procedure EscribirRealLN(r:real);
      Function LeerReal():real;
      procedure cerrar();
      Function FinDeArchivo():Boolean;
      Function MostrarDatos(CantidadPorLinea:integer):string;







   end;



implementation

{ ArchivoReal }

constructor ArchivoReal.create();
begin
    Nom:='texto';
  ext:='dat';
  est:=0;
end;

procedure ArchivoReal.SetNom(n: string);
begin
     nom:=n;
end;

function ArchivoReal.GetNom(): string;
begin
  result:=nom;
end;

procedure ArchivoReal.SetExt(m: string);
begin
   Ext:=m;
end;

function ArchivoReal.GetExt(): string;
begin
  result:=ext;
end;

procedure ArchivoReal.crear;
begin
    if est=0 then begin
  assign(f,nom+'.'+ext);
  {$I-}
   rewrite(f);
  {$I+}
  if (IOResult<>0) then begin
   showmessage('Error al crear al archivo txt');
   exit;
  end;
    est:=1; //Modo escritura
 end else begin

 showmessage('El archivo txt se encuentra abierto');


 end;
end;

procedure ArchivoReal.abrir();
begin

      if est=0 then begin
  Assign(f,nom+'.'+ext);
  {$I-}
   reset(f);
  {$I+}
  if (IOresult<>0) then begin
   showmessage('Error al abrir al archivo txt');
   exit;
  end;
    est:=2;  //Modo lectura
 end else begin

 showmessage('El archivo txt se encuentra abierto');
 end;
end;

procedure ArchivoReal.EscribirRealLN(r: real);
begin
      case est of
   1 : begin
        write(f,r);
       end;
   2 : Showmessage('Archivo txt en modo lectura');
   0 : Showmessage('El archivo txt esta cerrado');

 end;
end;

function ArchivoReal.LeerReal(): real;
var ln:real;
begin
   if est=2 then begin
    read(f,ln);
     result:=ln;
   end else begin
    result:=null;
   end;
end;

procedure ArchivoReal.cerrar();
begin
      if est<>0 then begin
   close(f);
   est:=0;
 end else begin
   showmessage('Ya se encuentra cerrado');
 end;
end;


function ArchivoReal.FinDeArchivo(): Boolean;
begin
     result:=EOF(f);
end;

function ArchivoReal.MostrarDatos(CantidadPorLinea: integer): string;
VAR s:string;
     c:integer;
     r:real;
begin
   c:=0;
   self.abrir;
   while not self.findearchivo do begin
       r:=self.leerReal;
       s:=s+floattostr(r)+'│';
       c:=c+1;
      if c=cantidadporlinea then begin
          s:=s+chr(10);
      end;
   end;
   self.cerrar;
   result:=s;


end;

end.

