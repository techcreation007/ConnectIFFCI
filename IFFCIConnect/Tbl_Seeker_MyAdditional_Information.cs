//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace IFFCIConnect
{
    using System;
    using System.Collections.Generic;
    
    public partial class Tbl_Seeker_MyAdditional_Information
    {
        public int id { get; set; }
        public int Seeker_id { get; set; }
        public string Interest { get; set; }
        public string Carreer_Objective { get; set; }
        public string Achievements { get; set; }
        public Nullable<bool> IsActive { get; set; }
        public System.DateTime CreatedDate { get; set; }
    
        public virtual Tbl_Seeker_Account Tbl_Seeker_Account { get; set; }
    }
}
