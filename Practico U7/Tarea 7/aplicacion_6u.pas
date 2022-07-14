unit Aplicacion_6U;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, dialogs;

 type

   { texto }

   texto=class
    private
     f:text;
     nom:string[60];
     ext:string[4];
     est:integer; //0:cerrado, 1:Escritura, 2:lectura

    public

      constructor create();

      procedure SetNom(n:string);
      function GetNom():string;
      procedure SetExt(m:string);
      function GetExt():string;

      procedure crear;
      procedure abrir();
      procedure escribir(c:char);
      procedure EscribirLn(ln:String);
      function leer():char;
      Function LeerLn():String;
      procedure cerrar();
      Function FinDeArchivo():Boolean;
      Function CopiarArchivoTXT():texto;
      procedure eliminarcopia(a:texto);
      function CopiarInvertido():texto;
      function GetLineaPos(n:integer):string;
      function GetCantLineas():integer;
      procedure renombrar(n:string);
      procedure InvertirPalabrasText();
      Function LeerLineaPos(n:integer):string;
      function Palabras(cad:string; n:integer):string;
      function ContPalabras(cad:string):integer;
      function palabrapos(cad:string; n:integer):integer;









   end;

implementation

{ texto }

constructor texto.create();
begin
  Nom:='texto';
  ext:='txt';
  est:=0;
end;

procedure texto.SetNom(n: string);
begin
   nom:=n;
end;

function texto.GetNom(): string;
begin
  Result:=nom;
end;

procedure texto.SetExt(m: string);
begin
   Ext:=m;
end;

function texto.GetExt(): string;
begin
  result:=ext;
end;

procedure texto.crear;
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

procedure texto.abrir();
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

procedure texto.escribir(c: char);
begin

 case est of
   1 : begin
        write(f,c);
       end;

   2 : Showmessage('Archivo txt en modo lectura');
   0 : Showmessage('El archivo txt esta cerrado');

 end;


end;

procedure texto.EscribirLn(ln: String);
begin
   case est of
   1 : begin
        writeln(f,ln);
       end;
   2 : Showmessage('Archivo txt en modo lectura');
   0 : Showmessage('El archivo txt esta cerrado');

 end;

end;

function texto.leer(): char;
var c:char;
begin
 c:=char(0);
   if est=2 then begin
    read(f,c);
    result:=c;
   end else begin
        result:=null
   end;

end;

function texto.LeerLn(): String;
var ln:string;
begin
 ln:='';
   if est=2 then begin
    readln(f,ln);
     result:=ln;
   end else begin
    result:=null;
   end;

end;

procedure texto.cerrar();
begin
 if est<>0 then begin
   close(f);
   est:=0;
 end else begin
   showmessage('Ya se encuentra cerrado');
 end;


end;

function texto.FinDeArchivo(): Boolean;
begin
   result:=EOF(f);
end;

function texto.CopiarArchivoTXT(): texto;
var cad:String;
     copia:texto;
begin
 copia:=texto.create;
 copia.SetNom('Copia');
 copia.SetExt('txt');

    self.abrir;
   while not FinDeArchivo do begin
      cad:=cad+self.leerln+#10#13;
   end;
  self.cerrar;

  copia.crear;
  copia.escribirln(cad);
  copia.cerrar;

  result:=copia;
end;

procedure texto.eliminarcopia(a:texto);
var cad:string;

begin
 {$I-}
   erase(a.f);
 {$I+}

end;

function texto.CopiarInvertido(): texto;
var cad:String;
     copia:texto;
     linea,dim:integer;
begin
 dim:=self.GetCantLineas;

 copia:=texto.create;
 copia.SetNom('Copia');
 copia.SetExt('txt');

    copia.crear;
    for linea:=dim downto 1 do begin
       cad:=self.GetLineaPos(linea);
       copia.escribirln(cad);
    end;
  copia.cerrar;

  result:=copia;

end;

function texto.GetLineaPos(n: integer): string;
var a:integer;
     cad:string;
begin
 a:=0;
    self.abrir;
   while not FinDeArchivo do begin
      a:=a+1;

      if a=n then begin
        cad:=self.leerln();
      end else begin
         self.leerLn;
      end;
   end;
   self.cerrar;

   result:=cad;
end;

function texto.GetCantLineas(): integer;
var a:integer;
begin
 a:=0;
    self.abrir;
   while not FinDeArchivo do begin
      a:=a+1;
      self.leerLn;
      end;
  self.cerrar;
   result:=a;

end;

procedure texto.renombrar(n:string);
var a:shortstring;
begin
 {$I-}
  rename(f,n+'.'+ext);
  self.Setnom(n);
 {$I+}
end;

procedure texto.InvertirPalabrasText();
var t:integer;
     cad:string;
     posi:integer;
     r:string;
     coso:integer;
     resultado:string;
begin
 t:=self.GetCantLineas;


       for posi:=1 to t do begin
          cad:=Self.LeerLineaPos(posi);
          r:='';
          for coso:=self.Contpalabras(cad) downto 1 do begin
             r:=r+palabras(cad,coso)+' ';
          end;
          resultado:=resultado+r+#13;
          SHOWMESSAGE(resultado);


       end;
     SELF.CREAR;
     self.EscribirLn(resultado);
     Self.Cerrar
end;

function texto.LeerLineaPos(n: integer): string;
var a:integer;
     cad:string;
     aux:char;
begin
 a:=0;
    self.abrir;
   while not FinDeArchivo do begin
      a:=a+1;

      if a=n then begin
         while not self.FinDeArchivo() do begin
          aux:=self.leer;
          if aux=#13 then begin
           break;
          end;
          cad:=cad+aux;

         end;
         break;
      end else begin
         self.leerLn;
      end;
   end;

  self.cerrar;
  result:=cad;


end;

function texto.Palabras(cad:string; n: integer): string;
var a,t,posi:integer;
     copiar:boolean;
     r:string;

begin
 a:=1;
 t:=length(cad);
 copiar:=false;
 posi:=self.palabrapos(cad,n);

 for posi:=self.palabrapos(cad,n) to t do begin
   if cad[posi]=' ' then begin
      break;
   end;

   r:=r+cad[posi];

 end;
 result:=r;


end;

function texto.ContPalabras(cad: string): integer;
var t,a,posi:integeR;
begin
 trim(cad);
 t:=length(cad);
 a:=1;

  for posi:=1 to t do begin
    if cad[posi]=' ' then begin
       a:=a+1;
    end;

  end;


  result:=a;
end;

function texto.palabrapos(cad:string; n:integer): integer;
var pos,t,pal,posi:integer;
begin
  pos:=1;
 t:=length(cad);
 pal:=1;
 trim(cad);
  for posi:=1 to t do begin
    pos:=pos+1;

   if cad[posi]=' ' then begin
    pal:=pal+1;

    if pal=n then begin
     break;
    end;

  end;



end;

  if n=1 then begin
   pos:=1;
  end;

  result:=pos;


end;


end.

