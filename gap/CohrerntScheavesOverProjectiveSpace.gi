if IsPackageMarkedForLoading( "BBGG", ">= 2019.12.06" ) then
    
  ##
  InstallMethod( BeilinsonFunctor,
            [ IsHomalgGradedRing ],
    function( S )
      local n, A, cat, full, add_full, collection, iso, inc_1, inc_2, reps, homotopy_reps, name_for_algebra, name_for_quiver, BB, r, i;
      
      n := Size( Indeterminates( S ) );
      
      A := KoszulDualRing( S );
      
      cat := GradedLeftPresentations( S );
      
      full := FullSubcategoryGeneratedByTwistedOmegaModules( A );
      
      add_full := AdditiveClosure( full );
      
      DeactivateCachingOfCategory( add_full );
      
      CapCategorySwitchLogicOff( add_full );
      
      DisableSanityChecks( add_full );
      
      name_for_quiver := "quiver{";
      
      for i in Reversed( [ 0 .. n - 1 ] ) do
        
        if i <> 0 then
          name_for_quiver := Concatenation( name_for_quiver, "Ω^", String( i ),"(", String( i ) , ") -{", String( n - 1 ), "}-> " );
        else
          name_for_quiver := Concatenation( name_for_quiver, "Ω^", String( i ),"(", String( i ) , ")" );
        fi;
        
      od;
      
      name_for_quiver := Concatenation( name_for_quiver, "}" );
      
      name_for_algebra := Concatenation( "End(⊕ {Ω^i(i)|i=0,...,", String( n - 1 ), "})" );
      
      collection := CreateExceptionalCollection( full : 
                                                  name_for_underlying_quiver := name_for_quiver,
                                                  name_for_endomorphism_algebra := name_for_algebra
                                                );
      
      iso := IsomorphismIntoFullSubcategoryGeneratedByIndecProjRepresentationsOverOppositeAlgebra( collection );
      
      inc_1 := InclusionFunctor( AsCapCategory( Range( iso ) ) );
      
      iso := PreCompose( [ iso, inc_1 ] );
      
      iso := ExtendFunctorToAdditiveClosureOfSource( iso );
      
      reps := AsCapCategory( Range( iso ) );
      
      homotopy_reps := HomotopyCategory( reps );
      
      BB := CapFunctor( "Cotangent Beilinson functor", cat, homotopy_reps );
      
      AddObjectFunction( BB,
        function( a )
          local T, diffs, C;
          
          T := TateResolution( a );
          
          diffs := List( [ - n + 2 .. n - 1 ], i -> ApplyFunctor( iso, CAN_TWISTED_OMEGA_CELL( T ^ i ) ) );
          
          C := ChainComplex( diffs, - n + 2 );
          
          return C / homotopy_reps;
          
      end );
      
      AddMorphismFunction( BB,
        function( s, alpha, r )
          local T, maps;
          
          s := UnderlyingCell( s );
          
          r := UnderlyingCell( r );
          
          T := TateResolution( alpha );
          
          maps := List( [ - n + 1 .. n - 1 ], i -> ApplyFunctor( iso, CAN_TWISTED_OMEGA_CELL( T[ i ] ) ) );
          
          return ChainMorphism( s, r, maps, - n + 1 ) / homotopy_reps;
          
      end );
      
      return BB;
      
  end );
  
  ##
  #InstallMethod( 
  BindGlobal( "BeilinsonFunctor2",
     #       [ IsHomalgGradedRing ],
    function( S )
      local n, A, cat, full, add_full, iso, add_cotangent_modules, homotopy_cat, r, name, BB;
      
      n := Size( Indeterminates( S ) );
      
      A := KoszulDualRing( S );
      
      cat := GradedLeftPresentations( S );
      
      full := FullSubcategoryGeneratedByTwistedOmegaModules( A );
      
      add_full := AdditiveClosure( full );
      
      DeactivateCachingOfCategory( add_full );
      
      CapCategorySwitchLogicOff( add_full );
      
      DisableSanityChecks( add_full );
           
      iso := IsomorphismFromFullSubcategoryGeneratedByTwistedOmegaModulesIntoTwistedCotangentModules( S );
      
      iso := ExtendFunctorToAdditiveClosures( iso );
      
      add_cotangent_modules:= AsCapCategory( Range( iso ) );
      
      homotopy_cat := HomotopyCategory( add_cotangent_modules);
      
      name := "Cotangent Beilinson functor";
      
      BB := CapFunctor( name, cat, homotopy_cat );
      
      AddObjectFunction( BB,
        function( a )
          local T, diffs, C;
          
          T := TateResolution( a );
          
          diffs := List( [ - n + 2 .. n - 1 ], i -> ApplyFunctor( iso, CAN_TWISTED_OMEGA_CELL( T ^ i ) ) );
          
          C := ChainComplex( diffs, - n + 2 );
          
          return C / homotopy_cat;
          
      end );
      
      AddMorphismFunction( BB,
        function( s, alpha, r )
          local T, maps;
          
          s := UnderlyingCell( s );
          
          r := UnderlyingCell( r );
          
          T := TateResolution( alpha );
          
          maps := List( [ - n + 1 .. n - 1 ], i -> ApplyFunctor( iso, CAN_TWISTED_OMEGA_CELL( T[ i ] ) ) );
          
          return ChainMorphism( s, r, maps, - n + 1 ) / homotopy_cat;
          
      end );
      
      return BB;
      
  end );

  ##
  #InstallMethod( 
  BindGlobal( "BeilinsonFunctor3",
     #       [ IsHomalgGradedRing ],
    function( S )
      local n, A, cat, full, add_full, homotopy_cat, r, name, BB;
      
      n := Size( Indeterminates( S ) );
      
      A := KoszulDualRing( S );
      
      cat := GradedLeftPresentations( S );
      
      full := FullSubcategoryGeneratedByTwistedOmegaModules( A );
      
      add_full := AdditiveClosure( full );
      
      DeactivateCachingOfCategory( add_full );
       
      homotopy_cat := HomotopyCategory( add_full );
      
      name := "Cotangent Beilinson functor";
      
      BB := CapFunctor( name, cat, homotopy_cat );
      
      AddObjectFunction( BB,
        function( a )
          local T, diffs, C;
          
          T := TateResolution( a );
          
          diffs := List( [ - n + 2 .. n - 1 ], i -> CAN_TWISTED_OMEGA_CELL( T ^ i ) );
          
          C := ChainComplex( diffs, - n + 2 );
          
          return C / homotopy_cat;
          
      end );
      
      AddMorphismFunction( BB,
        function( s, alpha, r )
          local T, maps;
          
          s := UnderlyingCell( s );
          
          r := UnderlyingCell( r );
          
          T := TateResolution( alpha );
          
          maps := List( [ - n + 1 .. n - 1 ], i -> CAN_TWISTED_OMEGA_CELL( T[ i ] ) );
          
          return ChainMorphism( s, r, maps, - n + 1 ) / homotopy_cat;
          
      end );
      
      return BB;
      
  end );

  ##
  InstallMethod( RestrictionOfBeilinsonFunctorToFullSubcategoryGeneratedByTwistsOfStructureSheaf,
            [ IsHomalgGradedRing ],
    function( S )
      local BB, homotopy_reps, full, name, F, r;
      
      BB := BeilinsonFunctor( S );
      
      homotopy_reps := AsCapCategory( Range( BB ) );
      
      full := FullSubcategoryGeneratedByTwistsOfStructureSheaf( S );
      
      name := "Cotangent Beilinson functor";
      
      F := CapFunctor( name, full, homotopy_reps );
      
      AddObjectFunction( F,
        o -> ApplyFunctor( BB, UnderlyingHonestObject( UnderlyingCell( o ) ) )
      );
      
      AddMorphismFunction( F,
        { s, alpha, r } -> ApplyFunctor( BB, HonestRepresentative( UnderlyingGeneralizedMorphism( UnderlyingCell( alpha ) ) ) )
      );
      
      return F;
      
  end );
    
fi;
