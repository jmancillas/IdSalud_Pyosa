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
    
    public partial class EvolExploration
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public EvolExploration()
        {
            this.EvolutionNote = new HashSet<EvolutionNote>();
        }
    
        public int Id { get; set; }
        public string Habitus { get; set; }
        public Nullable<int> Temperature { get; set; }
        public Nullable<int> TA_Sistolica { get; set; }
        public Nullable<int> TA_Diastolica { get; set; }
        public Nullable<int> HeartRate { get; set; }
        public Nullable<int> BreathingFrequency { get; set; }
        public Nullable<int> OxygenSaturation { get; set; }
        public Nullable<int> Weight { get; set; }
        public Nullable<int> Size { get; set; }
        public Nullable<int> HipCircumference { get; set; }
        public Nullable<int> WaistCircumference { get; set; }
        public Nullable<decimal> IMC { get; set; }
        public string PainScale { get; set; }
        public Nullable<int> PainScaleAdult { get; set; }
        public Nullable<bool> saveVitalSigns { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<EvolutionNote> EvolutionNote { get; set; }
    }
}
