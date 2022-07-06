unit unitFormArchivosTexto;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus,
  UArchivoTexto;

type

  { TForm1 }

  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    ToggleBox1: TToggleBox;
    procedure FormCreate(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure ToggleBox1Change(Sender: TObject);
  private
    at:texto;
    at2:Texto;
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  at:=Texto.crear('ArchivoPorDefecto','txt');
  at.cerrar();
end;

procedure TForm1.MenuItem1Click(Sender: TObject);
begin

end;

procedure TForm1.MenuItem2Click(Sender: TObject);
begin
     at2:=at.copiar();
     ShowMessage('Copiado exitosamente'+at2.getNombreCompleto());
end;

procedure TForm1.MenuItem3Click(Sender: TObject);
begin
  at2.eliminar();
end;

procedure TForm1.MenuItem4Click(Sender: TObject);
begin
  at.setNombre('hola');
end;

procedure TForm1.ToggleBox1Change(Sender: TObject);
var s:string;
begin
  s:=InputBox('Introduzca el nombre del archivo','','');
  at:=Texto.crear(s,'txt');
  at.cerrar();
end;

end.

