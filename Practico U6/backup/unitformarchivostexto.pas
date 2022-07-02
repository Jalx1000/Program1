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
    ToggleBox1: TToggleBox;
    procedure FormCreate(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure ToggleBox1Change(Sender: TObject);
  private
    at:texto;
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
end;

procedure TForm1.MenuItem1Click(Sender: TObject);
begin

end;

procedure TForm1.MenuItem2Click(Sender: TObject);
var at2:Texto;
begin
     at2:=at.copiar();
     ShowMessage('Copiado exitosamente',at2.getNombreCompleto());
end;

procedure TForm1.ToggleBox1Change(Sender: TObject);
var s:string;
begin
  s:=InputBox('Introduzca el nombre del archivo','','');
  at.crear(s,'txt');
end;

end.

