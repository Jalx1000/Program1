program practicoU0;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes
  { you can add units after this };

//Funciones y Procedimientos
procedure unoCien();
var i:integer;
  begin
    i:=1;
    while(i<=100)do
    begin
      write(i,' ');
      i:=i+1;
    end;
  end;
procedure cienUno();
var i:integer;
  begin
    i:=100;
    while(i>=0)do
    begin
      write(i,' ');
      i:=i-1;
    end;
  end;
procedure mayorMenor();
var a,b:integer;
begin
  writeln('Introduzca un numero: ');
  read(a);
  writeln('Introduzca un numero: ');
  read(b);
  if(a>b) then
   begin
        writeln(a,' es el mayor');
   end
   else
   begin
        writeln(b,' es el mayor')
   end;
end;
// 4
procedure entre40y80();
var i,n,a:integer;
begin
  write('Cuantos numeros desea ingresa: ');
  read(n);
  for i:=1 to n do
  begin
  writeln('Ingresar numero: ');
      read(a);

           if((a>=40) and (a<=80))then begin
                    writeln(a, 'esta en el rango::falta resolver!!');
           end else
           begin
                writeln(a,' no esta en el rango')
           end;
      end;
end;
procedure posYNeg();
var cpositivos,cnegativos,n,a,i:integer;
  begin
  writeln('Cuantos numero quiere ingresar?');
  readln(n);
  cpositivos:=0;
  cnegativos:=0;
  for i:=1 to n do
    begin
         writeln('Ingrese numero: ');
         read(a);
         if(a>=0) then
          begin
                cpositivos:=cpositivos+1;
          end else
          begin
               cnegativos:=cnegativos+1;
          end;
    end;
  writeln('Positivos: ',cpositivos,' Negativos: ',cnegativos);
  end;
procedure promedioParImpar();
var a,n,i,par,impar,coPar,coImpar:integer;
begin
writeln('Cuanto numeros desea ingresar "promedio de par o impar"?');
read(n);
par:=0;
impar:=0;
coPar:=0;
coImpar:=0;
for i:=1 to n do
  begin
       writeln('Ingrese numero: ');
       read(a);
       if((a mod 2)=0) then
        begin
              par:=par+a;
              coPar:=coPar+1;
        end else
        begin
             impar:=impar+a;
             coImpar:=coImpar+1;
        end;
  end;
      par:=par div coPar;
      impar:=impar div coImpar;
      writeln('Promedio de los pares: ',par);
      writeln('Promedio de los impares: ',impar);
end;
procedure cantidadMultiplos();
var i,n,multiplo4,multiplo7,multiplo3y5,a:integer;
begin
     write('Ingrese la cantidad de numero a ingresar "Cantidad de multiplos"');
     readln(n);
     multiplo4:=0;
     multiplo7:=0;
     multiplo3y5:=0;
     for i:=1 to n do
       begin
       write('Ingrese numero: ');
       readln(a);
       if ((a mod 4)=0) then
        begin
             multiplo4:=multiplo4+1;
        end else if((a mod 7)=0) then
        begin
             multiplo7:=multiplo7+1;
        end else if(((a mod 3)=0) or ((a mod 5)=0)) then
            begin
                 multiplo3y5:=multiplo3y5+1;
            end;
       end;
       writeln;
       writeln(multiplo4,' numeros son multiplos de 4');
       writeln(multiplo7,' numeros son multiplos de 7');
       writeln(multiplo3y5,' numeros son multiplos de 3 y 5');
end;
//9
procedure multilpo2o3();
var i,co2,co3:integer;
begin
  for i:=1 to 100 do
    begin
         write(i,' ');
         if ((i mod 2)=0)then
              begin
                   co2:=co2+1;
              end;
         if((i mod 3)=0)then
              begin
                   co3:=co3+1;
              end;
    end;
    writeln;
    writeln('Numero multiplos de 2: ',co2);
    writeln('Numero multiplos de 3: ',co3);
end;
procedure areaCircunferencia();

var r:integer;
    re:real;
begin
  writeln('Calculadora de Area de Circunferencia');
  writeln('Ingrese el radio');
  readln(r);
  re:=(3.1416)*(r*r);
  writeln('El area es: ',re:4:2);
end;
procedure distanciaEntre2Puntos();
var x1,y1,x2,y2:integer;
    d:real;
