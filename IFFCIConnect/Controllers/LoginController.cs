using IFFCIConnect.Models;
using IFFCIConnect.ViewModel;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace IFFCIConnect.Controllers
{
    public class LoginController : Controller
    {
       
        IFCCIEntities dbContext = new IFCCIEntities();
        // GET: Login
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Login()
        {
            return View("~/Views/login/Login.cshtml");
        }
        public ActionResult Register()
        {
            return View();
        }
        [HttpPost]
        public ActionResult UploadSeekerFiles()
        {
           
            string FileName = string.Empty;
            //string path = Server.MapPath("~/Content/Upload/");
            string TempFilePath = Server.MapPath("~/Upload/SeekerResumeFiles/"); //System.Configuration.ConfigurationManager.AppSettings["HomeLoanFilesPath"];
            if (!Directory.Exists(TempFilePath))
                Directory.CreateDirectory(TempFilePath);
            HttpFileCollectionBase files = Request.Files;
            for (int i = 0; i < files.Count; i++)
            {
                HttpPostedFileBase file = files[i];
                FileName = "MyResume_" + Guid.NewGuid().ToString("N") + Path.GetExtension(file.FileName);
                file.SaveAs(Path.Combine(TempFilePath, FileName));
                //file.SaveAs(path + file.FileName);
            }
            return Json(new { Msg = "File has been Uploaded!", Filename = FileName });
            // return Json(files.Count + " Files Uploaded!");
        }
        [HttpPost]
        public ActionResult UploadCompanyLogo()
        {

            string FileName = string.Empty;
            //string path = Server.MapPath("~/Content/Upload/");
            string TempFilePath = Server.MapPath("~/Upload/CompanyLogos/"); //System.Configuration.ConfigurationManager.AppSettings["HomeLoanFilesPath"];
            if (!Directory.Exists(TempFilePath))
                Directory.CreateDirectory(TempFilePath);
            HttpFileCollectionBase files = Request.Files;
            for (int i = 0; i < files.Count; i++)
            {
                HttpPostedFileBase file = files[i];
                FileName = "MyCompanyLogo_" + Guid.NewGuid().ToString("N") + Path.GetExtension(file.FileName);
                file.SaveAs(Path.Combine(TempFilePath, FileName));
                //file.SaveAs(path + file.FileName);
            }
            return Json(new { Msg = "Company Logo has been Uploaded!", Filename = FileName });
            // return Json(files.Count + " Files Uploaded!");
        }
        [HttpPost]
        public JsonResult RegisterSeekerAccount(Tbl_Seeker_Account SeekerAccountsDetails)
        {

            
            string message = string.Empty;
            SeekerAccountsDetails.registration_date = DateTime.Now;
            var Results = dbContext.Tbl_Seeker_Account.ToList();
            if (Results.Where(w => w.Full_Name.Contains(SeekerAccountsDetails.Full_Name)).Any())
                message = "Full Name already exists.!";
            else if (Results.Where(w => w.email.Contains(SeekerAccountsDetails.email)).Any())
                message = "Supplied email address has already been used!";
            else if (Results.Where(w => w.contact_number.Contains(SeekerAccountsDetails.contact_number)).Any())
                message = "Contact number  is already exist!";
            else
            {
                SeekerAccountsDetails.password= ViewModel.Cryptography.Crypt(SeekerAccountsDetails.password.ToString().Trim());
                SeekerAccountsDetails.user_type_id = 1;
                dbContext.Tbl_Seeker_Account.Add(SeekerAccountsDetails);
                dbContext.SaveChanges();
                message = "Registration successful.\\nUserId Id: " + SeekerAccountsDetails.email.ToString();


            }

            return Json(message);
        }

        [HttpPost]
        public JsonResult RegisterEmployerAccount(Tbl_Employer_Account EmployerAccountsDetails)
        {


            string message = string.Empty;
            EmployerAccountsDetails.registration_date = DateTime.Now;
            var Results = dbContext.Tbl_Employer_Account.ToList();
            if (Results.Where(w => w.Full_Name.Contains(EmployerAccountsDetails.Full_Name)).Any())
                message = "Full Name already exists.!";
            else if (Results.Where(w => w.Email.Contains(EmployerAccountsDetails.Email)).Any())
                message = "Supplied email address has already been used!";
            else if (Results.Where(w => w.Contact_Number.Contains(EmployerAccountsDetails.Contact_Number)).Any())
                message = "Contact number  is already exist!";
            else if (Results.Where(w => w.Company_Name.Contains(EmployerAccountsDetails.Company_Name)).Any())
                message = "Company Name number  is already exist!";
            else
            {
                EmployerAccountsDetails.Password = ViewModel.Cryptography.Crypt(EmployerAccountsDetails.Password.ToString().Trim());
                EmployerAccountsDetails.user_type_id = 2;
                dbContext.Tbl_Employer_Account.Add(EmployerAccountsDetails);
                dbContext.SaveChanges();
                message = "Registration successful.\\nUserId Id: " + EmployerAccountsDetails.Email.ToString();


            }

            return Json(message);
        }
        /// <summary>
        /// Validate Login for All users
        /// </summary>
        /// <param name="email"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        public ActionResult userLogin(string email, string password)
        {
            try
            {
                if (email != null && password != null)
                {
                    Session["key"] = string.Empty;
                    Session["key"] = email;
                    if (IsValid(email, password))
                    {
                        //FormsAuthentication.SetAuthCookie(email, user.RememberMe);
                        UserProfile objUsers = (UserProfile)Session["UserProfile"];
                        
                        if (objUsers.userType=="U")
                        return RedirectToAction("MainSeeker", "seeker");
                        else if(objUsers.userType == "E")
                        return RedirectToAction("MainEmployer", "Employer");
                        else
                            return View("~/Views/login/Login.cshtml");

                    }
                    else
                    {
                        ModelState.AddModelError("", "Login data is incorrect!");
                        Session["UserProfile"] = null;
                    }                    
                }
                return View("~/Views/login/Login.cshtml");
            }
            catch (Exception ex)
            {
                return null;
            }
        }
        public ActionResult LogOut()
        {
            FormsAuthentication.SignOut();
            Session.Abandon();
            Session["UserProfile"] = null;
            Session["SessionEmpProfile"] = null;
            //Session["EmpName"] = null;
            //Session["Pan_No"] = null;
            //Session["Email"] = null;
            //Session["Designation"] = null;
            //Session["EmpType"] = null;
            Session.Clear();
            Session.RemoveAll();
            Session.Abandon();
            Response.AddHeader("Cache-control", "no-store, must-revalidate, private, no-cache");
            Response.AddHeader("Pragma", "no-cache");
            Response.AddHeader("Expires", "0");
            //Response.AppendToLog("window.location.reload();");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);

            Response.Cache.SetExpires(DateTime.Now.AddSeconds(-1));

            Response.Cache.SetNoStore();


            FormsAuthentication.SignOut();
            return RedirectToAction("login", "login");

        }

        public bool IsValid(string _username, string _password)
        {
            try
            {
                var userProfile = new UserProfile();
                var encodepassword = Cryptography.Crypt(_password);
                var users = (from u in dbContext.Tbl_Seeker_Account join od in dbContext.Tbl_User_Type on u.user_type_id equals od.id
                             where u.email.Equals(_username) && u.password.Equals(encodepassword)
                             select new {
                                 u.City, u.contact_number, u.Current_Address, u.date_of_birth, u.email,
                                 u.email_notification_active, u.Full_Name,u.gender,u.Home_Phone,u.id,
                                 u.Is_active, u.Location,u.Nationality, u.password, u.registration_date, u.ResumeFileName, u.SMS_notification_active,
                                 u.user_type_id, od.UserType, od.user_type_name
                             }).FirstOrDefault();
                userProfile.id = users.id;
                userProfile.City = users.City;
                userProfile.userType = users.UserType;
                userProfile.contact_number = users.contact_number;
                userProfile.Current_Address = users.Current_Address;
                userProfile.date_of_birth = users.date_of_birth;
                userProfile.email = users.email;
                userProfile.email_notification_active = users.email_notification_active;
                userProfile.Full_Name = users.Full_Name;
                userProfile.gender = users.gender;
                userProfile.Home_Phone = users.Home_Phone;
                userProfile.Is_active = users.Is_active;
                userProfile.Location = users.Location;
                userProfile.Nationality = users.Nationality;
                userProfile.registration_date = users.registration_date;
                userProfile.ResumeFileName = users.ResumeFileName;
                userProfile.SMS_notification_active = users.SMS_notification_active;
                userProfile.user_type_id = users.user_type_id;
                Session["UserProfile"] = userProfile;
                if (users != null) { return true; } else { return false; }
            }

            catch (Exception ex)
            {
                return false;
            }
        }

    }
}