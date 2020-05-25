using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IFFCIConnect.Models
{
    public class UserProfile
    {
        public int id { get; set; }
        public int user_type_id { get; set; }
        public string email { get; set; }     
        public System.DateTime date_of_birth { get; set; }
        public string gender { get; set; }
        public bool Is_active { get; set; }
        public string contact_number { get; set; }
        public string Full_Name { get; set; }
        public Nullable<bool> email_notification_active { get; set; }
        public string Home_Phone { get; set; }
        public System.DateTime registration_date { get; set; }
        public string Location { get; set; }
        public string City { get; set; }
        public string Nationality { get; set; }
        public string ResumeFileName { get; set; }
        public string Current_Address { get; set; }
        public Nullable<bool> SMS_notification_active { get; set; }

        public string userType { get; set; }

    }
}