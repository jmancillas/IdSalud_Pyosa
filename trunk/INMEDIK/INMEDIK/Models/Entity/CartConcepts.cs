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
    
    public partial class CartConcepts
    {
        public int Id { get; set; }
        public int EmployeeCartId { get; set; }
        public int ConceptId { get; set; }
        public Nullable<int> MedicId { get; set; }
        public int ClinicId { get; set; }
        public int Quantity { get; set; }
        public Nullable<System.DateTime> Scheduled { get; set; }
        public string Medicname { get; set; }
        public string Decree { get; set; }
        public System.DateTime Created { get; set; }
    
        public virtual Cart Cart { get; set; }
        public virtual Clinic Clinic { get; set; }
        public virtual Concept Concept { get; set; }
        public virtual Employee Employee { get; set; }
    }
}
