close @all

'importamos datos del pbi
wfopen "C:\Users\diego\Dropbox\projects\Maestr�a\Ciclo 3\Macroeconom�a II\Trabajo Final\Data BCR\serie_pbi.csv" ftype=ascii rectype=crlf skip=1 fieldtype=delimited delim=comma colhead=1 namepos=custom colheadnames=("Description") names=(periodo,pbi) eoltype=pad badfield=NA @freq Q 1980Q1 @smpl @all

'importamos datos de consumo, inversion, exportaciones e importaciones
wfopen "C:\Users\diego\Dropbox\projects\Maestr�a\Ciclo 3\Macroeconom�a II\Trabajo Final\Data BCR\serie_c_i_x_m.csv" ftype=ascii rectype=crlf skip=1 fieldtype=delimited delim=comma colhead=1 namepos=custom colheadnames=("Description") names=(periodo,Consumo_privado,Consumo_publico,Inversionprivada,Inversionpublica,Exportaciones,Importaciones) eoltype=pad badfield=NA @freq Q 1980Q1 @smpl @all
copy SERIE_PBI::SERIE_PBI\PBI *
wfclose "c:\users\diego\dropbox\projects\maestr�a\ciclo 3\macroeconom�a ii\trabajo final\eviews\serie_pbi.wf1"

subroutine tratamiento_datos(series original)
	%d11 = "_d11"
	%name = original.@name
'desestacionalizamos
	original.x13(save="d11", arimasmpl="1980Q1 2018Q1")  @x11()
'aplicamos log
	series ln_{%name} = log({%name}{%d11})
'aplicamos bkf
    	ln_{%name}.bpf(noncyc=tendencial_{%name}) ciclico_{%name}
endsub

'des-estacionalizamos, aplicamos logaritmo y filtramos todas las series de interes con el procedimiento tratamiento de datos

call tratamiento_datos(Inversionpublica)
for %y pbi consumo_privado consumo_publico exportaciones importaciones inversionprivada inversionpublica
	call tratamiento_datos({%y})
next

'para replicar paper, totamos sample de 1994Q1 a 2005Q3'
smpl 1994Q1 2005Q3
'
'generamos tabla resumen

table(13,2) resumen_correlaciones


resumen_correlaciones(1,1) = "retraso"
'resumen_correlaciones(1,2) = %name
for !j=-6 to 6
	resumen_correlaciones(!j+8,1) = !j
next
resumen_correlaciones.title Tabla Correlaciones Din�micas

'definimos subroutine para generar correlaciones
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

'llenamos la tabla con tadas las correlaciones din�micas
!i = 2
for %y pbi consumo_privado consumo_publico exportaciones importaciones inversionprivada inversionpublica
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

resumen_correlaciones.table
resumen_correlaciones.save(t=csv, n = "NA") tabla_correlaciones

