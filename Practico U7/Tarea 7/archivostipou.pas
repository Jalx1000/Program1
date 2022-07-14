unit Archivostipou;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,dialogs, Aplicacion_6U;

 type

   { Alumno }

   Alumno=Record
   CI:INTEGEr;
   Registro:Integer;
   nombre:string[120];
   app:string[120];
   Domicilio:string[100];
   genero:char;
   INF110:integer;
   LIN100:INTEGER;
   MAT101:INTEGER;
   FIS101:INTEGER;
   INF119:Integer;

  end;


   { tipo }

   tipo=class
     private
       f:file of Alumno;
       nom:string[120];
       Est:integer; //0:cerrado, 1:Escritura, 2:lectura

     public
       constructor create;
       procedure setnom(n:string);
       function getnom():string;
       procedure crear();
       procedure abrir();
       procedure escribir(reg:alumno);
       procedure leer(var reg:alumno);
       procedure cerrar;
       function FinDeArchivo():boolean;
       procedure cargar();
       procedure mostrar();
       procedure posicionar(pos:integer);
       function posicion():integeR;
       function NumeroRegistros():integer;
       function AccederRegistro(registro:integer):integer;
       procedure escribirAlumno(ci,registro:integer; Nombre,app,domicilio:string; genero:char; INF110,LIN100,MAT101,FIS101,INF119:Integer);
       procedure insertarAlumno(ci,registro:integer; Nombre,app,domicilio:string; genero:char; INF110,LIN100,MAT101,FIS101,INF119:Integer);
       procedure SetDomicilio(n:integer; m:string);
       Procedure establecerDomicilio(n:integer; m:string);
       FUNCTION PromedioINF110():real;
       function Generartexto():texto;
       function getdim():integer;
       procedure ordenarpornombre();
       Function GetRecord(pos:integer):alumno;
       procedure Intercambiar(pos1,pos2:integer);
       procedure setrecord(pos:integer; r:alumno);
       procedure OrdenarPorRegistro();
       function EliminarUnRecordPorReg(Reg:integer):tipo;



   end;



implementation


{ tipo }

constructor tipo.create;
begin
  nom:='alumnos.dat';
  est:=0;
end;

procedure tipo.setnom(n: string);
begin
 nom:=n;
end;

function tipo.getnom(): string;
begin
  result:=nom
end;

procedure tipo.crear();
begin
   if est=0 then begin
  assign(f,nom);
  {$I-}
   rewrite(f);
  {$I+}
  if (IOResult<>0) then begin
   showmessage('Error al crear al archivo con tipo');
   exit;
  end;
    est:=1; //Modo escritura
 end else begin

 showmessage('El archivo con tipo se encuentra abierto');


 end;
end;

procedure tipo.abrir();
begin

    if est=0 then begin
  Assign(f,nom);
  {$I-}
   reset(f);
  {$I+}
  if (IOresult<>0) then begin
   showmessage('Error al abrir al archivo con tipo');
   exit;
  end;
    est:=2;  //Modo lectura
 end else begin

 showmessage('El archivo con tipo se encuentra abierto');
 end;

end;

procedure tipo.escribir(reg: alumno);
begin
   if est<>0 then begin
   write (f,reg);
   end else begin
    showmessage('Error al escribir, el archivo con tipo se encuentra cerrado');
   end;
end;

procedure tipo.leer(var reg: alumno);
begin
   if est<>0 then begin
   read (f,reg);
   end else begin
    showmessage('Error al leer, el archivo con tipo se encuentra cerrado');
   end;
end;

procedure tipo.cerrar;
begin
   close(f);
   est:=0;
end;

function tipo.FinDeArchivo(): boolean;
begin
     result:=eof(f);
end;

