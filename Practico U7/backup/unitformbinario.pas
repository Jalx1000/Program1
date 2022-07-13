unit UnitFormBinario;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, StdCtrls,
  UArchivoBinarioAlumnos;

type

  { TForm1 }

  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    Memo1: TMemo;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
  private
    fa:ArchivoBinarioAlumnos;
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.MenuItem2Click(Sender: TObject);
begin
  fa.abrir();
  fa.aCrearArchivoAlumnosBase();
  fa.cerrar();
end;

procedure TForm1.MenuItem3Click(Sender: TObject);
var reg:integer;
  s:string;
begin
  reg:=StrToInt(InputBox('Introducir numero de registro','',''));
  s:=fa.accederPorRegistro(reg);
  Memo1.Clear;
  Memo1.Append(s);
end;

procedure TForm1.MenuItem5Click(Sender: TObject);
var s:string;
begin
  s:=fa.mostrarDato(1);
  Memo1.Clear;
  Memo1.Append(s);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  fa:=ArchivoBinarioAlumnos.crear('Alumnos','dat');
  fa.cerrar();
end;

procedure TForm1.Memo1Change(Sender: TObject);
begin

end;

end.

