unit Matricess;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Grids, Menus,
  matricesU;

type

  { TForm1 }

  TForm1 = class(TForm)
    FijarElem1: TButton;
    FijarColumna1: TButton;
    FijarFilas1: TButton;
    Crear1: TButton;
    Colum1: TEdit;
    Crear: TButton;
    Elem1: TEdit;
    FijarFilas: TButton;
    FijarColumna: TButton;
    FijarElem: TButton;
    Fila1: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    MainMenu1: TMainMenu;
    Ejercicios: TMenuItem;
    Ej6: TMenuItem;
    ContadorTID: TMenuItem;
    BuscarRep: TMenuItem;
    CargarMatriz: TMenuItem;
    InvertirFilas: TMenuItem;
    Determinante2x2: TMenuItem;
    Determinante3x3: TMenuItem;
    OrdenarMatriz: TMenuItem;
    Transpuesta: TMenuItem;
    Restar: TMenuItem;
    ModaTID: TMenuItem;
    ModaTSI: TMenuItem;
    VecesRepetidoTSI: TMenuItem;
    PromedioDeMatriz: TMenuItem;
    SumarFilas: TMenuItem;
    SumarColumna: TMenuItem;
    MulitplicarMatriz1: TMenuItem;
    SumarMatriz1: TMenuItem;
    PromedioDS: TMenuItem;
    PromedioDP: TMenuItem;
    PromedioTII: TMenuItem;
    PromedioTDS: TMenuItem;
    PromedioTSI: TMenuItem;
    PromedioTID: TMenuItem;
    Fila: TEdit;
    Colum: TEdit;
    Elem: TEdit;
    Label1: TLabel;
    MatrizBox: TStringGrid;
    MatrizBox1: TStringGrid;
    procedure BuscarRepClick(Sender: TObject);
    procedure CargarMatrizClick(Sender: TObject);
    procedure ContadorTIDClick(Sender: TObject);
    procedure Crear1Click(Sender: TObject);
    procedure CrearClick(Sender: TObject);
    procedure Determinante2x2Click(Sender: TObject);
    procedure Determinante3x3Click(Sender: TObject);
    procedure Ej6Click(Sender: TObject);
    procedure FijarColumna1Click(Sender: TObject);
    procedure FijarColumnaClick(Sender: TObject);
    procedure FijarElem1Click(Sender: TObject);
    procedure FijarElemClick(Sender: TObject);
    procedure FijarFilas1Click(Sender: TObject);
    procedure FijarFilasClick(Sender: TObject);
    procedure FilaChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure InvertirFilasClick(Sender: TObject);
    procedure ModaTIDClick(Sender: TObject);
    procedure ModaTSIClick(Sender: TObject);
    procedure MulitplicarMatriz1Click(Sender: TObject);
    procedure OrdenarMatrizClick(Sender: TObject);
    procedure PromedioDeMatrizClick(Sender: TObject);
    procedure PromedioDSClick(Sender: TObject);
    procedure PromedioDPClick(Sender: TObject);
    procedure PromedioTDSClick(Sender: TObject);
    procedure PromedioTIDClick(Sender: TObject);
    procedure PromedioTIIClick(Sender: TObject);
    procedure PromedioTSIClick(Sender: TObject);
    procedure RestarClick(Sender: TObject);
    procedure SalirClick(Sender: TObject);
    procedure SubmatrizClick(Sender: TObject);
    procedure SumarColumnaClick(Sender: TObject);
    procedure SumarFilasClick(Sender: TObject);
    procedure SumarMatriz1Click(Sender: TObject);
    procedure TranspuestaClick(Sender: TObject);
    procedure VecesRepetidoTSIClick(Sender: TObject);
  private
   x:matriz;
   y:matriz;
   procedure updateMatrizBox();
   procedure updateMatrizBoxY();
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FilaChange(Sender: TObject);
begin

end;

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.InvertirFilasClick(Sender: TObject);
begin
  x.invertirNumeros();
  updateMatrizBox();
end;

procedure TForm1.ModaTIDClick(Sender: TObject);
begin
 showmessage(inttostr(x.ElementoModaTID));
end;

procedure TForm1.ModaTSIClick(Sender: TObject);
begin
  showmessage(inttostr(x.ElementoModaTSI));
end;

procedure TForm1.MulitplicarMatriz1Click(Sender: TObject);
begin
   x.MultiplicarMatrices(y);
   updateMatrizBox();
end;

procedure TForm1.OrdenarMatrizClick(Sender: TObject);
begin
  x.ordenarMatriz();
  updateMatrizBox();
end;

procedure TForm1.PromedioDeMatrizClick(Sender: TObject);
begin
 showmessage(floattostr(x.promedioMatriz));
end;

procedure TForm1.PromedioDSClick(Sender: TObject);
begin
  showmessage(floattostr(x.PromedioDS));
end;

procedure TForm1.PromedioDPClick(Sender: TObject);
begin
   showmessage(floattostr(x.PromedioDP));
end;

procedure TForm1.PromedioTDSClick(Sender: TObject);
begin
   showmessage(floattostr(x.PromedioTDS));
end;

procedure TForm1.PromedioTIDClick(Sender: TObject);

begin
 showmessage(floattostr(x.PromedioTID));
end;

