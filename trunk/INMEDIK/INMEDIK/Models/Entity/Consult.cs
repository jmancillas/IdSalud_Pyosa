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
    
    public partial class Consult
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Consult()
        {
            this.WaitingTimes = new HashSet<WaitingTimes>();
        }
    
        public int id { get; set; }
        public int OrderId { get; set; }
        public int PatientId { get; set; }
        public int ClinicId { get; set; }
        public int MedicId { get; set; }
        public int StatusId { get; set; }
        public int ConceptId { get; set; }
        public Nullable<System.DateTime> Scheduled { get; set; }
        public string Age { get; set; }
        public string Temperature { get; set; }
        public string BloodPressure { get; set; }
        public string HeartRate { get; set; }
        public Nullable<decimal> Weight { get; set; }
        public Nullable<decimal> Height { get; set; }
        public string Alergics { get; set; }
        public string AHF { get; set; }
        public string APP { get; set; }
        public string APNP { get; set; }
        public string AGO { get; set; }
        public string PA { get; set; }
        public string PhisicalExploration { get; set; }
        public string Treatment { get; set; }
        public Nullable<int> NurseId { get; set; }
        public System.DateTime Updated { get; set; }
        public int OrderConceptId { get; set; }
        public Nullable<bool> Recurrent { get; set; }
    
        public virtual Clinic Clinic { get; set; }
        public virtual Concept Concept { get; set; }
        public virtual Employee Employee { get; set; }
        public virtual Employee Employee1 { get; set; }
        public virtual Orders Orders { get; set; }
        public virtual OrdersConcepts OrdersConcepts { get; set; }
        public virtual Patient Patient { get; set; }
        public virtual Status Status { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<WaitingTimes> WaitingTimes { get; set; }
    }
}