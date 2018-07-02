close @all


'importamos datos del pbi
wfopen "C:\Users\diego\Dropbox\projects\Maestría\Ciclo 3\Macroeconomía II\Trabajo Final\Data BCR\serie_pbi.csv" ftype=ascii rectype=crlf skip=1 fieldtype=delimited delim=comma colhead=1 namepos=custom colheadnames=("Description") names=(periodo,pbi) eoltype=pad badfield=NA @freq Q 1980Q1 @smpl @all

'importamos datos de consumo, inversion, exportaciones e importaciones
wfopen "C:\Users\diego\Dropbox\projects\Maestría\Ciclo 3\Macroeconomía II\Trabajo Final\Data BCR\serie_c_i_x_m.csv" ftype=ascii rectype=crlf skip=1 fieldtype=delimited delim=comma colhead=1 namepos=custom colheadnames=("Description") names=(periodo,Consumo_privado,Consumo_publico,Inversionprivada,Inversionpublica,Exportaciones,Importaciones) eoltype=pad badfield=NA @freq Q 1980Q1 @smpl @all
copy SERIE_PBI::SERIE_PBI\PBI *
wfclose "c:\users\diego\dropbox\projects\maestría\ciclo 3\macroeconomía ii\trabajo final\eviews\serie_pbi.wf1"

'colocamos las fechas de inicio y fin

%inicio = "1980Q1"
%fin = "2018Q1"
%esp = " "
%arima_mpl = %inicio + %esp + %fin
smpl {%inicio} {%fin}

'funcion para destacionarliar y aplicar filtro
subroutine tratamiento_datos(series original)
	%d11 = "_d11"
	%name = original.@name
	if (%name = "TBY") then
	'aplicamos filtro directo, porque serie tiene valores negativos
	{%name}.bpf(noncyc=tendencial_{%name}) ciclico_{%name}
	else
	'desestacionalizamos
	original.x13(save="d11", arimasmpl=%arima_mpl)  @x11()
	'aplicamos log
	series ln_{%name} = log({%name}{%d11})
	'aplicamos bkf
    	ln_{%name}.bpf(noncyc=tendencial_{%name}) ciclico_{%name}
	endif
endsub


'generamos serie tby
series tby = (exportaciones - importaciones)/pbi

'des-estacionalizamos, aplicamos logaritmo y filtramos todas las series de interes con el procedimiento tratamiento de datos

%series = "pbi consumo_privado consumo_publico exportaciones importaciones inversionprivada inversionpublica tby" 

for %y {%series} 
	call tratamiento_datos({%y})
next



'generamos tabla resumen

table(13,2) resumen_correlaciones


resumen_correlaciones(1,1) = "retraso"
'resumen_correlaciones(1,2) = %name
for !j=-6 to 6
	resumen_correlaciones(!j+8,1) = !j
next
resumen_correlaciones.title Tabla Correlaciones Dinámicas

'definimos subroutine para generar correlaciones para tabla 1
subroutine local correlaciones(series serie1, series serie2, table resumen, scalar i)
	group grp1 serie1 serie2
	freeze(table1) grp1.cross(12)
	%name = @replace(serie2.@name, "CICLICO_", "")
	resumen(1,i) = %name

	resumen(8,i) = table1(8,4)
	for !j=1 to 6
		resumen(!j+1,i) = table1(15-!j,4)
		resumen(!j+8,i) = table1(8+!j,5)
	next
endsub

'definimos subroutine para generar correlaciones para tabla 2
subroutine local correlaciones1(series serie1, series serie2, table resumen, scalar i)
	group grp1 serie1 serie2
	freeze(table1) grp1.cross(10)
	resumen(i,8) = @val(table1(8,4))
	for !j=1 to 5
		resumen(i,!j+2) = @val(table1(14-!j,4))
		resumen(i,14-!j) = @val(table1(14-!j,5))
	next
endsub


'llenamos la tabla con tadas las correlaciones dinámicas

!i = 2
for %y {%series}
	call correlaciones(ciclico_pbi, ciclico_{%y}, resumen_correlaciones, !i)
	!i = !i +1 
next

'llenamos datos de volatilidades relativas
resumen_correlaciones(15,1) = "volatilidad"


!i = 2
for %y pbi consumo_privado consumo_publico exportaciones importaciones inversionprivada inversionpublica
	resumen_correlaciones(15,!i) = @stdev(ciclico_{%y}) /  @stdev(ciclico_pbi) 
	!i = !i +1 
next

resumen_correlaciones.setfont(1) +b
resumen_correlaciones.setformat(A) f.0
resumen_correlaciones.setlines(a1:h14) +a


'''' GENERAMOS OTRA TABLA PARA OUTPUT DE LATEX

table(2,13) tabla_latex


tabla_latex.setmerge(r1c3:r1c13)
tabla_latex(1,3) = "Correlaciones cruzadas del PBI real con"
tabla_latex(1,2) = "Volatilidad Relativa"

%series_labels = """Variables"" ""Producto Bruto Interno"" ""Consumo Privado"" ""Inversion Privada"" ""Consumo Público"" ""Inversión Pública"" ""Exportaciones"" ""Importaciones"" ""Exportaciones netas"""

!i = 2
for %c {%series_labels}
	tabla_latex(!i, 1) = %c
	!i = !i + 1
next

%column_labels = "x(t-5) x(t-4) x(t-3) x(t-2) x(t-1) x(t) x(t+1) x(t+2) x(t+3) x(t+4) x(t+5)"
!i = 3
for %x {%column_labels}
	tabla_latex(2,!i) = %x
	!i = !i +1
next

%series = %series + " " + "tby"

'generamos los datos de volatilidad relativa
!i = 3
for %y pbi consumo_privado inversionprivada consumo_publico inversionpublica exportaciones importaciones tby
	tabla_latex(!i,2) = @stdev(ciclico_{%y}) /  @stdev(ciclico_pbi) 
	!i = !i +1 
next


pbi_d11.bpf(noncyc=tendencial_pbi_nivel) ciclico_pbi_nivel
scalar dato =  @stdev(ciclico_tby) / @stdev(ciclico_pbi_nivel) 


'llenamos la tabla con todas las correlaciones dinámicas
!i = 3
for %y pbi consumo_privado inversionprivada consumo_publico inversionpublica exportaciones importaciones tby
	call correlaciones1(ciclico_pbi, ciclico_{%y}, tabla_latex, !i)
	!i = !i +1 
next


tabla_latex.setformat(b3:m10) f.2
tabla_latex.setjust(@all) auto
tabla_latex.setjust(b2:m9) center
tabla_latex.setjust(c1) center
tabla_latex.setlines(a1:m2) +t +b
tabla_latex.setlines(c1:m2) +h
tabla_latex.table
tabla_latex.save(t=csv, n = "NA") tabla_latex_{%inicio}_{%fin}


