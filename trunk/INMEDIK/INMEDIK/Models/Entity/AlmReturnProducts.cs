//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace INMEDIK.Models.Entity
{
    using System;
    using System.Collections.Generic;
    
    public partial class AlmReturnProducts
    {
        public int Id { get; set; }
        public string Reason { get; set; }
        public int Quantity { get; set; }
        public int ConceptId { get; set; }
        public int AlmReturnId { get; set; }
        public System.DateTime Created { get; set; }
        public Nullable<int> AlmStockId { get; set; }
        public Nullable<int> AlmSupplierRequestToDeliveryTransactionId { get; set; }
    
        public virtual AlmReturn AlmReturn { get; set; }
        public virtual Concept Concept { get; set; }
        public virtual AlmStock AlmStock { get; set; }
        public virtual AlmSupplierRequestToDeliveryTransaction AlmSupplierRequestToDeliveryTransaction { get; set; }
    }
}
