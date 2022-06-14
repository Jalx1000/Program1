unit VectoresU;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Grids, StdCtrls, Menus,
  vectoresuu;

type

  { TForm1 }

  TForm1 = class(TForm)
    Cargar: TButton;
    Descargar: TButton;
    MainMenu1: TMainMenu;
    EliminarElem: TMenuItem;
    CortesDesordenado: TMenuItem;
    ElimRep: TMenuItem;
    CortOrd: TMenuItem;
    CortesRep: TMenuItem;
    Frecuencia: TMenuItem;
    DividirVectorPorCorte: TMenuItem;
    DivVec: TMenuItem;
    Intercalar2vectores: TMenuItem;
    PurgarUsandoCC: TMenuItem;
    VectoresCortes: TMenuItem;
    purga: TMenuItem;
    Multiplos: TMenuItem;
    primos: TMenuItem;
    Separar: TMenuItem;
    Mezclar3: TMenuItem;
    MezclarAsc: TMenuItem;
    OrdenarDes: TMenuItem;
    Mezclar: TMenuItem;
    Ordenar: TMenuItem;
    Practico: TMenuItem;
    vectorboxaux: TStringGrid;
    VectorBox: TStringGrid;
    procedure CargarClick(Sender: TObject);
    procedure CortesDesordenadoClick(Sender: TObject);
    procedure CortesRepClick(Sender: TObject);
    procedure CortOrdClick(Sender: TObject);
    procedure DescargarClick(Sender: TObject);
    procedure DividirVectorPorCorteClick(Sender: TObject);
    procedure DivVecClick(Sender: TObject);
    procedure EliminarElemClick(Sender: TObject);
    procedure ElimRepClick(Sender: TObject);
    procedure FrecuenciaClick(Sender: TObject);
    procedure Intercalar2vectoresClick(Sender: TObject);
    procedure PurgarUsandoCCClick(Sender: TObject);
    procedure Mezclar3Click(Sender: TObject);
    procedure MezclarAscClick(Sender: TObject);
    procedure MezclarClick(Sender: TObject);
    procedure MultiplosClick(Sender: TObject);
    procedure OrdenarClick(Sender: TObject);
    procedure OrdenarDesClick(Sender: TObject);
    procedure primosClick(Sender: TObject);
    procedure purgaClick(Sender: TObject);
    procedure SepararClick(Sender: TObject);
    procedure VectoresCortesClick(Sender: TObject);
  private

  public
  x:vector;
  y:vector;


  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.CargarClick(Sender: TObject);
begin
  x:=vector.create;
  x.cargarelem();
  vectorboxaux.visible:=false;
end;

procedure TForm1.CortesDesordenadoClick(Sender: TObject);
begin
   showmessage('hay '+inttostr(x.CortesDeControl)+' de control');
   vectorboxaux.visible:=false;
end;

procedure TForm1.CortesRepClick(Sender: TObject);
var n:string;
begin
  n:=inputbox('Digite el numero del corte de repeticiones','','');
  showmessage(inttostr(x.repcortes(strtoint(n))));
  vectorboxaux.visible:=false;
end;

procedure TForm1.CortOrdClick(Sender: TObject);
begin
  showmessage(inttostr(x.cortesdecontrolOrd()));
  vectorboxaux.visible:=false;
end;

procedure TForm1.DescargarClick(Sender: TObject);
var dim,posi,dim2:integer;
begin
  dim:=x.getdim;
  vectorbox.colcount:=dim;

  for posi:=1 to dim do begin
    vectorbox.cells[posi-1,0]:=inttostr(x.getelem(posi));
  end;

  if vectorboxaux.visible=true then begin

   dim2:=y.getdim;
   vectorboxaux.colcount:=dim2;

   for posi:=1 to dim2 do begin
     vectorboxaux.cells[posi-1,0]:=inttostr(y.getelem(posi));
   end;

  end;


end;

procedure TForm1.DividirVectorPorCorteClick(Sender: TObject);
begin
  x.DividirVectoresPorCortes();
  vectorboxaux.visible:=false;
