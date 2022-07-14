unit Aplicacion_6;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus,
  Aplicacion_6U,ArchivoFicheroU,cadenas;

type

  { TForm1 }

  TForm1 = class(TForm)
    LeerTXT: TButton;
    EscribirTxt: TButton;
    Crear: TButton;
    MainMenu1: TMainMenu;
    Ejercicios: TMenuItem;
    Copiar: TMenuItem;
    EliminarCopia: TMenuItem;
    CopiaInvertido: TMenuItem;
    leer: TMenuItem;
    leercaracter: TMenuItem;
    Conjunto: TMenuItem;
    Memo1: TMemo;
    MenuItem1: TMenuItem;
    InvertirPalabras: TMenuItem;
    CopiarAFicheroReal: TMenuItem;
    MenuItem2: TMenuItem;
    MostrarFicheroReal: TMenuItem;
    Palabras: TMenuItem;
    Renombrar: TMenuItem;
    procedure ConjuntoClick(Sender: TObject);
    procedure CopiaInvertidoClick(Sender: TObject);
    procedure CopiarAFicheroRealClick(Sender: TObject);
    procedure CopiarClick(Sender: TObject);
    procedure CrearClick(Sender: TObject);
    procedure EliminarCopiaClick(Sender: TObject);
    procedure EscribirTxtClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure InvertirPalabrasClick(Sender: TObject);
    procedure leercaracterClick(Sender: TObject);
    procedure leerClick(Sender: TObject);
    procedure LeerTXTClick(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MostrarFicheroRealClick(Sender: TObject);
    procedure PalabrasClick(Sender: TObject);
    procedure RenombrarClick(Sender: TObject);
  private
    f:texto;
    f2:texto;
   archivoR:ArchivoReal;
   C:cad;

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.InvertirPalabrasClick(Sender: TObject);
begin
  f.InvertirPalabrasText;
end;

procedure TForm1.leercaracterClick(Sender: TObject);
var cad:string;
begin
 cad:='';
  F.abrir();

  while not f.FinDeArchivo() do begin
    cad:=cad+f.leer();

  end;
  showmessage('Los datos del txt son : '+cad);

  f.Cerrar;

end;

procedure TForm1.leerClick(Sender: TObject);
begin
  f.abrir;
  f.leer;
  f.cerrar;
end;

procedure TForm1.LeerTXTClick(Sender: TObject);
var cad:string;
begin
 cad:='';
  F.abrir();

  while not f.FinDeArchivo() do begin
    cad:=cad+f.leerln()+#10#13;

  end;
  showmessage('Los datos del txt son : '+#10#13+cad);

  f.Cerrar;

end;

procedure TForm1.MenuItem1Click(Sender: TObject);
begin
  f.palabrapos('hola a todos como estan todos',6);
end;

procedure TForm1.MenuItem2Click(Sender: TObject);
var c2:integer;
   s:string;
   INF1,inf2,inf4:INTEGER;
     inf3:string;
     a:integeR;
begin
  c2:=strtoint(inputbox('Escriba la informacion de la linea que desea ver','',''));
  a:=1;
  C:=cad.create;
  f.abrir;
  while not F.finDeArchivo do begin
    if c2=a then begin

       S:=f.leerln;
       C.SetCadenita(s);
         showmessage(s);
       INF1:=C.TotalCaracteres();
       INF2:=C.CantPalabritas();

       INF3:=C.LetraTermina();
       INF4:=C.NumDePalabrasTerminan(INF3);
       break;
    end;

    a:=a+1;

    f.leerln


  end;
  f.cerrar;


  showmessage('El total de caracteres de la linea es: '+Inttostr(inf1));
  showmessage('El total de palabras de la linea es: '+Inttostr(inf2));
  showmessage('La primera palabra termina en : '+inf3);
  showmessage('El total de palabras que terminan en la letra que termina la primera palabra es:'+Inttostr(inf4));


end;



procedure TForm1.MostrarFicheroRealClick(Sender: TObject);
var s:string;
begin

 s:=ArchivoR.Mostrardatos(5);
 memo1.text:=s;
end;

procedure TForm1.PalabrasClick(Sender: TObject);
var cad:string;
     n:integer;
begin
  cad:=inputbox('Introduzca la cadena','','');
  n:=strtoint(inputbox('introduzca la palabra a obtener','',''));
  f.palabras(cad,n);
end;

procedure TForm1.RenombrarClick(Sender: TObject);
var nuevonombre:string;
begin
  nuevonombre:=inputbox('Introduzca el nuevo nombre para el archivo','','');
  f.renombrar(nuevonombre);
end;

procedure TForm1.EscribirTxtClick(Sender: TObject);
begin
  F.crear;
  F.EscribirLN(Inputbox('Escriba el contenido del archivo','',''));

  F.cerrar;
end;

procedure TForm1.CrearClick(Sender: TObject);
begin
    F:=texto.create;
    F.SetNom(inputbox('Escriba un nombre para el archivo de texto','',''));
    F.SetExt('txt');
end;

procedure TForm1.EliminarCopiaClick(Sender: TObject);
begin
 f.eliminarcopia(f2);
end;

procedure TForm1.CopiarClick(Sender: TObject);
begin
  f2:=f.CopiarArchivoTXT();
end;

procedure TForm1.CopiaInvertidoClick(Sender: TObject);
begin
  f2:=f.CopiarInvertido();
end;

procedure TForm1.CopiarAFicheroRealClick(Sender: TObject);
begin
// archivor:=Archivoreal.create;
// Archivor.setNom('Numeros Reales');
 //Archivor.SetExt('dat');
 //ArchivoR.cerrar;

 ArchivoR:=f.LeerRealesArchivoFichero;


end;

procedure TForm1.ConjuntoClick(Sender: TObject);
var n:integer;
begin
  n:=strtoint(inputbox('introduzca que fila desea ver: ','',''));
  f.LeerLineaPos(n);
end;

end.

