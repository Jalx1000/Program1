unit ujuego;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Graphics, ExtCtrls, Dialogs, flab, MMSystem;

const
  MAX_F=25;
  MAX_C=25;
  Arriba=1;
  Abajo=2;
  Izquierda=3;
  Derecha=4;
type
  Direccion=integer;
  Posicion=record
    fil,col,NivelActual:integer;
  end;

  { Juego }

  Juego=class
    private
      Lab:array[1..MAX_F,1..MAX_C]of integer;
      Fils,Cols:integer;
      Ini,Fin,raton:posicion;
      Cam:array[1..MAX_F*MAX_F]of posicion;
      dimcam,nivel:integer;
      //ctx es para interactuar con el Formulario
      Ctx:TLab;
    public
      constructor Crear(Form:TLab);
      procedure CrearLab(niv,PosF,PosC:integer);
      function getNivel():integer;
      procedure Automatico();
      procedure Dibujar();
      procedure MoverRaton(dir:Direccion);
  end;

implementation

{ Juego }

constructor Juego.Crear(Form: TLab);
var
  f,c:integer;
begin
  fils:=0;
  cols:=0;
  for f:=1 to MAX_F do
    for c:=1 to MAX_C do
        Lab[f,c]:=-1;
  ctx:=Form;
  for f:=1 to MAX_F*MAX_C do
  begin
    Cam[f].fil:=-1;
    Cam[f].col:=-1;
  end;
  Ini.fil:=0;
  Ini.col:=0;
  Fin.fil:=0;
  Fin.col:=0;
end;

procedure Juego.CrearLab(niv,PosF,PosC: integer);
var
  f,c:integer;
  LN1:Array[1..4,1..4]of integer =((1,0,1,1),(1,0,0,1),(1,1,0,0),(1,1,1,1));
  LN2:Array[1..6,1..6]of integer =((1,0,1,1,1,1),(1,0,0,0,0,1),(1,1,1,1,0,1),(1,0,1,1,0,1),(1,0,0,0,0,1),(1,0,1,1,1,1));
  LN3:Array[1..8,1..8]of integer =((1,0,1,1,1,1,1,1),(1,0,0,0,0,0,0,1),(1,0,1,1,0,1,0,1),(1,1,1,1,0,1,1,1),(1,0,0,0,0,1,0,0),(1,0,1,1,1,1,0,1),(1,0,0,0,0,0,0,1),(1,1,1,1,1,1,1,1));
begin
   case niv of
      1:begin //4x4
        fils:=4;
        cols:=4;
        for f:=1 to fils do
          for c:=1 to cols do
            Lab[f,c]:=LN1[f,c];
        Ini.fil:=2;
        Ini.col:=1;
        Fin.fil:=4;
        Fin.col:=3;
        end;
      2:begin //6x6
        fils:=6;
        cols:=6;

        for f:=1 to fils do
         for c:=1 to cols do
           lab[f,c]:=LN2[f,c];
           Ini.fil:=2;
           Ini.col:=1;
           Fin.fil:=2;
           Fin.col:=6;
            end;

       3:begin //8x8
        fils:=8;
        cols:=8;

        for f:=1 to fils do
         for c:=1 to cols do
           lab[f,c]:=LN3[f,c];
           Ini.fil:=2;
           Ini.col:=1;
           Fin.fil:=8;
           Fin.col:=5;

         end;
   end;
   raton:=Ini;
   dimcam:=0;
   nivel:=niv;
   Dibujar();
end;

function Juego.getNivel: integer;
begin
  Result:=nivel;
end;