end;

procedure TForm1.DivVecClick(Sender: TObject);
var a,b:vector;
begin
  y:=vector.create;
  x:=vector.create;
  a:=vector.create;
  a.cargarelem();


  vectorboxaux.visible:=true;

  x.dividirVectorParEImpar(a,y)

end;

procedure TForm1.EliminarElemClick(Sender: TObject);
var pos:string;
begin
  pos:=inputbox('Introduzca la posicion','','');
  x.eliminarVec(strtoint(pos));
  vectorboxaux.visible:=false;
end;

procedure TForm1.ElimRepClick(Sender: TObject);
begin
end;

procedure TForm1.FrecuenciaClick(Sender: TObject);
begin
  x.FrecuenciaCortes;
  vectorboxaux.visible:=false;
end;

procedure TForm1.Intercalar2vectoresClick(Sender: TObject);
var a,b:vector;
begin
  x:=vector.create;
  x.create;
  a:=vector.create;
  b:=vector.create;
  a.cargarelem;
  b.cargarelem;


  x.Intercalar2Vectores(a,b);
  vectorboxaux.visible:=false;
end;

procedure TForm1.PurgarUsandoCCClick(Sender: TObject);
begin
  x.PurgarUsandoCortesDeControl();
  vectorboxaux.visible:=false;
end;

procedure TForm1.Mezclar3Click(Sender: TObject);
var a,b,c:vector;
begin
    x:=vector.create;
  a:=vector.create;
  b:=vector.create;
  c:=vector.create;
  a.cargarelem;
  b.cargarelem;
  c.cargarelem;
 x.Intercalar3vectoresOrd(a,b,c);
 vectorboxaux.visible:=false;

end;

procedure TForm1.MezclarAscClick(Sender: TObject);
var a,b:vector;
begin
  x:=vector.create;
  a:=vector.create;
  b:=vector.create;
  a.cargarelem;
  b.cargarelem;

  x.mezclaVectoresas(a,b);
  vectorboxaux.visible:=false;

end;

procedure TForm1.MezclarClick(Sender: TObject);
var a,b:vector;
begin
  x:=vector.create;
  a:=vector.create;
  b:=vector.create;
  a.cargarelem;
  b.cargarelem;

  x.mezclaVectores(a,b);
  vectorboxaux.visible:=false;
end;

procedure TForm1.MultiplosClick(Sender: TObject);
var a,b:vector;
begin
  y:=vector.create;
  x:=vector.create;
  a:=vector.create;
  a.cargarelem();


  vectorboxaux.visible:=true;

  x.dividirVectorMultiplo(a,y)

end;

procedure TForm1.OrdenarClick(Sender: TObject);
begin
  x.ordenarvectores();
  vectorboxaux.visible:=false;
end;

procedure TForm1.OrdenarDesClick(Sender: TObject);
begin
  x.ordenarVectoresDes();
  vectorboxaux.visible:=false;
end;

procedure TForm1.primosClick(Sender: TObject);
var n:string;
begin
  n:=inputbox('Numero','','');

  if x.esprimo(strtoint(n))=true then begin
   showmessage('Si es');
  end else begin
   showmessage('No es');
  end;
  vectorboxaux.visible:=false;
end;

procedure TForm1.purgaClick(Sender: TObject);
begin
  x.PurgaOrdenada();
end;

procedure TForm1.SepararClick(Sender: TObject);
var a,b:vector;
begin
  y:=vector.create;
  x:=vector.create;
  a:=vector.create;
  a.cargarelem();


  vectorboxaux.visible:=true;

  x.DividirVectorPrimos(a,y)


end;

procedure TForm1.VectoresCortesClick(Sender: TObject);
var n:string;
begin
  n:=inputbox('Digite que parte de los vectores del corte quiere ver','','');

  showmessage(x.VectoresHastaUnCorte(strtoint(n)));
  vectorboxaux.visible:=false;
end;



end.

