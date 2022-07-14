unit flab;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs;

type

  { TLab }

  TLab = class(TForm)
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Lab: TLab;

implementation

{$R *.lfm}

{ TLab }

procedure TLab.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case(key) of
      38:begin
             Caption:= 'Arriba'
           end;
      40:begin
             Caption:= 'Abajo'
           end;
      39:begin
             Caption:= 'Derecha'
           end;
      37:begin
             Caption:= 'Izquierda'
           end;
  end;
end;

end.

