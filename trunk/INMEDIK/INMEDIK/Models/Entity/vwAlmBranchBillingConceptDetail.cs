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
    
    public partial class vwAlmBranchBillingConceptDetail
    {
        public int AlmBranchRequestToDeliveryId { get; set; }
        public int ToDeliveryTransactionId { get; set; }
        public int ConceptId { get; set; }
        public string Name { get; set; }
        public bool Iva { get; set; }
        public decimal Price { get; set; }
        public decimal ToSend { get; set; }
        public Nullable<decimal> Received { get; set; }
        public Nullable<int> Returned { get; set; }
    }
}