procedure tipo.cargar();
var n,i:integer;
reg:alumno;
begin
  self.crear;


  n:=strtoint(inputbox('Archivos con tipo','Cuantos alumnos: ',''));

  for i:=1 to n do begin
     reg.registro:=strtoint(inputbox('alumno: '+inttostr(i),'Registro : ',''));
     reg.CI:=strtoint(inputbox('alumno: '+inttostr(i),'Carnet de identidad: ',''));
     reg.nombre:=inputbox('alumno: '+inttostr(i),'nombres : ','');
     reg.app:=inputbox('alumno: '+inttostr(i),'apellidos : ','');
     reg.genero:=inputbox('alumno: '+inttostr(i),'genero : [H/M] ','')[1];
     reg.domicilio:=inputbox('alumno: '+inttostr(i),'Domicilio : ','');
     Reg.INF110:=strtoint(inputbox('alumno: '+inttostr(i),'Nota en INF110 : ',''));;
     Reg.LIN100:=strtoint(inputbox('alumno: '+inttostr(i),'Nota en LIN100 : ',''));;
     Reg.MAT101:=strtoint(inputbox('alumno: '+inttostr(i),'Nota en MAT101 : ',''));;
     Reg.FIS101:=strtoint(inputbox('alumno: '+inttostr(i),'Nota en FIS101 : ',''));;
     Reg.INF119:=strtoint(inputbox('alumno: '+inttostr(i),'Nota en INF119 : ',''));;


     self.escribir(reg);
  end;

  self.cerrar();



end;

procedure tipo.mostrar();
var reg:alumno;
     cad:string;
begin
  self.abrir;
  cad:='Los datos del archivo son: '+#13#10;

  while not findearchivo do begin
     leer(reg);
     cad:=cad+inttostr(reg.registro)+#09+inttostr(reg.ci)+#09+reg.nombre+#09+reg.app+#09+reg.domicilio+#09+reg.genero+#09+inttostr(reg.INF110)+#09+inttostr(reg.LIN100)+#09+inttostr(reg.MAT101)+#09+inttostr(reg.FIS101)+#09+inttostr(reg.INF119)+#13#10;


  end;
  self.cerrar;

  showmessage(cad);


end;

procedure tipo.posicionar(pos: integer);
begin
  If (pos>=0) and (pos<=filesize(f)) then begin
   seek(f,pos);

  end else begin
     showmessage('Posicion fuera de rango');
  end;

end;

function tipo.posicion(): integeR;
begin
  result:=filepos(f);
end;

function tipo.NumeroRegistros(): integer;
begin
   result:=filesize(f);
end;

function tipo.AccederRegistro(registro: integer): integer;
var r:alumno;
     posi,a:integeR;
begin
  a:=0;
  posi:=0;
   self.posicionar(0);
  while not findearchivo do begin
     leer(r);
     a:=a+1;
     if registro=r.registro then begin
        Posi:=a;
     end;

   end;

   if posi=0 then begin
      posi:=1;
   end;

  result:=posi-1;


end;

procedure tipo.escribirAlumno(ci, registro: integer; Nombre, app,
  domicilio: string; genero: char; INF110, LIN100, MAT101, FIS101,
  INF119: Integer);
var reg:alumno;
begin
      reg.registro:=Registro;
     reg.CI:=CI;
     reg.nombre:=Nombre;
     reg.app:=app;
     reg.genero:=genero;
     reg.domicilio:=domicilio;
     Reg.INF110:=INF110;
     Reg.LIN100:=LIN100;
     Reg.MAT101:=MAT101;
     Reg.FIS101:=FIS101;
     Reg.INF119:=INF119;

     ESCRIBIR(reg);

end;

procedure tipo.insertarAlumno(ci, registro: integer; Nombre, app,
  domicilio: string; genero: char; INF110, LIN100, MAT101, FIS101,
  INF119: Integer);
var reg:alumno;
begin

  while not findearchivo do begin
     leer(reg);
  end;

  escribiralumno(ci, registro, Nombre, app,
  domicilio, genero, INF110, LIN100, MAT101, FIS101,
  INF119);



end;

