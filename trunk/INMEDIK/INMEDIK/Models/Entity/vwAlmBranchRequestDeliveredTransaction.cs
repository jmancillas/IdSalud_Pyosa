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
    
    public partial class vwAlmBranchRequestDeliveredTransaction
    {
        public int AlmBranchRequestDeliveredTransactionId { get; set; }
        public int AlmBranchRequestDeliveredId { get; set; }
        public int AlmBranchRequestToDeliveryId { get; set; }
        public int ConceptId { get; set; }
        public string ConceptName { get; set; }
        public string Code { get; set; }
        public decimal ToSend { get; set; }
        public bool Iva { get; set; }
        public decimal Sended { get; set; }
        public decimal Price { get; set; }
        public decimal MinPrice { get; set; }
        public System.DateTime Created { get; set; }
        public System.DateTime Updated { get; set; }
        public Nullable<System.DateTime> ExpiredDate { get; set; }
        public decimal MaxPrice { get; set; }
        public Nullable<int> returned { get; set; }
        public string Batch { get; set; }
    }
}
