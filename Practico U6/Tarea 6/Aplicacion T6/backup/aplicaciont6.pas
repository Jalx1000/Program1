unit AplicacionT6;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, StdCtrls,Aplicacion_6U,cadenas;

type

  { TForm1 }

  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    Archivos: TMenuItem;
    Abrir: TMenuItem;
    Guardar: TMenuItem;
    GuardarComo: TMenuItem;
    Editar: TMenuItem;
    Memo1: TMemo;
    Encriptar: TMenuItem;
    Desencriptar: TMenuItem;
    OP: TOpenDialog;
    Salir: TMenuItem;
    N1: TMenuItem;
    Nuevo: TMenuItem;
    SD: TSaveDialog;
    procedure AbrirClick(Sender: TObject);
    procedure DesencriptarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GuardarClick(Sender: TObject);
    procedure GuardarComoClick(Sender: TObject);
    procedure EncriptarClick(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure NuevoClick(Sender: TObject);
    procedure SalirClick(Sender: TObject);
  private
    f:texto;
    c:cad;

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.NuevoClick(Sender: TObject);
var n:string;
begin
  n:=inputbox('Introduzca el nombre del archivo de texto: ','','');
  F.SetNom(n);
  F.SetExt('txt');
  memo1.clear;
  form1.Caption:=F.getNom+'.'+F.getExt;



end;


procedure TForm1.SalirClick(Sender: TObject);
begin


end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  f:=texto.create;
  c:=cad.create;

end;

procedure TForm1.GuardarClick(Sender: TObject);
 var pos:integer;
      ln:string;

begin
  F.crear;
  pos:=0;

  while pos<memo1.lines.count do begin
   ln:=memo1.lines.Strings[pos];
   F.Escribirln(ln);
   pos:=pos+1;


  end;
  f.cerrar;

end;

procedure TForm1.GuardarComoClick(Sender: TObject);
var pos, comienzaen:integer;
   nom,ext,nombrereal,ln:string;
begin
  if SD.Execute then begin
        nom:='';
   pos:=1;

   while (SD.filename[pos]<>'.') and (pos<=length(SD.filename)) do begin
     nom:=nom+SD.filename[pos];
     pos:=pos+1;
   end;

   C.Setcadenita(Nom);

   NombreReal:='';

   for comienzaEn:=C.BuscarInvertido('\')+1 to length(nom) do begin
     nombrereal:=nombrereal+nom[comienzaEn];

   end;



   ext:='';
   pos:=pos+1;

   while (SD.filename[pos]<>'.') and (pos<=length(SD.filename)) do begin
     Ext:=Ext+SD.filename[pos];
     pos:=pos+1;
   end;
     NombreReal:=trim(NombreReal);
     Ext:=Trim(ext);
    Caption:=NombreReal+'.'+ext;
    F.Setnom(nombreReal);
    F.setExt(ext);
     F.crear;
  pos:=0;

  while pos<memo1.lines.count do begin
   ln:=memo1.lines.Strings[pos];
   F.Escribirln(ln);
   pos:=pos+1;


  end;
  f.cerrar;


  end;
end;

procedure TForm1.EncriptarClick(Sender: TObject);
var r,r2:string;
    ln:string;

begin
  c:=cad.create;       //Para este programa se usa la base de archivos texto, y para hacer los procedimientos la clase cadenas.
   F.abrir;
  while not f.findearchivo do begin
    ln:=F.leerln();
    C.setcadenita(ln);
    C.invertir;
    r:=r+C.getCadenita+' ';
   r:=r+#13#10;
   r:=trim(r);
  end;
  f.cerrar;
  f.crear;
  f.escribirln(r);
  f.cerrar;

    F.abrir;
  while not f.findearchivo do begin
    ln:=F.leerln();

    C.setcadenita(ln);
    C.encriptar;

    if c.getcadenita=#13#10 then begin

    end else begin
       r2:=r2+C.getCadenita+' ';

      r2:=r2+#13#10;
    end;


  end;
  r:=trim(r2);
  f.cerrar;
  f.crear;
   F.escribirln(r2);
 f.cerrar;




 memo1.clear;
 F.abrir;
    While not f.findearchivo do begin
     ln:=f.leerln();
     memo1.lines.add(ln);
    end;
   F.cerrar;

end;

procedure TForm1.Memo1Change(Sender: TObject);
begin

end;


procedure TForm1.AbrirClick(Sender: TObject);
var ln,nom,ext,nombrereal:string;
     pos:integer;
     ComienzaEn:integeR;
begin
 if OP.execute then begin
   nom:='';
   pos:=1;
   F:=texto.create;
   C:=cad.Create;
   Memo1.Clear;

   while (OP.filename[pos]<>'.') and (pos<=length(op.filename)) do begin
     nom:=nom+Op.filename[pos];
     pos:=pos+1;
   end;

   C.Setcadenita(Nom);

   NombreReal:='';

   for comienzaEn:=C.BuscarInvertido('\')+1 to length(nom) do begin
     nombrereal:=nombrereal+nom[comienzaEn];

   end;



   ext:='';
   pos:=pos+1;

   while (OP.filename[pos]<>'.') and (pos<=length(op.filename)) do begin
     Ext:=Ext+Op.filename[pos];
     pos:=pos+1;
   end;


     NombreReal:=trim(NombreReal);
     Ext:=Trim(ext);
    Caption:=NombreReal+'.'+ext;
    F.Setnom(nombreReal);
    F.setExt(ext);
    F.abrir();

     While not f.findearchivo do begin
     ln:=f.leerln();
     memo1.lines.add(ln);
     end;

   f.cerrar();



 end;

end;

procedure TForm1.DesencriptarClick(Sender: TObject);
var r,r2:string;
    ln:string;

begin
  c:=cad.create;
   F.abrir;
  while not f.findearchivo do begin
    ln:=F.leerln();
    C.setcadenita(ln);
    C.invertir;
    r:=r+C.getCadenita+' ';
   r:=r+#13#10;
   trim(r);
  end;
  f.cerrar;
  f.crear;
  f.escribirln(r);
  f.cerrar;

    F.abrir;
  while not f.findearchivo do begin
    ln:=F.leerln();

    C.setcadenita(ln);
    C.desencriptar;
    r2:=r2+C.getCadenita+' ';

   r2:=r2+#13#10;
  end;
  trim(r2);
  f.cerrar;
  f.crear;
   F.escribirln(r2);
 f.cerrar;




 memo1.clear;
 F.abrir;
    While not f.findearchivo do begin
     ln:=f.leerln();
     memo1.lines.add(ln);
    end;
   F.cerrar;

end;



end.

