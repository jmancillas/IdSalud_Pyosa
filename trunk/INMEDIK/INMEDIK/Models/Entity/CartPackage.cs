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
    
    public partial class CartPackage
    {
        public int id { get; set; }
        public int EmployeeCartId { get; set; }
        public int PackageId { get; set; }
        public Nullable<int> MedicId { get; set; }
        public int ClinicId { get; set; }
        public string Medicname { get; set; }
        public System.DateTime Created { get; set; }
        public System.DateTime Scheduled { get; set; }
    
        public virtual Cart Cart { get; set; }
        public virtual Clinic Clinic { get; set; }
        public virtual Employee Employee { get; set; }
        public virtual Package Package { get; set; }
    }
}