procedure Juego.Automatico();
begin
  if(nivel=0)then begin
    nivel:=nivel+1;
     end;
 		 case nivel of
        1:begin
          MoverRaton(derecha);
          ShowMessage('F: '+IntToStr(raton.fil)+' C: '+IntToStr(raton.col));
          MoverRaton(Abajo);
          ShowMessage('F: '+IntToStr(raton.fil)+' C: '+IntToStr(raton.col));
          MoverRaton(Derecha);
					ShowMessage('F: '+IntToStr(raton.fil)+' C: '+IntToStr(raton.col));
          MoverRaton(abajo);
        end;
        2:begin
          MoverRaton(derecha);
          ShowMessage('F: '+IntToStr(raton.fil)+' C: '+IntToStr(raton.col));
          MoverRaton(Abajo);
          ShowMessage('F: '+IntToStr(raton.fil)+' C: '+IntToStr(raton.col));
          MoverRaton(Abajo);
					ShowMessage('F: '+IntToStr(raton.fil)+' C: '+IntToStr(raton.col));
          MoverRaton(Abajo);
          ShowMessage('F: '+IntToStr(raton.fil)+' C: '+IntToStr(raton.col));
          MoverRaton(Derecha);
          ShowMessage('F: '+IntToStr(raton.fil)+' C: '+IntToStr(raton.col));
          MoverRaton(Derecha);
          ShowMessage('F: '+IntToStr(raton.fil)+' C: '+IntToStr(raton.col));
          MoverRaton(Derecha);
          ShowMessage('F: '+IntToStr(raton.fil)+' C: '+IntToStr(raton.col));
          MoverRaton(Arriba);
          ShowMessage('F: '+IntToStr(raton.fil)+' C: '+IntToStr(raton.col));
          MoverRaton(Arriba);
          ShowMessage('F: '+IntToStr(raton.fil)+' C: '+IntToStr(raton.col));
          MoverRaton(Arriba);
          ShowMessage('F: '+IntToStr(raton.fil)+' C: '+IntToStr(raton.col));
          MoverRaton(Derecha);
          ShowMessage('F: '+IntToStr(raton.fil)+' C: '+IntToStr(raton.col));
        end;
        3:begin
          MoverRaton(derecha);
          ShowMessage('F: '+IntToStr(raton.fil)+' C: '+IntToStr(raton.col));
          MoverRaton(Abajo);
          ShowMessage('F: '+IntToStr(raton.fil)+' C: '+IntToStr(raton.col));
          MoverRaton(Abajo);
					ShowMessage('F: '+IntToStr(raton.fil)+' C: '+IntToStr(raton.col));
          MoverRaton(Abajo);
          ShowMessage('F: '+IntToStr(raton.fil)+' C: '+IntToStr(raton.col));
          MoverRaton(Derecha);
          ShowMessage('F: '+IntToStr(raton.fil)+' C: '+IntToStr(raton.col));
          MoverRaton(Derecha);
          ShowMessage('F: '+IntToStr(raton.fil)+' C: '+IntToStr(raton.col));
          MoverRaton(Derecha);
          ShowMessage('F: '+IntToStr(raton.fil)+' C: '+IntToStr(raton.col));
          MoverRaton(Arriba);
          ShowMessage('F: '+IntToStr(raton.fil)+' C: '+IntToStr(raton.col));
          MoverRaton(Arriba);
          ShowMessage('F: '+IntToStr(raton.fil)+' C: '+IntToStr(raton.col));
          MoverRaton(Arriba);
          ShowMessage('F: '+IntToStr(raton.fil)+' C: '+IntToStr(raton.col));
          MoverRaton(Derecha);
          ShowMessage('F: '+IntToStr(raton.fil)+' C: '+IntToStr(raton.col));
          MoverRaton(Derecha);
          ShowMessage('F: '+IntToStr(raton.fil)+' C: '+IntToStr(raton.col));
          MoverRaton(Abajo);
          ShowMessage('F: '+IntToStr(raton.fil)+' C: '+IntToStr(raton.col));
          MoverRaton(Abajo);
					ShowMessage('F: '+IntToStr(raton.fil)+' C: '+IntToStr(raton.col));
          MoverRaton(Abajo);
          ShowMessage('F: '+IntToStr(raton.fil)+' C: '+IntToStr(raton.col));
          MoverRaton(Abajo);
          ShowMessage('F: '+IntToStr(raton.fil)+' C: '+IntToStr(raton.col));
          MoverRaton(Abajo);
					ShowMessage('F: '+IntToStr(raton.fil)+' C: '+IntToStr(raton.col));
          MoverRaton(Izquierda);
          ShowMessage('F: '+IntToStr(raton.fil)+' C: '+IntToStr(raton.col));
          MoverRaton(Izquierda);
          ShowMessage('F: '+IntToStr(raton.fil)+' C: '+IntToStr(raton.col));
          MoverRaton(Abajo);
					ShowMessage('F: '+IntToStr(raton.fil)+' C: '+IntToStr(raton.col));
        end;
     end;
end;

