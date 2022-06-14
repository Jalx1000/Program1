unit VectoresUU;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, dialogs;

TYPE

  { Vector }

  Vector=class

    private
      elem:array[1..1000] of integer;
      dim:integer;


    public
      constructor create();

      procedure CargarElem();


      function GetDim():integer;

      procedure SetElem(pos:integer; elemnuevo:Integer);
      Function GetElem(pos:integer):integer;

      procedure eliminarVec(pos:integer);
      function CortesDeControl():integer;
      procedure ordenarvectores();
      function DimelimRep():integer;
      procedure ordenarVectoresDes();

      function cortesdecontrolOrd():integer;
      function FrecuenciaCortes():string;
      function repcortes(num:integer):integer;
      procedure mezclaVectores(a,b : vector);
      procedure InsertarElem(elemnuevito:integer);
      procedure mezclaVectoresAs(a,b : vector);
      procedure Intercalar3vectoresOrd(a,b,c:vector);
      procedure DividirVectorPrimos(a:vector; b:vector);
      function esprimo(num:integer):boolean;
      procedure dividirVectorMultiplo(a:vector; b:vector);
      function esmultiplo(num:integer):boolean;
      procedure PurgaOrdenada();
      procedure DividirVectoresPorCortes();
      function  VectoresHastaUnCorte(num:integer):string;
      procedure dividirVectorParEImpar(a:vector; b:vector);
      function EsParOImpar(num:integer):boolean;
      procedure Intercalar2Vectores(a:vector; b:vector);
      procedure PurgarUsandoCortesDeControl();
      procedure corteElimRep(num:integer);


                            PurgarUsandoCortesDeControl





  end;




implementation

{ Vector }

constructor Vector.create();
var posi:integer;
begin
  for posi:=1 to 1000 do begin
    elem[posi]:=999999;
  end;

  dim:=0;
end;

procedure Vector.CargarElem();
var n,m,dimteclado:string;
    posi:integer;
begin
   n:=inputbox('Seleccion la dimension del vector','','');
   dimteclado:=n;
   dim:=strtoint(dimteclado);

   for posi:=1 to dim do begin
    m:=InputBox('Introduzca el elemento de la posicion '+inttostr(posi),'','');
    elem[posi]:=strtoint(m);
   end;


end;


function Vector.GetDim(): integer;
begin
  result:=dim;
end;

procedure Vector.SetElem(pos: integer; elemnuevo: Integer);
begin
  if pos<=dim then begin
  elem[pos]:=elemnuevo;
  end;

end;

function Vector.GetElem(pos: integer): integer;
begin
 result:=elem[pos];
end;

procedure Vector.eliminarVec(pos: integer);
var posi,j:integer;
begin
  posi:=1;

  for posi:=1 to dim do begin
    if posi=pos then begin
      for j:=posi to dim-1 do begin
       elem[j]:=elem[j+1];
      end;
      break;
    end;
  end;

 dim:=dim-1;
end;

function Vector.CortesDeControl(): integer;
var posi,cc,j,l,aux,r:integer;
    romper:boolean;
begin
 self.dimelimrep();
 result:=dim-1;

end;

procedure Vector.ordenarvectores();
var posi,j,aux:integer;
begin
  for posi:=1 to dim do begin
   for j:=posi+1 to dim do begin
    if elem[j]<elem[posi] then begin
      aux:=elem[posi];
      elem[posi]:=elem[j];
      elem[j]:=aux;
    end;
   end;
  end;
end;

function Vector.DimelimRep():integer;
var posi,j,r:integer;
begin

  for posi:=1 to dim do begin
   r:=0;
   for j:=1 to dim do begin
    if elem[posi]=elem[j] then begin
     r:=r+1;
     if r>1 then begin
     self.eliminarVec(j);

     end;
    end;
  end;


    result:=dim

end;



end;

procedure Vector.ordenarVectoresDes();
var posi,j,aux:integer;
begin

    for posi:=1 to dim do begin
   for j:=posi+1 to dim do begin
    if elem[j]>elem[posi] then begin
      aux:=elem[posi];
      elem[posi]:=elem[j];
      elem[j]:=aux;
    end;
   end;
  end;

end;

function Vector.cortesdecontrolOrd(): integer;
var i,cc:integer;
begin
   i:=1;
   cc:=0;

   while (i<=dim-1) do begin
     if elem[i]<elem[i+1] then begin
       cc:=cc+1;
        end;
        i:=i+1;
   end;

   result:=cc;
end;

