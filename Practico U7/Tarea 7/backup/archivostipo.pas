unit ArchivosTipo;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus,
  archivostipoU;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Buscar: TButton;
    Guardar: TButton;
    Domicilio: TLabel;
    INF110BOX: TEdit;
    LIN100BOX: TEdit;
    MainMenu1: TMainMenu;
    MAT101BOX: TEdit;
    FIS101BOX: TEdit;
    INF119BOX: TEdit;
    INF119: TLabel;
    Genero: TLabel;
    LIN100: TLabel;
    Informacion: TLabel;
    MAT101: TLabel;
    FIS101: TLabel;
    Add: TMenuItem;
    CambiarDomicilio: TMenuItem;
    Archivotxt: TMenuItem;
    EliminarPorRegistro: TMenuItem;
    OrdenarPorRegistro: TMenuItem;
    OrdenarNombre: TMenuItem;
    PromedioINF110: TMenuItem;
    Practico7: TMenuItem;
    Notas: TLabel;
    Register: TEdit;
    CI: TEdit;
    Nombress: TEdit;
    Apelldidos: TEdit;
    Domicilios: TEdit;
    Generos: TEdit;
    Apellidos: TLabel;
    Registro: TLabel;
    LeerDatos: TButton;
    CargarDatos: TButton;
    Inicializar: TButton;
    Carnet: TLabel;
    Nombres: TLabel;
    INF110: TLabel;
    procedure AddClick(Sender: TObject);
    procedure ArchivotxtClick(Sender: TObject);
    procedure BuscarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure CambiarDomicilioClick(Sender: TObject);
    procedure CargarDatosClick(Sender: TObject);
    procedure EliminarPorRegistroClick(Sender: TObject);
    procedure GuardarClick(Sender: TObject);
    procedure INF110BOXChange(Sender: TObject);
    procedure InicializarClick(Sender: TObject);
    procedure LeerDatosClick(Sender: TObject);
    procedure NombressChange(Sender: TObject);
    procedure OrdenarNombreClick(Sender: TObject);
    procedure OrdenarPorRegistroClick(Sender: TObject);
    procedure PromedioINF110Click(Sender: TObject);
  private
   f:tipo;
   r:alumno;
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.InicializarClick(Sender: TObject);
begin
  f:=tipo.create;
  showmessage('objeto alumno creado');
end;

procedure TForm1.LeerDatosClick(Sender: TObject);
begin
  F.mostrar;
end;

procedure TForm1.NombressChange(Sender: TObject);
begin

end;

procedure TForm1.OrdenarNombreClick(Sender: TObject);
begin
  f.ordenarpornombre();
end;

procedure TForm1.OrdenarPorRegistroClick(Sender: TObject);
begin
  f.ordenarporregistro();
end;

procedure TForm1.PromedioINF110Click(Sender: TObject);
begin
  showmessage('El promedio de la materia INF110 es de : '+floattostr(F.PromedioINF110 ));
end;

procedure TForm1.CargarDatosClick(Sender: TObject);
begin
  F.cargar();
end;

procedure TForm1.EliminarPorRegistroClick(Sender: TObject);
var i:integer;
begin
  i:=inputbox('Introduzca el registro','Registro: ','');
  f:=f.EliminarUnRecordPorReg(i);
end;

procedure TForm1.GuardarClick(Sender: TObject);
begin
  F.posicionar(f.posicion()-1);
  showmessage(inttostr(f.posicion));
    r.registro:=strtoint(Register.text);
     r.CI:=strtoint(CI.text);
     r.nombre:=Nombress.text;
     r.app:=apelldidos.text;
     r.genero:=generos.text[1];
      r.domicilio:=Domicilios.text;
     R.INF110:=strtoint(INF110box.text);
     R.LIN100:=strtoint(LIN100box.text);
     R.MAT101:=strtoint(MAT101box.text);
     R.FIS101:=strtoint(FIS101box.text);
     R.INF119:=strtoint(INF119box.text);
     f.escribir(r);
end;

procedure TForm1.INF110BOXChange(Sender: TObject);
begin

