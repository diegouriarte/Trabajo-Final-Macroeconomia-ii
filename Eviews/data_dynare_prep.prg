close @all

wfopen "C:\Users\diego\Dropbox\projects\Maestría\Ciclo 3\Macroeconomía II\Trabajo-Final-Macroeconomia-ii\GarciaCicco_et_al_2010 - peru\data_peru_trimestral_corregida_1980Q1-2018Q1.xls" range=serie_c_i_x_m!$A$1:$L$156 colhead=2 namepos=custom na="#N/A" names=(,"consumo_privado","consumo_publico","inversion_privada","inversion_publica","exportaciones","importaciones","pbi","inversion","consumo","tby","pob") @freq Q 1980Q1 @smpl @all

'
'tby.x13(save="d11", arimasmpl="1980Q1 2018Q1")  @x11(mode=pseudoadd)

'calculamos valores per capita del consumo total, inversión total, pbi, exportaciones e importaciones


%series = "PBI consumo inversion exportaciones importaciones"

for %y {%series}
	series ln_{%y}_capita =log( {%y} / pob * 1000000)
	ln_{%y}_capita.x13(save="d11", arimasmpl="1980Q1 2018Q1")  @x11()
next

tby.x13(save="d11", arimasmpl="1980Q1 2018Q1")  @x11(mode=add)


	
group grp1 ln_pbi_capita_d11 ln_inversion_cap_d11 ln_consumo_capit_d11 tby_d11