procedure Juego.Dibujar;
var
  f,c,dx,dy,ni:integer;
  img:TImage;
begin
  case nivel of
     1: begin
        sndPlaySound('sounds/Start.wav', SND_NODEFAULT Or SND_ASYNC  or SND_FILENAME);
        ctx.Caption:='Nivel :'+IntToStr(nivel);
        ctx.Width:=500;
        ctx.Height:=500;
        dx:=80;
        dy:=80;
        for f:=1 to fils do
          for c:=1 to cols do
          begin
            img:=TImage.Create(ctx);
            img.Parent:=ctx;
            if(lab[f,c]=1)then
               img.Picture.LoadFromFile('images/ladrillo.jpg')
            else
               img.Picture.LoadFromFile('images/pasto.jpg');
            img.Left:=f*dx;
            img.Top:=c*dy;
            img.Width:=dx;
            img.Height:=dy;
            img.Stretch:=true;
          end;
          img:=TImage.Create(ctx);
          img.Parent:=ctx;
          img.Picture.LoadFromFile('images/raton.jpg');
          img.Left:=raton.col*dx;
          img.Top:=raton.fil*dy;
          img.Width:=dx;
          img.Height:=dy;
          img.Stretch:=true;
     end; //Fin caso 1
  	 		 2: begin
           sndPlaySound('sounds/Start.wav', SND_NODEFAULT Or SND_ASYNC  or SND_FILENAME);
        ctx.Caption:='Nivel :'+IntToStr(nivel);
        ctx.Width:=600;
        ctx.Height:=600;
        dx:=80;
        dy:=80;
        for f:=1 to 6 do
          for c:=1 to 6 do
          begin
            img:=TImage.Create(ctx);
            img.Parent:=ctx;
            if(lab[f,c]=1)then
               img.Picture.LoadFromFile('images/ladrillo.jpg')
            else
               img.Picture.LoadFromFile('images/pasto.jpg');
            img.Left:=f*dx;
            img.Top:=c*dy;
            img.Width:=dx;
            img.Height:=dy;
            img.Stretch:=true;
          end;
          img:=TImage.Create(ctx);
          img.Parent:=ctx;
          img.Picture.LoadFromFile('images/raton.jpg');
          img.Left:=raton.col*dx;
          img.Top:=raton.fil*dy;
          img.Width:=dx;
          img.Height:=dy;
          img.Stretch:=true;
         end;//fin caso 2
         3: begin
           sndPlaySound('sounds/Start.wav', SND_NODEFAULT Or SND_ASYNC  or SND_FILENAME);
        ctx.Caption:='Nivel :'+IntToStr(nivel);
        ctx.Width:=800;
        ctx.Height:=800;
        dx:=80;
        dy:=80;
        for f:=1 to fils do
          for c:=1 to cols do
          begin
            img:=TImage.Create(ctx);
            img.Parent:=ctx;
            if(lab[f,c]=1)then
               img.Picture.LoadFromFile('images/ladrillo.jpg')
            else
               img.Picture.LoadFromFile('images/pasto.jpg');
            img.Left:=f*dx;
            img.Top:=c*dy;
            img.Width:=dx;
            img.Height:=dy;
            img.Stretch:=true;
          end;
          img:=TImage.Create(ctx);
          img.Parent:=ctx;
          img.Picture.LoadFromFile('images/raton.jpg');
          img.Left:=raton.col*dx;
          img.Top:=raton.fil*dy;
          img.Width:=dx;
          img.Height:=dy;
          img.Stretch:=true;
         end;//Fin caso 3
   end;
  ctx.Show;
  if(raton.fil=ini.fil)and(raton.col=ini.col)then
     ShowMessage('En la Entrada ...!!!');
  if(raton.fil=fin.fil)and(raton.col=fin.col)then
     ShowMessage('Llegaste a la Salida...!!!');
end;
procedure Juego.MoverRaton(dir:Direccion);
var up,down,left,rigth:boolean;
  	f,c:integer;
    DireccionMirada:integer;
begin
   case dir of
      Arriba:begin
             raton.fil:=raton.fil-1;
             end;
      Abajo :begin
             raton.fil:=raton.fil+1;
             end;
      Derecha:begin
             raton.col:=raton.col+1;
             end;
      Izquierda:begin
             raton.col:=raton.col-1;
             end;
   end;
   Dibujar();
end;

end.

