LoadPackage( "DerivedCategories" );

field := GLOBAL_FIELD_FOR_QPA!.default_field;
#magma := HomalgFieldOfRationalsInMAGMA( );
magma := field;

SET_GLOBAL_FIELD_FOR_QPA( magma );
DISABLE_ALL_SANITY_CHECKS_AND_LOGIC[ 1 ] := true;
DISABLE_ALL_SANITY_CHECKS_AND_LOGIC[ 2 ] := true;
DISABLE_COLORS[ 1 ] := false;
SetInfoLevel( InfoDerivedCategories, 3 );
SetInfoLevel( InfoHomotopyCategories, 3 );
SetInfoLevel( InfoComplexCategoriesForCAP, 1 );

quiver := RightQuiver( "q", 3, [ [ "x0", 1, 2 ], [ "x1", 1, 2 ], [ "x2", 1, 2 ],
                                                                [ "y0", 2, 3 ], [ "y1", 2, 3 ], [ "y2", 2, 3 ] ] );;
# "quiver{Ω^0(0),Ω^1(1),Ω^2(2)}"

Qq := PathAlgebra( field, quiver );;

# 
# End(  )

A :=
  QuotientOfPathAlgebra(
    Qq,
    [ 
      Qq.x0 * Qq.y0 ,
      Qq.x1 * Qq.y1 ,
      Qq.x2 * Qq.y2 ,
      Qq.x0 * Qq.y1 + Qq.x1 * Qq.y0,
      Qq.x0 * Qq.y2 + Qq.x2 * Qq.y0,
      Qq.x1 * Qq.y2 + Qq.x2 * Qq.y1,
    ]
);;

C := CategoryOfQuiverRepresentations( A, magma );
C_injs := FullSubcategoryGeneratedByInjectiveObjects( C );
chains_C := ChainComplexCategory( C );
homotopy_C := HomotopyCategory( C );
derived_C := DerivedCategory( C );

ii := IndecInjectiveObjects( C );


# O, O(1), O(2)
T := [ ];

mats :=
  [ [ [ 1, 0, 0 ] ], [ [ 0, 1, 0 ] ], [ [ 0, 0, 1 ] ], [ [ 0, 0, 0 ], [ -1, 0, 0 ], [ 0, -1, 0 ] ], [ [ 1, 0, 0 ], [ 0, 0, 0 ], [ 0, 0, -1 ] ], 
    [ [ 0, 1, 0 ], [ 0, 0, 1 ], [ 0, 0, 0 ] ] ];
  
mats := List( mats, m -> MatrixByRows( field, m ) );

Add( T, QuiverRepresentation( A, [ 1, 3, 3 ], mats ) );

mats :=
[ [ [ 0, 0, 0, -1, 0, 0, 0, -1 ], [ 0, 0, 1, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 1, 0, 0 ] ],
  [ [ 1, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 1, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 1, 0 ] ],
  [ [ 0, 1, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 1, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 1 ] ],
  [ [ 0, 0, 0, 0, 0, -1 ], [ 0, 0, 1, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 1, 0 ], [ 0, -1, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0 ],
      [ 0, 0, 0, -1, 0, 0 ], [ 0, 0, 0, 0, -1, 0 ] ], [ [ 0, 0, 0, 0, 0, 0 ], [ -1, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, -1, 0 ],
      [ 0, 0, 0, 0, 0, 0 ], [ 0, 0, -1, 0, 0, 0 ], [ 0, 0, 0, 1, 0, 0 ], [ 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, -1 ] ],
  [ [ 1, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0 ], [ 0, 1, 0, 0, 0, 0 ], [ 0, 0, 1, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0 ],
      [ 0, 0, 0, 0, 1, 0 ], [ 0, 0, 0, 0, 0, 1 ], [ 0, 0, 0, 0, 0, 0 ] ] ];
      
mats := List( mats, m -> MatrixByRows( field, m ) );

Add( T, QuiverRepresentation( A, [ 3, 8, 6 ], mats ) );

