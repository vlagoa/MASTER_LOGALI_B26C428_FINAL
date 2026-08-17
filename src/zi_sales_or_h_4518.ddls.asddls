@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Order header - Entity Interface'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZI_SALES_OR_H_4518
  as select from zsales_or_h_4518
  composition [0..*] of ZI_SALES_OR_P_4518         as _Item
  association [0..1] to ZI_SALES_OR_STATUS_VH_4518 as _Status on $projection.OrderStatus = _Status.StatusCode
  //association [1..1] to I_Country
{
  key so_uuid                                as SoUUID,
      so_id                                  as SoID,
      email                                  as Email,
      first_name                             as FirstName,
      last_name                              as LastName,
      country                                as Country,
      create_on                              as CreateOn,
      delivery_date                          as DeliveryDate,
      cast( order_status as abap.char( 3 ) ) as OrderStatus,
      image_url                              as ImageUrl,
      
      case order_status
         when 001 then 2         //OPEN - Orange
          when 002 then 5         //In process - Blue
          when 003 then 3         //Complete - Green
          else 0                  //Neutro
        end                                  as StatusCriticality,

      @Semantics.user.createdBy: true
      created_by                             as CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      created_at                             as CreatedAt,
      @Semantics.user.lastChangedBy: true
      last_changed_by                        as LastChangedBy,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at                        as LastChangedAt,
       @Semantics.systemDateTime.localInstanceLastChangedAt: true 
      local_last_changed_at as LocalLastChangedAt,                    

      _Item,
      _Status
}
