unit FormMatrices;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Grids, StdCtrls,
  UMatrices;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure descargar;
    procedure descargar2;
  public
	  m:Matriz;
    m2:Matriz;
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }


procedure TForm1.Button1Click(Sender: TObject);
begin
  m:=Matriz.crear();
  m.cargar();
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  descargar();
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  m2:=Matriz.crear();
  m2.cargar();
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  descargar2();
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  m.suma(m2);
  descargar();
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  m.multiplicacion(m2);
  descargar();
end;

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.descargar;
var i,j,f,c:integer;
begin
  f:=m.getFilas();
  c:=m.getCols();
  StringGrid1.RowCount:=f;
  StringGrid1.ColCount:=c;
  for i:=1 to f do begin
    for j:=1 to c do begin
      StringGrid1.Cells[j-1,i-1]:=IntToStr(m.getElem(i,j));
    end;
  end;
end;

procedure TForm1.descargar2;
var i,j,f,c:integer;
begin
  f:=m2.getFilas();
  c:=m2.getCols();
  StringGrid2.RowCount:=f;
  StringGrid2.ColCount:=c;
  for i:=1 to f do begin
    for j:=1 to c do begin
      StringGrid2.Cells[j-1,i-1]:=IntToStr(m2.getElem(i,j));
    end;
  end;
end;

end.