end;

procedure TForm1.Button5Click(Sender: TObject);
var n:integer;
     pos:integer;
begin
  n:=strtoint(inputbox('introduzca el registro para ver al alumno','registro: ',''));

  F.abrir;

  pos:=f.AccederRegistro(n);
  f.posicionar(pos);

  f.leer(r);

  ci.text:=IntToStr(r.ci);
  register.text:=IntToStr(R.registro);
  nombress.text:=r.nombre;
  Apelldidos.text:=r.app;
  domicilios.text:=r.domicilio;
  generos.text:=r.genero;
  INF110BOX.text:=IntToStr(r.INF110);
   LIN100BOX.text:=IntToStr(r.lin100);
   MAT101BOX.text:=IntToStr(r.MAT101);
   FIS101BOX.text:=IntToStr(r.FIS101);
   INF119BOX.text:=IntToStr(r.INF119);





end;

procedure TForm1.Button6Click(Sender: TObject);
begin

end;

procedure TForm1.CambiarDomicilioClick(Sender: TObject);
var n:integer;
     pos:integer;
     m:string;
begin
  n:=strtoint(inputbox('introduzca el registro del alumno','registro: ',''));
  m:=inputbox('introduzca el nuevo domicilio','Nuevo domicilio: ','');

  pos:=f.AccederRegistro(n);
    f.posicionar(pos);

  f.leer(r);

  ci.text:=IntToStr(r.ci);
  register.text:=IntToStr(R.registro);
  nombress.text:=r.nombre;
  Apelldidos.text:=r.app;
  domicilios.text:=r.domicilio;
  generos.text:=r.genero;
  INF110BOX.text:=IntToStr(r.INF110);
   LIN100BOX.text:=IntToStr(r.lin100);
   MAT101BOX.text:=IntToStr(r.MAT101);
   FIS101BOX.text:=IntToStr(r.FIS101);
   INF119BOX.text:=IntToStr(r.INF119);


    F.posicionar(f.posicion()-1);
    r.registro:=strtoint(Register.text);
     r.CI:=strtoint(CI.text);
     r.nombre:=Nombress.text;
     r.app:=apelldidos.text;
     r.genero:=generos.text[1];
      r.domicilio:=m;
     R.INF110:=strtoint(INF110box.text);
     R.LIN100:=strtoint(LIN100box.text);
     R.MAT101:=strtoint(MAT101box.text);
     R.FIS101:=strtoint(FIS101box.text);
     R.INF119:=strtoint(INF119box.text);
     f.escribir(r);





 end;


procedure TForm1.Button3Click(Sender: TObject);
begin
  if not f.findearchivo then begin
   f.leer(r);
  ci.text:=IntToStr(r.ci);
  register.text:=IntToStr(R.registro);
  nombress.text:=r.nombre;
  Apelldidos.text:=r.app;
  domicilios.text:=r.domicilio;
  generos.text:=r.genero;
    INF110BOX.text:=IntToStr(r.INF110);
   LIN100BOX.text:=IntToStr(r.lin100);
   MAT101BOX.text:=IntToStr(r.MAT101);
   FIS101BOX.text:=IntToStr(r.FIS101);
   INF119BOX.text:=IntToStr(r.INF119);

  end else begin
    showmessage('Fin de archivo');
  end;

end;

procedure TForm1.Button1Click(Sender: TObject);
begin
    f.posicionar(0);

   f.leer(r);
  ci.text:=IntToStr(r.ci);
  register.text:=IntToStr(R.registro);
  nombress.text:=r.nombre;
  Apelldidos.text:=r.app;
  domicilios.text:=r.domicilio;
  generos.text:=r.genero;
    INF110BOX.text:=IntToStr(r.INF110);
   LIN100BOX.text:=IntToStr(r.lin100);
   MAT101BOX.text:=IntToStr(r.MAT101);
   FIS101BOX.text:=IntToStr(r.FIS101);
   INF119BOX.text:=IntToStr(r.INF119);





end;

procedure TForm1.BuscarClick(Sender: TObject);
var n:integer;
     pos:integer;
