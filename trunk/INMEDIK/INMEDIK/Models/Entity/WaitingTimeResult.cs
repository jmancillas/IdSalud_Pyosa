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
    
    public partial class WaitingTimeResult
    {
        public int Id { get; set; }
        public int WaitingTimeId { get; set; }
        public string StartProcess { get; set; }
        public string StartStageReception { get; set; }
        public string EndStageReception { get; set; }
        public string TAPReception { get; set; }
        public string TEPRecNur { get; set; }
        public string StartStageNursery { get; set; }
        public string EndStageNursery { get; set; }
        public string TAPNursery { get; set; }
        public string TEPNurMed { get; set; }
        public string StartStageMedic { get; set; }
        public string EndStageMedic { get; set; }
        public string EndProcess { get; set; }
    }
}