function Vector.FrecuenciaCortes(): string;
var cortes,t:integer;
begin
  showmessage('Se ordenaran los vectores para saber su frecuencia de cada corte de control');
  self.ordenarvectores;
  cortes:=self.CortesDeControlord();
   t:=1;
if cortes>=1 then begin
 while cortes>=t do begin
 showmessage('En el '+inttostr(t)+' corte de control hay '+inttostr(self.repcortes(t))+' de frecuencia' );
 t:=t+1;
 end;



end;



end;

function Vector.repcortes(num: integer): integer;
var i,aux,cc,k:integer;
begin
    i:=1;
   cc:=0;
   aux:=1;

   while (i<=dim-1) do begin
     k:=cc;
     if elem[i]<elem[i+1] then begin

       cc:=cc+1;

       if cc=num then begin
       break;
       end;

     end else begin
       aux:=aux+1;
     end;

      if cc<>k then begin
      aux:=1;

      end;

        i:=i+1;
     end;




   result:=aux;
end;

procedure Vector.mezclaVectores(a, b: vector);
var dimb,dima,ia,ib,i,dimtotal:integer;
begin
 showmessage('Se ordenaran los vectores de forma ascendete para luego ordenarlos de forma ascendente');
   a.ordenarvectores;
   b.ordenarvectores;



   dimb:=b.getdim;
   dima:=a.getdim;
   dimtotal:=dimb+dima;

   i:=1;
   ib:=1;
   ia:=1;
 while i<=dimtotal do begin
  if (b.getelem(ib) <= a.getelem(ia)) and (ib<=dimb) then begin
    self.insertarelem(b.getelem(ib));
    ib:=ib+1;
  end else if  (b.getelem(ib)>=a.getelem(ia)) and (ia<=dima) then begin

    self.insertarelem(a.getelem(ia));
    ia:=ia+1;
  end;

  i:=i+1;
 end;







end;

procedure Vector.InsertarElem(elemnuevito: integer);
begin
  dim:=dim+1;
  elem[dim]:=elemnuevito

end;

procedure Vector.mezclaVectoresAs(a, b: vector);
var dimb,dima,ia,ib,i,dimtotal:integer;
begin
 showmessage('Se ordenaran los vectores de forma descente para luego dar un resultado de forma ascendete');
   a.ordenarvectoresdes;
   b.ordenarvectoresdes;



   dimb:=b.getdim;
   dima:=a.getdim;
   dimtotal:=dimb+dima;

   i:=1;
   ib:=dimb;
   ia:=dima;

 while i<=dimtotal do begin
  if (b.getelem(ib) <= a.getelem(ia)) and (ib>=1) then begin
    self.insertarelem(b.getelem(ib));
    ib:=ib-1;
    if ib=0 then begin
     ib:=999;
    end;
  end else if (b.getelem(ib)>=a.getelem(ia)) and (ia>=1) then begin

  self.insertarelem(a.getelem(ia));
    ia:=ia-1;

    if ia=0 then begin
     ia:=999;
    end;

  end;

  i:=i+1;

 end;


end;

procedure Vector.Intercalar3vectoresOrd(a, b, c: vector);
var ia,ib,ic:integer;
begin
ia:=1;
ib:=1;
ic:=1;



while ((ia<=a.getdim()) or (ib<=b.getdim()) or (ic<=c.getdim())) do
 begin
    if (ia<=a.getdim()) then
       begin

    if (
    ( (a.getelem(ia)<=b.getelem(ib) )or not (ib<=b.getdim() ))
     and (a.getElem(ia)<=c.getelem(ic)) or not (ic<=c.getdim() )
     ) then
     begin
      insertarelem(a.getelem(ia));
      ia:=ia+1;
       end;
     end;

   if (ib<=b.getdim()) then
     begin

    if (
    ( (b.getelem(ib)<=a.getelem(ia) )or not (ia<=a.getdim() ))
     and (b.getElem(ib)<=c.getelem(ic)) or not (ic<=c.getdim() )
     )
     then begin
      insertarelem(b.getelem(ib));
      ib:=ib+1;

       end;
     end;


     if (ic<=c.getdim()) then
     begin

    if (
    ( (c.getelem(ic)<=a.getelem(ia) )or not (ia<=a.getdim() ))
     and (c.getElem(ic)<=b.getelem(ib)) or not (ib<=b.getdim() )
     )
     then begin
      insertarelem(c.getelem(ic));
      ic:=ic+1;

       end;
     end;

  end;