begin
  writeln('Ingresar los valores del primer punto (x1,y1)');
  readln(x1,y1);
  writeln('Ingresar los valores del segundo punto (x2,y2)');
  readln(x2,y2);
  d:=sqrt(((x2-x1)*(x2-x1))+((y2-y1)*(y2-y1)));
  writeln('La distancia entre 2 puntos es: ',d:4:2);
end;
procedure valorAbsoluto();
var a:integer;
begin
     writeln('Ingrese un numero: ');
     readln(a);
     if(a<0)then
          begin
               a:=a*(-1)
          end;
     writeln('El valor absoluto es: ',a)
end;
//15
//16
procedure celciusFahrenheit();
var c:integer;
    f:real;
begin
     writeln('Ingrese grados en Celcius: ');
     readln(c);
     f:=((c*1.8)+32);
     writeln('Convirtiendo a Fahrenheir es: ',f:4:2);
end;
procedure multiplo6y9();
var multiplo6y9:integer;
begin
     writeln('Ingrese un numero: ');
     read(multiplo6y9);
     if(multiplo6y9 mod 6 =0) then
          begin
               writeln(multiplo6y9,' es multiplo de 6');
          end else if(multiplo6y9 mod 9 = 0) then
               begin
                    writeln(multiplo6y9,' es multiplo de 9');
               end else
                   begin
                        writeln(multiplo6y9,' no es multiplo ni de 6 ni de 9');
                   end;
end;
procedure intercambioVariables();
var a,b:integer;
begin
  writeln('Ingresar un numero para intercambiar: ');
  read(a);
  writeln('Ingresar otro numero: ');
  read(b);
  if(a>b)then
  begin
       a:=b;
       writeln('varible intercambiada: ',a);
  end else
  begin
       writeln('Variable no intercambiada');
  end;
end;
procedure mayorDeTres();
var a,b,c:integer;
begin
   writeln('Mayor de tres numeros');
   writeln('Ingrese un numero: ');
   readln(a);
   writeln('Ingrese un numero: ');
   readln(b);
   writeln('Ingrese un numero: ');
   readln(c);

   if (a>b) then
   begin
        if(a>c) then
        begin
            writeln(a,' Es el mayor');
        end else
        begin
            writeln(c,' Es el mayor');
        end;


   end else
   begin
        if(b>c)then begin
             writeln(b,' Es el mayor');
        end else
        begin
             writeln(c,' Es el mayor');
        end;
   end;
end;
procedure MCD();
var a,b,x,maximo:integer;
begin
writeln('Ingresar un numero: ');
readln(a);
writeln('Ingresar un numero: ');
readln(b);
if ((a>0) and (b>0)) then
   begin
        maximo:=1;
        x:=1;
        while x<=a do
        begin
             if ( ((a mod x)=0) and ((b mod x)=0) ) then
                begin
                     if(x>maximo)then
                        begin
                             maximo:=x;
                        end;
                end;
             x:=x+1;
        end;
        writeln('El maximo comun divisor es: ',maximo);
   end else
       begin
            writeln('Debes ingresar otro numero');
       end;

end;
procedure salarioHorasTrabajadas();
var horas:integer;tarifa:real;
begin
     writeln('Calculadora de salario segun hora y tarifa');
     writeln('Ingrese horas trabajadas');
     readln(horas);
     writeln('Ingrese una tarifa de pago');
     readln(tarifa);

     if(horas>40)then
        begin
             tarifa:=(tarifa+(tarifa*0.5));
             writeln('La tarifa actuale es: ',tarifa:4:2);
        end;
     writeln('sin modificaciones!');
end;
procedure descuentoSueldo();
var sueldo,descuento,sueldoNeto:real;
begin
  writeln('Ingrese sueldo: ');
  readln(sueldo);
  if(sueldo<=1000)then
     begin
          descuento:=sueldo*0.1
     end else if(sueldo<=2000) then
        begin
             descuento:=(sueldo - 1000)* 0.05 + 1000 * 0.1;
        end else
        begin
             descuento:=(sueldo - 2000)* 0.03 + 1000 * 0.1;
        end;
        sueldoNeto:=sueldo-descuento;
        writeln('El descuento es: ',descuento:4:2);
        writeln('El sueldo neto es: ',sueldoNeto:4:2);
