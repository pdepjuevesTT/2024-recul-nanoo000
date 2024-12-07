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

