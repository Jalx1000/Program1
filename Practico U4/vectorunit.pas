unit VectorUnit;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils,Dialogs;
	const MAX_ELE=1200;
type

  { vector }

  vector = class
  private
    dim : integer; //DIMENSION DEL VECTOR
    elem : array [1..MAX_ELE] of integer; //TODO EL VECTOR //VECTOR ES SOLO DE ENTEROS

  public
	  constructor crear;
    function getDim():integer;
    function cantRep(elemABuscar:integer):integer;
    function getElem(pos:integer):integer;
    procedure cargarElem();
    procedure insertarElem(elemN:integer);//pone un elemento en la ultima posicion
    procedure setElem(elemN:integer;pos:integer);
    procedure eliminarElem(pos:integer);
    function corteControlC():integer;
    function frecuenciaCC():integer;
    procedure fusionAcendente(a,b:vector);
    procedure fusionDecendente(a,b:vector);
    procedure mezclar3vectoresAs(a,b,c:vector);
    procedure ordenarVectores();
    procedure ordenarVectoresDes();
    procedure primosNOprimos(a,b:vector);
    function esPrimo(num:integer):boolean;
  end;

implementation

{ vector }

constructor vector.crear;
var posi:integer;
begin
  for posi:=1 to 1000 do begin
    elem[posi]:=999999;
  end;

  dim:=0;
end;
function vector.getDim: integer;
begin
  Result:=dim;
end;
function vector.cantRep(elemABuscar: integer): integer;
var i,c,elemActual:integer;
begin
  c:=0;
  for i:=1 to dim do
  begin
    elemActual:=elem[i];
    if(elemABuscar=elemActual)then
      begin
      		 c:=c+1;
      end;
  end;
  Result:=c;
end;

function vector.getElem(pos: integer): integer;
begin
  Result:=elem[pos];
end;

procedure vector.cargarElem();
var i:integer;
		dimTeclado,elemTeclado:String;
begin
  	 dimTeclado:=InputBox('Introducir dim','','');
     dim:=StrToInt(dimTeclado);
     for i:=1 to dim do
     begin
       elemTeclado:=InputBox('Introducir elem: ' + IntToStr(i),'','');
       elem[i]:=StrToInt(elemTeclado);
     end;
end;
procedure vector.insertarElem(elemN: integer);
begin
   dim:=dim+1;
 	elem[dim]:=elemN;
end;
procedure vector.setElem(elemN: integer; pos: integer);
begin
   if(pos<=dim) then
   begin
     elem[pos]:=elemN;
   end;
end;
procedure vector.eliminarElem(pos: integer);
var i,j:integer;
    encontro:boolean;
begin
  encontro:=false;
  i:=1;
  while ((i < dim) and not encontro) do
  begin
    if( i=pos) then
  	  begin
        encontro:=true;
        for j:=i to (dim-1) do
        		begin
              elem[j]:=elem[j+1];
            end;
      end;
    i:=i+1;
  end;
  dim:=dim-1
end;

function vector.corteControlC: integer;
var i,cc:integer;
begin
  i:=1;
  cc:=0;
  while i<= dim-1 do
  begin
    if elem[i]<>elem[i+1] then
          begin
            cc:=cc+1
          end;
    i:=i+1;
  end;
  Result:=cc;
end;

function vector.frecuenciaCC: integer;
var i,fcc:integer;
begin
  i:=1;
  fcc:=1;
  while i<= dim-1 do
  begin
    if elem[i]<>elem[i+1] then
          begin
							 if(elem[i]=elem[i+1])then
                 begin
                   fcc:=1;
                 end else
                 begin
                   fcc:=fcc-1;
                 end;
          end else
          begin
            fcc:=fcc+1;
          end;
    i:=i+1;
  end;
  Result:=fcc;
end;

procedure vector.fusionAcendente(a,b:vector);
var dima,dimb,dimtotal,i,ia,ib:integer;
begin
  a.ordenarVectores();
  b.ordenarVectores();

  dima:=a.getDim();
  dimb:=b.getDim();
  dimtotal:=dima+dimb;

	i:=1;
  ia:=1;
  ib:=1;

  while i<=dimtotal do begin

    if (b.getElem(ib)<=a.getElem(ia)) and (ib<=dimb)  then begin
       self.insertarElem(b.getElem(ib));
       ib:=ib+1;

      end else if (b.getElem(ib)>=a.getElem(ia)) and (ia<=dima) then begin
 			  self.insertarElem(a.getElem(ia));
        ia:=ia+1;
      end;
    i:=i+1;

  end;

end;
procedure vector.fusionDecendente(a, b: vector);
var dima,dimb,dimTotal,ia,ib,i:integer;
begin
		 a.ordenarVectoresDes();
     b.ordenarVectoresDes();

     dima:=a.getDim();
     dimb:=b.getDim();
     dimTotal:=dima+dimb;

     i:=1;
     ia:=dima;
     ib:=dimb;

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

procedure vector.mezclar3vectoresAs(a, b, c: vector);
var ia,ib,ic:integer;
begin
ia:=1;
ib:=1;
ic:=1;

			while ( (ia<=a.getDim()) or (ib<=b.getDim()) or (ic<=c.getDim())) do
			  begin
          if (ia<=a.getDim()) then
            begin
						   if ( ( (a.getelem(ia)<=b.getelem(ib) )or not (ib<=b.getdim() ))
                  and (a.getElem(ia)<=c.getelem(ic)) or not (ic<=c.getdim() )) then
                 begin
                  insertarElem(a.getElem(ia));
                  ia:=ia+1;
                 end;
            end;

          if (ib<=b.getDim()) then
            begin
             if ( ( (b.getelem(ib)<=a.getelem(ia) )or not (ia<=a.getdim() ))
			       	  and (b.getElem(ib)<=c.getelem(ic)) or not (ic<=c.getdim() )) then
               insertarElem(b.getElem(ib));
             	 ib:=ib+1;
            end;

          if ( ic<= c.getDim() ) then
            begin
             if ( ( (c.getelem(ic)<=a.getelem(ia) )or not (ia<=a.getdim() ))
			       	  and (c.getElem(ic)<=c.getelem(ib)) or not (ib<=b.getdim() )) then
               begin
						   insertarElem(c.getElem(ic));
             	 ic:=ic+1;
               end;
            end;

        end;


end;

procedure vector.ordenarVectores;
var posi,aux,j:integer;
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
procedure vector.ordenarVectoresDes;
var posi,j,aux:integer;
begin
   for posi:=1 to dim do begin
     for j:=posi+1 to dim do begin
      if(elem[j]>elem[posi]) then begin
        aux:=elem[posi];
        elem[posi]:=elem[j];
        elem[j]:=aux;
      end;
     end;
   end;
end;

procedure vector.primosNOprimos(a, b: vector);
var dima,primos,i:integer;
begin
dima:=a.getDim();
primos:=0;

   for i:=1 to dima do begin
  primos:=a.getelem(i);
   if a.esprimo(primos) then begin
      self.insertarelem(a.getelem(i));
   end else begin
      b.insertarelem(a.getelem(i));
 end;
end;
end;
function vector.esPrimo(num: integer): boolean;
var c,i:integer;
begin
c:=0;

  for i:=1 to num do
      begin
       		 if num mod i  = 0 then
             begin
              c:=c+1;
             end;
      end;

   if c=2 then begin
  result:=true;
  end else begin
   result:=false;
  end;


end;

end.

