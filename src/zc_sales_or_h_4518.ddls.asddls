@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Order header - Consupmtions Entity'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZC_SALES_OR_H_4518
  provider contract transactional_query
  as projection on ZI_SALES_OR_H_4518

{
  key SoUUID,
      SoID,
      Email,
      FirstName,
      LastName,
      Country,
      CreateOn,
      DeliveryDate,
      @ObjectModel.text.element: [ 'StatusText' ]
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZI_SALES_OR_STATUS_VH_4518', element: 'StatusCode' } }]
      OrderStatus,
      _Status.StatusText as StatusText,
      ImageUrl,
      StatusCriticality,
      @Semantics.user.createdBy: true
      CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      CreatedAt,
      @Semantics.user.lastChangedBy: true
      LastChangedBy,
      @Semantics.systemDateTime.lastChangedAt: true
      LastChangedAt,
      /* Associations */
      _Item : redirected to composition child ZC_SALES_OR_P_4518,
      _Status
}
