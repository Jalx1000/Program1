unit unitProyecto01;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus,PracticoU01Unit;

type

  { TForm1 }

  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
    procedure MenuItem8Click(Sender: TObject);
    procedure MenuItem9Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  objetoPractico:PracticoU1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
     objetoPractico:=PracticoU1.Create();
end;
procedure TForm1.MenuItem1Click(Sender: TObject);
begin

end;
procedure TForm1.MenuItem2Click(Sender: TObject);
var
  entrada:String;
begin
     entrada:=InputBox('Introducir numero: ','','');
     objetoPractico.ejercicio1(StrToInt(entrada));
end;
procedure TForm1.MenuItem3Click(Sender: TObject);
var entrada:String;
begin
     entrada:=InputBox('Introducir numero: ','','');
     objetoPractico.ejercicio2(StrToInt(entrada));
end;
procedure TForm1.MenuItem4Click(Sender: TObject);
var entrada:String;
begin
     entrada:=InputBox('Introducir numero: ','','');
     objetoPractico.ejercicio3(StrToInt(entrada));
end;

procedure TForm1.MenuItem5Click(Sender: TObject);
var entrada:String;
begin
     entrada:=InputBox('Introducir numero: ','','');
     objetoPractico.ejercicio4(StrToInt(entrada));
end;

procedure TForm1.MenuItem6Click(Sender: TObject);
var entrada1,entrada2:String;
    r:integer;
begin
     entrada1:=InputBox('Introducir numero: ','','');
     entrada2:=InputBox('Introducir otro numero: ','','');
     r:=objetoPractico.ejercicio5(StrToInt(entrada1),StrToInt(entrada2));
     ShowMessage(IntToStr(r));
end;

procedure TForm1.MenuItem7Click(Sender: TObject);
var entrada1,entrada2:String;
    r:integer;
begin
     entrada1:=InputBox('Introducir numero: ','','');
     entrada2:=InputBox('Introducir otro numero: ','','');
     r:=objetoPractico.ejercicio6(StrToInt(entrada1),StrToInt(entrada2));
     ShowMessage(IntToStr(r));
end;

procedure TForm1.MenuItem8Click(Sender: TObject);
var entrada1,entrada2:String;
    r:integer;
begin
     entrada1:=InputBox('Introducir numero: ','','');
     entrada2:=InputBox('Introducir otro numero: ','','');
     r:=objetoPractico.ejercicio5(StrToInt(entrada1),StrToInt(entrada2));
     ShowMessage(entrada1+' * '+entrada2+' = '+IntToStr(r));
end;

procedure TForm1.MenuItem9Click(Sender: TObject);
var entrada1,entrada2:String;
    r:integer;
begin
     entrada1:=InputBox('Introducir numero: ','','');
     entrada2:=InputBox('Introducir otro numero: ','','');
     r:=objetoPractico.ejercicio6(StrToInt(entrada1),StrToInt(entrada2));
     ShowMessage(entrada1+' / '+entrada2+' = '+IntToStr(r));
end;

end.

