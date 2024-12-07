espacioDePropiedad(juan,120).
espacioDePropiedad(fer,110).
espacioDePropiedad(rocio,120).

ambientes(nico,3,banios(2)).
ambientes(nico,3,banios(1)).
ambientes(vale,4,banios(1)).

viveEn(alf,almagro).
viveEn(nico,almagro).
viveEn(juan,almagro).
viveEn(juan,almagro).
viveEn(vale,flores).
viveEn(fer,flores).

loft(julian,2000).
%No se modela Rocio ya que no vive en dicha casa de 90 metros sino que lo desea, y en la base debe haber hechos.
%Punto 2
esBarrioCopado(Barrio,Persona):-
    viveEn(Persona,Barrio),
    forall((viveEn(Persona,Barrio)), tienePropiedadCopada(Persona)).
    
tienePropiedadCopada(Persona):-
    espacioDePropiedad(Persona,MetrosCuadrados),
    MetrosCuadrados>100.
tienePropiedadCopada(Persona):-
    ambientes(Persona,Ambientes,_),
    Ambientes>3.
tienePropiedadCopada(Persona):-
    ambientes(Persona,_,banios(CantidadDeBanios)),
    CantidadDeBanios<1.
tienePropiedadCopada(Persona):-
    loft(Persona,AnioDeConstruccion),
    AnioDeConstruccion>2015.


%Punto 3
esBarrioCaro(Barrio):-
 viveEn(Persona,Barrio),
 forall(viveEn(Persona,Barrio),tienePropiedadBarata(Persona)).


tienePropiedadBarata(Persona):-
    loft(Persona,AnioDeConstruccion),
    AnioDeConstruccion<2005.
tienePropiedadBarata(Persona):-
    espacioDePropiedad(Persona,MetrosCuadrados),
    MetrosCuadrados<90.
tienePropiedadBarata(Persona):-
    ambientes(Persona,Ambientes,_),
    Ambientes=<2.

%Punto 4

sePuedeComprar(DineroDisponible,Casas,Sobrante):-
 subListasDeCasas(Casas),   
 precioDeCasas(Casas,PrecioTotal),
 DineroDisponible>=PrecioTotal,
 Sobrante is DineroDisponible-PrecioTotal.

preciosDecasas([Casa|DemasCasas],PrecioTotal):-
    valorDeCasa(Casa,PrecioDeCasa),
    precioDeCasas([DemasCasas],PrecioTotal+PrecioDeCasa).

precioDeCasas([Casa],PrecioTotal):-
    valorDeCasa(Casa,PrecioDeCasa),
    precioDeCasas([DemasCasas],PrecioTotal+PrecioDeCasa).
precioDeCasas([],PrecioDeCasa).




valorDeCasa(juan,150000).
valorDeCasa(nico,80000).
valorDeCasa(alf,75000).
valorDeCasa(julian,140000).
valorDeCasa(vale,95000).
valorDeCasa(fer,60000).



subListasDeCasas([],[]).
subListasDeCasas([_|Cola],SubLista):-subListasDeCasas(Cola,SubLista).
subListasDeCasas([Cabeza,Cola],[Cabeza|SubLista]):-subListasDeCasas(Cola,SubLista).%Punto 4

