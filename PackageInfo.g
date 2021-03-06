#
# DerivedCategories: Gap package to create derived categories
#
# This file contains package meta data. For additional information on
# the meaning and correct usage of these fields, please consult the
# manual of the "Example" package as well as the comments in its
# PackageInfo.g file.
#
SetPackageInfo( rec(

PackageName := "DerivedCategories",
Subtitle := "Gap package to create derived categories",
Version := "2020.05.21",
Date := ~.Version{[ 1 .. 10 ]},
Date := Concatenation( ~.Date{[ 9, 10 ]}, "/", ~.Date{[ 6, 7 ]}, "/", ~.Date{[ 1 .. 4 ]} ),
License := "GPL-2.0-or-later",

Persons := [
  rec(
    IsAuthor := true,
    IsMaintainer := true,
    FirstNames := "Kamal",
    LastName := "Saleh",
    WWWHome := "https://github.com/kamalsaleh",
    Email := "kamal.saleh@uni-siegen.de",
    PostalAddress := Concatenation(
               "Department Mathematik\n",
               "Universität Siegen\n",
               "Walter-Flex-Straße 3\n",
               "57068 Siegen\n",
               "Germany" ),
    Place := "Siegen University",
    Institution := "University of Siegen",
  ),
],

SourceRepository := rec( Type := "git", URL := "https://github.com/kamalsaleh/DerivedCategories" ),
IssueTrackerURL := "https://github.com/kamalsaleh/DerivedCategories/issues",
PackageWWWHome := "https://github.com/kamalsaleh/DerivedCategories",
PackageInfoURL := Concatenation( ~.PackageWWWHome, "PackageInfo.g" ),
README_URL     := Concatenation( ~.PackageWWWHome, "README.md" ),
ArchiveURL     := Concatenation( ~.PackageWWWHome,
                                 "/", ~.PackageName, "-", ~.Version ),

ArchiveFormats := ".tar.gz",

##  Status information. Currently the following cases are recognized:
##    "accepted"      for successfully refereed packages
##    "submitted"     for packages submitted for the refereeing
##    "deposited"     for packages for which the GAP developers agreed
##                    to distribute them with the core GAP system
##    "dev"           for development versions of packages
##    "other"         for all other packages
##
Status := "dev",

AbstractHTML   :=  "",

PackageDoc := rec(
  BookName  := "DerivedCategories",
  ArchiveURLSubset := ["doc"],
  HTMLStart := "doc/chap0.html",
  PDFFile   := "doc/manual.pdf",
  SixFile   := "doc/manual.six",
  LongTitle := "Gap package to create derived categories",
),

Dependencies := rec(
  GAP := ">= 4.9",
  NeededOtherPackages := [
        [ "QPA", ">= 2.0-dev"],
        [ "CAP", ">= 2020.04.16" ],
        [ "Algebroids", ">= 2020.04.24" ],
        [ "SubcategoriesForCAP", ">= 2020.02.01" ],
        [ "HomotopyCategories", ">= 2020.05.23" ]
          ],
  SuggestedOtherPackages := [
            [ "BBGG", ">= 2020.05.01" ],
            [ "NConvex", ">= 2019.12.06" ],
            [ "4ti2Interface", ">= 2019.09.03" ]
          ],
  ExternalConditions := [ ],
),

AvailabilityTest := ReturnTrue,

TestFile := "tst/testall.g",

#Keywords := [ "TODO" ],

));