mats :=
[ [ [ 0, 0, -1, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, -1, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, -1 ],
      [ 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0 ] ],
  [ [ 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
      [ 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0 ] ],
  [ [ 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
      [ 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 ] ],
  [ [ 0, 0, -1, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 1, 0, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, -1, 0, 0, 0 ], [ 0, 0, 0, 0, 1, 0, 0, 0, 0, 0 ],
      [ 0, 0, 0, 0, 0, 0, 0, 0, 0, -1 ], [ 0, 0, 0, 0, 0, 0, 1, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 1, 0, 0, 0, 0 ],
      [ 0, 0, 0, -1, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 0, 1, 0 ], [ 0, 0, 0, 0, 0, -1, 0, 0, 0, 0 ],
      [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 0, -1, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 0, -1, 0 ] ],
  [ [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], [ -1, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
      [ 0, -1, 0, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 0, -1, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, -1, 0, 0, 0, 0 ],
      [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, -1, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 0, -1, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
      [ 0, 0, 0, 0, 0, 0, -1, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 1, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 0, 0, -1 ] ],
  [ [ 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 1, 0, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
      [ 0, 0, 1, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 1, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 1, 0, 0, 0, 0, 0 ],
      [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 1, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 1, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
      [ 0, 0, 0, 0, 0, 0, 0, 0, 1, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 ], [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ] ] ];
      
mats := List( mats, m -> MatrixByRows( field, m ) );

Add( T, QuiverRepresentation( A, [ 6, 15, 10 ], mats ) );


collection := CreateExceptionalCollection( T : name_for_underlying_quiver := "{𝓞, 𝓞 (1), 𝓞 (2)}" );

HH := HomFunctor( collection );
R_HH := RightDerivedFunctor( HH );
HI := HomFunctorOnInjectiveObjects( collection );
homotopy_HH := PreCompose( LocalizationFunctorByInjectiveObjects( homotopy_C ), ExtendFunctorToHomotopyCategories( HI ) );

D := AsCapCategory( Range( HH ) );
D_projs := FullSubcategoryGeneratedByProjectiveObjects( D );
chains_D := ChainComplexCategory( D );
homotopy_D := HomotopyCategory( D );
derived_D := DerivedCategory( D );

TT := TensorFunctor( collection );
L_TT := LeftDerivedFunctor( TT );
TP := TensorFunctorOnProjectiveObjects( collection );
homotopy_TT := PreCompose( LocalizationFunctorByProjectiveObjects( homotopy_D ), ExtendFunctorToHomotopyCategories( TP ) );

eta := CounitOfTensorHomAdjunction( collection );
lambda := UnitOfTensorHomAdjunction( collection );

pp := IndecProjectiveObjects( D );

quit;

a := RandomObject( C, 7 )/chains_C/homotopy_C/derived_C;
#a := RANDOM_CHAIN_COMPLEX( chains_C, -3, 3, 2 )/homotopy_C/derived_C;

# Computing with the right and left derived functors -- slow
# we use the derived category
R_HH_a := ApplyFunctor( R_HH, a );
Display( R_HH_a );
L_TT_R_HH_a := ApplyFunctor( L_TT, R_HH_a );
Display( L_TT_R_HH_a );
c := UnderlyingCell( UnderlyingCell( L_TT_R_HH_a ) );
ViewComplex( c );
HomologyAt( c, 0 );
HomologyAt( UnderlyingCell( a ), 0 );

# Computing with homotopy_HH & homotopy_TT -- faster
# we use the homotopy category of the subcategory generated by injective & projective objects
homotopy_HH_a := ApplyFunctor( homotopy_HH, UnderlyingCell( a ) );
Display( homotopy_HH_a );
homotopy_TT_homotopy_HH_a := ApplyFunctor( homotopy_TT, homotopy_HH_a );
e := UnderlyingCell( homotopy_TT_homotopy_HH_a );
ViewComplex( e );
HomologyAt( e, 0 );
HomologyAt( UnderlyingCell( a ), 0 );