end;

procedure Vector.DividirVectorPrimos(a:vector; b:vector);
var dima,a1,primos,b1,posi:integer;
begin


dima:=a.getdim();
a1:=1;
b1:=1;
primos:=0;

 for posi:=1 to dima do begin
  primos:=a.getelem(posi);
   if a.esprimo(primos) then begin
      self.insertarelem(a.getelem(posi));
   end else begin
      b.insertarelem(a.getelem(posi));


 end;


end;



end;

function Vector.esprimo(num: integer): boolean;
var cont,i:integer;
begin
  cont:=0;

  for i:=1 to num do begin
    if num mod i= 0 then begin
      cont:=cont+1;
    end;
  end;

  if cont=2 then begin
  result:=true;
  end else begin
   result:=false;
  end;

end;

procedure Vector.dividirVectorMultiplo(a: vector; b: vector);
var dima,a1,multiplo,b1,posi:integer;
begin


dima:=a.getdim();
a1:=1;
b1:=1;
multiplo:=0;

 for posi:=1 to dima do begin
  multiplo:=a.getelem(posi);
   if a.esmultiplo(multiplo) then begin
      self.insertarelem(a.getelem(posi));
   end else begin
      b.insertarelem(a.getelem(posi));


 end;


end;


end;

function Vector.esmultiplo(num: integer): boolean;
begin
  if num mod 3=0 then begin
   result:=true;
  end else begin
   result:=false;
  end;
end;

procedure Vector.PurgaOrdenada();
begin
   self.DimelimRep();
   self.ordenarvectores();
   showmessage('hay ' +inttostr(self.cortesdecontrolOrd)+' cortes de control');

end;

procedure Vector.DividirVectoresPorCortes();
var t,posi:integer;
begin
  self.ordenarvectores();
  t:=self.cortesdecontrolOrd;

  for posi:=1 to t do begin
   showmessage('El corte de control '+inttostr(posi)+' del vector contiene: ' +self.VectoresHastaUnCorte(posi));

  end;

end;

function Vector.VectoresHastaUnCorte(num: integer): string;
var i,aux,cc,k:integer;
     r:string;
begin
    i:=1;
   cc:=0;
   aux:=1;

   while (i<=dim-1) do begin
     k:=cc;
     if elem[i]<elem[i+1] then begin

       cc:=cc+1;
       r:=r+inttostr(elem[i])+', ';

       if cc=num then begin
       break;
       end;

     end else begin
       aux:=aux+1;
           r:=r+inttostr(elem[i])+', ';
     end;

      if cc<>k then begin
      aux:=1;
      r:='';

      end;

        i:=i+1;
     end;




   result:=r;

end;

procedure Vector.dividirVectorParEImpar(a: vector; b: vector);
var dima,a1,ParEImpar,b1,posi:integer;
begin


dima:=a.getdim();
a1:=1;
b1:=1;
ParEImpar:=0;

 for posi:=1 to dima do begin
  ParEImpar:=a.getelem(posi);
   if a.EsParOImpar(ParEImpar) then begin
      self.insertarelem(a.getelem(posi));
   end else begin
      b.insertarelem(a.getelem(posi));


 end;


end;


end;

function Vector.EsParOImpar(num: integer): boolean;
begin
  if num mod 2=0 then begin
   result:=true;
  end else begin
   result:=false;
  end;
end;

procedure Vector.Intercalar2Vectores(a: vector; b: vector);
var dimtotal,i:integer;
begin
dimtotal:=a.getdim+b.getdim;
i:=1;
  while i<=dimtotal do begin

    if i<=a.getdim then begin
     self.insertarelem(a.getelem(i));
    end;

    if i<=b.getdim then begin
     self.insertarelem(b.getelem(i));
    end;

  i:=i+1;

  end;


end;

procedure Vector.PurgarUsandoCortesDeControl();
var t,i:integer;
begin
   self.ordenarvectores();
   t:=self.CortesDeControlord;
   showmessage(inttostr(t));

   for i:=1 to t do begin
   self.corteElimRep(i);

   end;


end;

procedure Vector.corteElimRep(num: integer);
var i,aux,cc,k:integer;
begin
    i:=1;
   cc:=1;

   while (i<=dim-1) do begin
     if elem[i]<elem[i+1] then begin
        i:=i+1;
        cc:=cc+1;
     end else begin
       if cc=num then begin
       self.eliminarVec(i+1);
       end else begin
       i:=i+1;
       end;
     end;

     end;


end;

end.

