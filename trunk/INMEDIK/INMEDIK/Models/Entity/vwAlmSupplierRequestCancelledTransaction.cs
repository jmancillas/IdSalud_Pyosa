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
    
    public partial class vwAlmSupplierRequestCancelledTransaction
    {
        public int AlmSupplierRequestTransactionId { get; set; }
        public int AlmSupplierRequestCancelledTransactionId { get; set; }
        public int AlmSupplierRequestCancelledId { get; set; }
        public int SupplierRequestId { get; set; }
        public int ConceptId { get; set; }
        public string Name { get; set; }
        public string Code { get; set; }
        public decimal Requested { get; set; }
        public bool Iva { get; set; }
        public System.DateTime Created { get; set; }
    }
}