procedure tipo.SetDomicilio(n:integer; m: string);
var pos,a:integer;
    r:alumno;
    Rnuevo:alumno;
begin
 pos:=self.AccederRegistro(n);
    self.posicionar(0);
  showmessage(inttostr(pos));

    a:=0;
 while not findearchivo do begin
    leer(r);
    a:=a+1;
     SHOWMESSAGE(R.domicilio);
    if (a-1)=pos then begin
     r.domicilio:=m;
     SHOWMESSAGE(r.domicilio);
    end;



 end;
     ESCRIBIR(r);
   self.posicionar(0);




end;


procedure tipo.establecerDomicilio(n: integer; m: string);
var pos,a:integer;
    r:alumno;
    Rnuevo:alumno;
begin
    pos:=self.AccederRegistro(n);
    self.posicionar(0);

 while not findearchivo do begin
      a:=a+1;
     leer(r);
  if a-1=pos then begin
     r.domicilio:=m;
  end;



 end;




end;

function tipo.PromedioINF110(): real;
var r:alumno;
     a:integer;
     promedio:real;
begin
   self.posicionar(0);
   a:=0;
 while not findearchivo do begin
    self.leer(r);
    a:=a+1;
    promedio:=promedio+r.INF110;

 end;
   self.posicionar(0);
  promedio:=promedio/a;
 result:=promedio;



end;

function tipo.Generartexto(): texto;
var r:alumno;
     at:texto;
     s:string;
begin
  at:=texto.create;
  at.setnom('AlumnosProgramacion');
  at.setext('txt');
  at.crear;
  while not findearchivo do begin
   self.leer(r);
   s:='C.I: '+inttostr(r.Ci)+', '+'Nombre: '+r.nombre+', '+'Domicilio: '+r.domicilio;
   at.escribirln(s);
  end;
  at.cerrar;


  result:=at;



end;

function tipo.getdim(): integer;
var r:alumno;
     c:integer;
begin
  c:=0;
  self.posicionar(0);
  while not findearchivo do begin
   self.leer(r);
   c:=c+1;


  end;

  result:=c;


end;

procedure tipo.ordenarpornombre();
var i,j:integer;
     alumnoj,alumnoi:alumno;
     d:integer;
begin
  d:=getdim;
  for i:=0 to d-1 do begin
    for j:=i+1 to d-1 do begin
      alumnoj:=getrecord(j);
      alumnoi:=getrecord(i);

        if alumnoj.nombre<alumnoi.nombre then begin
           intercambiar(i,j);

        end;
    end;
  end;
end;

function tipo.GetRecord(pos: integer): alumno;
var r:alumno;
begin
  seek(f,pos);
  leer(r);
  result:=r;
end;

procedure tipo.Intercambiar(pos1, pos2: integer);
  var ara,arb,x:alumno;
begin
  x:=getrecord(pos1);
  setrecord(pos1,getrecord(pos2));
  setrecord(pos2,x);


end;

procedure tipo.setrecord(pos: integer; r: alumno);
begin
  seek(f,pos);
  escribir(r);
end;

procedure tipo.OrdenarPorRegistro();
  var i,j:integer;
       alumnoj,alumnoi:alumno;
       d:integer;
  begin
    d:=getdim;
    for i:=0 to d-1 do begin
      for j:=i+1 to d-1 do begin
        alumnoj:=getrecord(j);
        alumnoi:=getrecord(i);

          if alumnoj.registro<alumnoi.registro then begin
             intercambiar(i,j);

          end;
      end;
    end;
end;

function tipo.EliminarUnRecordPorReg(Reg: integer):tipo;
var r:alumno;
     abx:tipo;

begin
  abx:=tipo.create;
  abx.setnom('otros.dat');
  abx.crear;
  abx.posicionar(0);
  while not findearchivo do begin
      abx.leer(r);
      if r.registro<>reg then begin
          abx.escribir(r);
      end;
  end;
  abx.cerrar;
  cerrar;


  result:=abx;

end;


end.

