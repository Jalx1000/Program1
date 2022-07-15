unit flaberinto;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Menus, ExtCtrls, Buttons, ujuego, flab, MMSystem;
type

  { TForm1 }

  TForm1 = class(TForm)
    BDer: TButton;
    BIzq: TButton;
    BArr: TButton;
    BAba: TButton;
    Bauto: TButton;
    Button1: TButton;
    Button2: TButton;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    OpenDialog1: TOpenDialog;
    procedure BAbaClick(Sender: TObject);
    procedure BArrClick(Sender: TObject);
    procedure BautoClick(Sender: TObject);
    procedure BIzqClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BDerClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure UsarTecladoKeyPress(Sender: TObject; var Key: char);
  private
    { private declarations }
    J:juego;
    r:Posicion;
    fil,col,nivel:integer;
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var ComenzarEn:integer;
begin
   ComenzarEn:=j.getnivel;
   if comenzarEn=0 then begin
     comenzarEn:=1;
   end;

   J:=Juego.Crear(Lab);
   showmessage(inttostr(comenzarEn));


  J.CrearLab(comenzarEn,fil,col);
end;

procedure TForm1.BIzqClick(Sender: TObject);
begin
  J.MoverRaton(Izquierda);
end;

procedure TForm1.BArrClick(Sender: TObject);
begin
  J.MoverRaton(Arriba);
end;

procedure TForm1.BAbaClick(Sender: TObject);
begin
  J.MoverRaton(Abajo);
end;

procedure TForm1.BDerClick(Sender: TObject);
begin
  J.MoverRaton(Derecha);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin

end;

procedure TForm1.MenuItem2Click(Sender: TObject);
begin
  J:=Juego.Crear(Lab);
  J.CrearLab(1,fil,col);
end;

procedure TForm1.MenuItem3Click(Sender: TObject);
begin
  J:=Juego.Crear(Lab);
  J.CrearLab(2,fil,col);
end;

procedure TForm1.MenuItem4Click(Sender: TObject);
begin
  J:=Juego.Crear(Lab);
  J.CrearLab(3,fil,col);
end;

procedure TForm1.MenuItem6Click(Sender: TObject);
begin
  fil:=2;
  col:=1;
  if OpenDialog1.execute then begin
    j.abrir;
    j.posicionar(0);
    j.leer(r);
      fil:=r.fil;
      col:=r.col;
      nivel:=r.NivelActual;
    j.cerrar();
  end;
  J:=Juego.Crear(Lab);
  J.CrearLab(nivel,fil,col);
end;

procedure TForm1.MenuItem7Click(Sender: TObject);
begin
  j.cargar();
  ShowMessage('guardado');
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState
  );
begin

end;

procedure TForm1.UsarTecladoKeyPress(Sender: TObject; var Key: char);
begin
   case(key) of
      'w':begin
             J.MoverRaton(Arriba);
           end;
      's':begin
           J.MoverRaton(abajo);
           end;
      'd':begin
             J.MoverRaton(derecha);
           end;
      'a':begin
             J.MoverRaton(Izquierda);
           end;

       end;

end;

procedure TForm1.BautoClick(Sender: TObject);
begin
  J.Automatico();
end;

end.

