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
    
    public partial class DenominationByCashClose
    {
        public int idCashClosing { get; set; }
        public int idDenomination { get; set; }
        public decimal Quantity { get; set; }
    
        public virtual CashClosing CashClosing { get; set; }
        public virtual Denomination Denomination { get; set; }
    }
}
