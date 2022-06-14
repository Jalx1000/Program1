unit FormVectoresUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Grids, Menus,
  VectorUnit;

type

  { TForm1 }

  TForm1 = class(TForm)
    Edit1: TEdit;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    Mostrar: TButton;
    Cargar: TButton;
    StringGrid1: TStringGrid;
    procedure CargarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MostrarClick(Sender: TObject);
  private

  public
     v:vector;
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.CargarClick(Sender: TObject);
begin
 v.cargarElem();
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  v:=vector.crear;
end;

procedure TForm1.MenuItem2Click(Sender: TObject);
begin
  Edit1.Text:=IntToStr(v.corteControlC());
end;

procedure TForm1.MenuItem4Click(Sender: TObject);
begin
  Edit1.Text:=IntToStr(v.frecuenciaCC());
end;

procedure TForm1.MenuItem5Click(Sender: TObject);
var a,b:vector;
begin
  v:=vector.Create;
  a:=vector.Create;
  b:=vector.Create;
  a.cargarElem();
  b.cargarElem();
  v.fusionAcendente(a,b);
end;

procedure TForm1.MostrarClick(Sender: TObject);
var dim,i:integer;
begin
 dim:=v.getDim();
 StringGrid1.ColCount:=dim;
 for i:=1 to dim do
 begin
   StringGrid1.cells[i-1,0]:=IntToStr(v.getElem(i));
 end;
end;

end.

