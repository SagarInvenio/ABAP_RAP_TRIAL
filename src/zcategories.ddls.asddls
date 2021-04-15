/********** GENERATED on 03/23/2021 at 09:18:39 by CB0000000127**************/
 @OData.entitySet.name: 'Categories' 
 @OData.entityType.name: 'Category' 
 define root abstract entity ZCATEGORIES { 
 key CategoryID : abap.int4 ; 
 CategoryName : abap.char( 15 ) ; 
 @Odata.property.valueControl: 'Description_vc' 
 Description : abap.string( 0 ) ; 
 Description_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'Picture_vc' 
 Picture : abap.raw( 16 ) ; 
 Picture_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 } 
