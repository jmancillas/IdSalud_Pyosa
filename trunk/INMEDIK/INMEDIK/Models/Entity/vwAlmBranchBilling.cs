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
    
    public partial class vwAlmBranchBilling
    {
        public int id { get; set; }
        public decimal Total { get; set; }
        public bool Closed { get; set; }
        public bool Paid { get; set; }
        public string Notes { get; set; }
        public Nullable<System.DateTime> Created { get; set; }
        public Nullable<System.DateTime> Updated { get; set; }
        public Nullable<System.DateTime> DueDate { get; set; }
        public string nvFolio { get; set; }
        public int Folio { get; set; }
        public int clinicId { get; set; }
        public string clinicName { get; set; }
    }
}
