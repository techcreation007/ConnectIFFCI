﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class IFCCIEntities : DbContext
    {
        public IFCCIEntities()
            : base("name=IFCCIEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Country_Master> Country_Master { get; set; }
        public virtual DbSet<Industry_Master> Industry_Master { get; set; }
        public virtual DbSet<NumberOfEmployee_Master> NumberOfEmployee_Master { get; set; }
        public virtual DbSet<Organization_Master> Organization_Master { get; set; }
        public virtual DbSet<Tbl_Employer_Account> Tbl_Employer_Account { get; set; }
        public virtual DbSet<Tbl_Seeker_Account> Tbl_Seeker_Account { get; set; }
        public virtual DbSet<Tbl_User_Type> Tbl_User_Type { get; set; }
    }
}