procedure TForm1.PromedioTIIClick(Sender: TObject);
begin
 showmessage(floattostr(x.PromedioTII));
end;

procedure TForm1.PromedioTSIClick(Sender: TObject);
begin
  showmessage(floattostr(x.PromedioTSI));
end;

procedure TForm1.RestarClick(Sender: TObject);
begin
   x.RestarMatrices(y);
   updateMatrizBox();
end;

procedure TForm1.SalirClick(Sender: TObject);
begin

end;

procedure TForm1.SubmatrizClick(Sender: TObject);
begin
  x.Cofactor(1,1);
end;

procedure TForm1.SumarColumnaClick(Sender: TObject);
var columna:integer;
begin
 columna:=strtoint(inputbox('Ingrese la columna a sumar','',''));
showmessage(inttostr(x.sumacol(Columna)));

end;

procedure TForm1.SumarFilasClick(Sender: TObject);
var Filar:integer;
begin
 Filar:=strtoint(inputbox('Ingrese la fila a sumar','',''));
 showmessage(inttostr(x.SumarFilas(Filar)));

end;

procedure TForm1.SumarMatriz1Click(Sender: TObject);
begin
  x.SumarMatrices(y);
   updateMatrizBox();
end;

procedure TForm1.TranspuestaClick(Sender: TObject);
begin
  x.transpuesta();
   updateMatrizBox();
end;

procedure TForm1.VecesRepetidoTSIClick(Sender: TObject);
var n:integer;
begin
 n:=strtoint(inputbox('seleccion el elemento para ver los repetidos','',''));
  showmessage(inttostr(x.Repetidos(n)));
end;

procedure TForm1.updateMatrizBox();
var f,c:integer;

begin
  matrizbox.colcount:=x.getCols;
  matrizbox.rowcount:=x.getfils;
    for f:=1 to x.getfils do begin
      for c:=1 to x.getcols do begin
        matrizbox.cells[c-1,f-1]:=inttostr(x.getelem(f,c));
      end;
    end;

end;

procedure TForm1.updateMatrizBoxY();
var f,c:integer;

begin
  matrizbox1.colcount:=y.getCols;
  matrizbox1.rowcount:=y.getfils;
    for f:=1 to y.getfils do begin
      for c:=1 to y.getcols do begin
        matrizbox1.cells[c-1,f-1]:=inttostr(y.getelem(f,c));
      end;
    end;

end;

procedure TForm1.CrearClick(Sender: TObject);
begin
  x:=matriz.create;
  showmessage('Clase creada');
  updateMatrizBox();

end;

procedure TForm1.Determinante2x2Click(Sender: TObject);
begin
  showmessage(inttostr(x.determinante2x2));
end;

procedure TForm1.Determinante3x3Click(Sender: TObject);
begin
   showmessage(inttostr(x.determinante3x3));
end;

procedure TForm1.ContadorTIDClick(Sender: TObject);
begin
 showmessage(inttostr(x.ContadorTID))
end;

procedure TForm1.BuscarRepClick(Sender: TObject);
var n:integeR;
begin
 n:=strtoint(inputbox('ingrese el digito a buscar','',''));
 showmessage(x.BuscRep(n));
end;

procedure TForm1.CargarMatrizClick(Sender: TObject);
begin
  x.CargarMatrizConVector(y);
    updateMatrizBox;
end;

procedure TForm1.Crear1Click(Sender: TObject);
begin
   y:=matriz.create;
  showmessage('Clase creada');
  updateMatrizBoxY();
end;

procedure TForm1.Ej6Click(Sender: TObject);
var filsi,filsf,colsi,colsf,r:integer;
begin
  FilsI:=StrToInt(InputBox('Introduzca una fila inicial','',''));
  ColsI:=StrToInt(inputBox('Introduzca una columna inicial','',''));
  FilsF:=StrToInt(inputBox('Introduzca una fila Final','',''));
  ColsF:=StrToInt(inputBox('Introduzca una columna final','',''));



 r:= x.SumarBloque(FilsI,ColsI,FilsF,ColsF);
 showmessage(inttostr(r));
  updateMatrizBox;

end;

procedure TForm1.FijarColumna1Click(Sender: TObject);
begin
  y.setcols(strtoint(colum1.text));
  updatematrizboxY();
end;

procedure TForm1.FijarColumnaClick(Sender: TObject);
begin
   x.setcols(strtoint(colum.text));
  updatematrizbox();
end;

procedure TForm1.FijarElem1Click(Sender: TObject);
var f,c,e:integer;
begin
  f:=strtoint(fila1.text);
  c:=strtoint(colum1.text);
  e:=strtoint(elem1.text);
  y.setelem(f,c,e);
  updateMatrizBoxY;

end;

procedure TForm1.FijarElemClick(Sender: TObject);
var f,c,e:integer;
begin
  f:=strtoint(fila.text);
  c:=strtoint(colum.text);
  e:=strtoint(elem.text);
  x.setelem(f,c,e);
  updateMatrizBox;

end;

procedure TForm1.FijarFilas1Click(Sender: TObject);
begin
   y.setFils(strtoint(fila1.text));
  updatematrizboxY();
end;

procedure TForm1.FijarFilasClick(Sender: TObject);
begin
  X.setFils(strtoint(fila.text));
  updatematrizbox();
end;

end.