begin
  n:=strtoint(inputbox('introduzca el registro para ver al alumno','registro: ',''));

  pos:=f.AccederRegistro(n);
    f.posicionar(pos);

  f.leer(r);

  ci.text:=IntToStr(r.ci);
  register.text:=IntToStr(R.registro);
  nombress.text:=r.nombre;
  Apelldidos.text:=r.app;
  domicilios.text:=r.domicilio;
  generos.text:=r.genero;
  INF110BOX.text:=IntToStr(r.INF110);
   LIN100BOX.text:=IntToStr(r.lin100);
   MAT101BOX.text:=IntToStr(r.MAT101);
   FIS101BOX.text:=IntToStr(r.FIS101);
   INF119BOX.text:=IntToStr(r.INF119);

end;

procedure TForm1.AddClick(Sender: TObject);
var i,ci23,registro23,inf11023,mat10123,lin10023,fis10123,inf11923:integer;
    nombre23,app23,domicilio23:string;
    genero23:char;
begin
  i:=1;
   registro23:=strtoint(inputbox('alumno: '+inttostr(i),'Registro : ',''));
        CI23:=strtoint(inputbox('alumno: '+inttostr(i),'Carnet de identidad: ',''));
        nombre23:=inputbox('alumno: '+inttostr(i),'nombres : ','');
       app23:=inputbox('alumno: '+inttostr(i),'apellidos : ','');
        genero23:=inputbox('alumno: '+inttostr(i),'genero : [H/M] ','')[1];
       domicilio23:=inputbox('alumno: '+inttostr(i),'Domicilio : ','');
      INF11023:=strtoint(inputbox('alumno: '+inttostr(i),'Nota en INF110 : ',''));;
      LIN10023:=strtoint(inputbox('alumno: '+inttostr(i),'Nota en LIN100 : ',''));;
    MAT10123:=strtoint(inputbox('alumno: '+inttostr(i),'Nota en MAT101 : ',''));;
      FIS10123:=strtoint(inputbox('alumno: '+inttostr(i),'Nota en FIS101 : ',''));;
    INF11923:=strtoint(inputbox('alumno: '+inttostr(i),'Nota en INF119 : ',''));;


    f.insertaralumno(ci23, registro23, Nombre23, app23,
  domicilio23, genero23, INF11023, LIN10023, MAT10123, FIS10123,
  INF11923);

end;

procedure TForm1.ArchivotxtClick(Sender: TObject);
begin
  f.Generartexto();
  showmessage('archivo texto generado');
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
    if f.posicion>1 then begin
   f.posicionar(f.posicion()-2);

   f.leer(r);
  ci.text:=IntToStr(r.ci);
  register.text:=IntToStr(R.registro);
  nombress.text:=r.nombre;
  Apelldidos.text:=r.app;
  domicilios.text:=r.domicilio;
  generos.text:=r.genero;
    INF110BOX.text:=IntToStr(r.INF110);
   LIN100BOX.text:=IntToStr(r.lin100);
   MAT101BOX.text:=IntToStr(r.MAT101);
   FIS101BOX.text:=IntToStr(r.FIS101);
   INF119BOX.text:=IntToStr(r.INF119);

  end else begin
    showmessage('Inicio de archivo');
  end;

end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  f.posicionar(f.numeroregistros()-1);
  showmessage(inttostr(f.NumeroRegistros));
  showmessage(inttostr(f.posicion)+'Esta en esa posicion');
   f.leer(r);
  ci.text:=IntToStr(r.ci);
  register.text:=IntToStr(R.registro);
  nombress.text:=r.nombre;
  Apelldidos.text:=r.app;
  domicilios.text:=r.domicilio;
  generos.text:=r.genero;
    INF110BOX.text:=IntToStr(r.INF110);
   LIN100BOX.text:=IntToStr(r.lin100);
   MAT101BOX.text:=IntToStr(r.MAT101);
   FIS101BOX.text:=IntToStr(r.FIS101);
   INF119BOX.text:=IntToStr(r.INF119);

end;



end.

