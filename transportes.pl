%
% red semantica
%

es_un(aereo, transporte).
es_un(terrestre, transporte).
es_un(maritimo, transporte).
	de_tipo(avion, aereo).
	de_tipo(avioneta, aereo).
	de_tipo(helicopteco, aereo).
	de_tipo(planeador, aereo).
	de_tipo(paramotor, aereo).
	de_tipo(dron, aereo).
	de_tipo(autobus, terrestre).
	de_tipo(automovil, terrestre).
	de_tipo(bicicleta, terrestre).
	de_tipo(camioneta, terrestre).
	de_tipo(camion, terrestre).
	de_tipo(motocicleta, terrestre).
	de_tipo(tanque, terrestre).
	de_tipo(balsa, maritimo).
	de_tipo(barco, maritimo).
	de_tipo(buque, maritimo).
		atributo(avion, nadar, no_puede).
		atributo(avioneta, volar, puede).
		atributo(helicopteco, helices, tiene).
		atributo(planeador, girar, no_puede).
		atributo(paramotor, volar, puede).
		atributo(dron, alas, tiene).
		atributo(autobus, llantas, tiene).
		atributo(autobus, timon, tiene).
		atributo(autobus, puertas, tiene).
		atributo(autobus, saltar, no_puede).
		atributo(automovil, llantas, usa).
		atributo(autobus, saltar, no_puede).
		atributo(autobus, volar, no_puede).
		atributo(bicicleta, llantas, tiene).
		atributo(camioneta, grande, es).
		atributo(camioneta, pesada, es).
		atributo(autobus, saltar, no_puede).
		atributo(camion, rapido, camina).
		atributo(motocicleta, espejos, tiene).
		atributo(motocicleta, llantas, tiene).
		atributo(tanque, pesado, es_muy).
		atributo(balsa, velas, usa).
		atributo(barco, botes, tiene).
		atributo(buque, botes, usa).
		atributo(buque, velas, usa).
		atributo(autobus, nadar, no_puede).
			particular(autobus, saltar, puede).
			particular(buque, nadar, puede).

%
% consultas
%

es_un_transporte(X):-de_tipo(X, Z), es_un(Z, Y).
% es_un_transporte(barco).
es_un_tipo_de_transporte(X):-es_un(X, Y), (X=aereo; X=terrestre; X=maritimo).
% es_un_tipo_de_transporte(aereo).
es_un_transporte_terrestre(X):-de_tipo(X, Y), Y=terrestre.
% es_un_transporte_terrestre(automovil).
es_un_transporte_aereo(X):-de_tipo(X, Y), Y=aereo.
% es_un_transporte_aereo(avion).
es_un_transporte_maritimo(X):-de_tipo(X, Y), Y=maritimo.
% es_un_transporte_maritimo(barco).
comprobar_atributos_por_transporte(X, Y, Z):-atributo(X, Z, Y).
% comprobar_atributos_por_transporte(avioneta, volar, puede).
comprobar_atributos_por_tipo_de_transporte(X, Y, Z):-es_un(X, V),de_tipo(W, X),atributo(W, Z, Y).
% comprobar_atributos_por_tipo_de_transporte(aereo, puede, volar).
atributos_aereos(X, Y):-de_tipo(V, W), W=aereo, atributo(V, Y, X).
% atributos_aereos(puede, volar).
atributos_terrestres(X, Y):-de_tipo(V, W), W=terrestre, atributo(V, Y, X).
% atributos_terrestres(tiene, llantas).
atributos_maritimos(X, Y):-de_tipo(V, W), W=maritimo, atributo(V, Y, X).
% atributos_maritimos(usa, velas).