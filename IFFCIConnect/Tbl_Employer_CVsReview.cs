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
    
    public partial class Tbl_Employer_CVsReview
    {
        public int id { get; set; }
        public int JobPost_id { get; set; }
        public int Employer_id { get; set; }
        public int Seeker_id { get; set; }
        public Nullable<System.DateTime> SeekerJobApplyDateTime { get; set; }
        public Nullable<System.DateTime> SeekerScheduleInterviewDateTime { get; set; }
        public Nullable<bool> IsAcceptByEmployer { get; set; }
        public Nullable<bool> IsRejectByEmployer { get; set; }
        public Nullable<bool> IsAcceptBySeeker { get; set; }
        public Nullable<bool> IsRejectBySeeker { get; set; }
        public Nullable<bool> IsActive { get; set; }
    }
}