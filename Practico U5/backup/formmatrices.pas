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
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Edit1: TEdit;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
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

procedure TForm1.Button10Click(Sender: TObject);
var a:integer;
begin
  a:=StrToInt(InputBox('Introduzca la fila a sumar','',''));
  Edit1.Text:=IntToStr(m.sumaFil(a));
end;

procedure TForm1.Button11Click(Sender: TObject);
var a,b:integer;
begin
  a:=StrToInt(InputBox('Quieres promedio de 1:=Matriz ; 2:=Fila ; 3:=Columna','','') );
  if(a=1)then begin
    Edit1.Text:=FloatToStr(m.promedioMatriz());;
  end else if (a=2) then begin
    b:=StrToInt(InputBox('Introduzca la fila','',''));
	  Edit1.Text:=FloatToStr(m.promediFila(b));
  end else if (a=3) then begin
    b:=StrToInt(InputBox('Introduzca la columna','',''));
	  Edit1.Text:=FloatToStr(m.promediFila(b));
  end else
  		ShowMessage('Parametro Incorrecto');
end;

procedure TForm1.Button12Click(Sender: TObject);
var a:integer;
begin
  a:=StrToInt(InputBox('Introducir el numero a buscar','',''));
  m.buscarRepetitivo(a);
end;

procedure TForm1.Button13Click(Sender: TObject);
begin
  m.cargarMatrizVector(m2);
end;

procedure TForm1.Button14Click(Sender: TObject);
begin
  m.invertir();
  m.MTranspuesta();
  descargar();
end;

procedure TForm1.Button15Click(Sender: TObject);
begin
  m.invertir();
  descargar();
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

procedure TForm1.Button7Click(Sender: TObject);
var a:real;
begin
  a:=m.promedioTID();
  Edit1.Text:=floattostr(a);
end;

procedure TForm1.Button8Click(Sender: TObject);
var a:real;
begin
		 a:=m.promedioTSI();
     edit1.Text:=floattostr(a);
end;

procedure TForm1.Button9Click(Sender: TObject);
var a:integer;
begin
  a:=StrToInt(InputBox('Introduzca columna a sumar','',''));
  Edit1.text:=IntToStr(m.sumaCol(a));
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

