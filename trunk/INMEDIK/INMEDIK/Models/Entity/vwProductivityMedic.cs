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
    
    public partial class vwProductivityMedic
    {
        public int EmployeeId { get; set; }
        public string MedicName { get; set; }
        public string ConceptName { get; set; }
        public string CategoryName { get; set; }
        public Nullable<System.DateTime> DateCreated { get; set; }
        public string RoleName { get; set; }
        public int Quantity { get; set; }
        public Nullable<int> ClinicId { get; set; }
    }
}