end;
procedure monto();
var monto,descuento:real;
begin
  writeln('Ingresar monto: ');
  readln(monto);
  if(monto>100)then
          begin
               descuento:=monto*0.1;
          end else
          begin
               descuento:=monto*0.2;
          end;
  writeln('El monto es: ',monto-descuento:4:2);
  writeln('El descuento es: ',descuento:4:2);
end;
procedure nNumeroNaturales();
var s,n,i:integer;
begin
  writeln('Ingresar un numero: ');
  readln(n);
  s:=0;
  i:=1;
  while i<=n do
  begin
  s:=s+i;
  i:=i+1;
  end;
  writeln(s);
end;
procedure estudiante();
var  i,n,nota,coNota,notaAprobada,totalnotaAprobada,notaReprobada,totalnotaReprobada,totalNota:integer;
begin
  writeln('Cuantas notas som: ');
  readln(n);
  coNota:=0;
  for i:=1 to n do
    begin
         writeln('Ingresar nota: ');
         readln(nota);

         if(nota>=51)then begin
              notaAprobada:=notaAprobada+1;
              totalNotaAprobada:=totalNotaAprobada+nota;
         end else
         begin
              notaReprobada:=notaReprobada+1;
              totalNotaReprobada:=totalNotaReprobada+nota;
         end;
         totalNota:=totalNota+nota;
         coNota:=coNota+1;
    end;
         writeln(notaAprobada,' estan aprobadas');
         writeln(notaReprobada,' estan reprobadas');
         writeln('El promedio en total es: ',totalNota div coNota);
         writeln('El promedio aprobadas es: ',totalNotaAprobada div notaAprobada);
         writeln('El promedio reprobadas es: ',totalNotaReprobada div notaReprobada);

end;
procedure NumeroNaturales50();
var p,impar,pos,neg,i,n:integer;
begin
     p:= 0;
     impar:= 0;
     pos:= 0;
     neg:= 0;
    for i:=1 to 50 do
    begin
         readln(n);
         if((n mod 2)=0) then
         begin
              p:=p+1;
         end else
         begin
              impar:=impar+1;
         end;

         if(n>0)then
         begin
              pos:=pos+1;
         end else if(n<0) then
         begin
              neg:=neg+1;
         end;

    end;
         writeln(p,' ',impar,' ', pos,' ', neg);
end;
procedure media100();
var s,i,media,n:integer;
begin
   s:=0;
   i:=1;
   writeln('Media de 100 numeros');
   while i<=100 do
   begin
        readln(n);
        s:=s+n;
        i:=i+1;
   end;
   media:=s div 100;
   writeln('La media es: ',media);
end;
procedure sumaProducto();
var contador,suma:integer;
    pro:double;
begin
  suma:=0;
  pro:=1;
  contador:=20;

  repeat
  suma:=suma+contador;
  pro:=(pro)*(contador);
  contador:=contador+2;

  until contador=400;

  writeln('El resultado de la suma es: ',suma);
  writeln('El resultado de la multiplicacion es: ',pro);
  writeln('Problema de SIGFPE')
end;
procedure ordenarMenorAMayor();
var
begin

end;

//Programa Principal
begin
  //unoCien();
  //readln;
  //cienUno();
  //readln;
  //mayorMenor();
  //readln;
  //entre40y80();
  //readln;
  //posYNeg();
  //readln;
  //promedioParImpar();
  //readln;
  //cantidadMultiplos();
  //readln;
  //multilpo2o3();
  //readln;
  //areaCircunferencia();
  //readln;
  //distanciaEntre2Puntos();
  //readln;
  //valorAbsoluto();
  //readln;
  //celciusFahrenheit();
  //readln;
  //multiplo6y9();
  //readln;
  //intercambioVariables();
  //readln;
  //mayorDeTres();
  //readln;
  //MCD();
  //readln;
  //salarioHorasTrabajadas();
  //readln;
  //descuentoSueldo(); //practicar
  //readln;
  //readln;
  //monto();
  //readln;
  //nNumeroNaturales();
  //readln;
  //estudiante();
  //readln;
  //NumeroNaturales50();
  //readln;
  //media100();
  //readln;
  //sumaProducto();
  //readln;
  ordenarMenorAMayor();
  readln;






end.

