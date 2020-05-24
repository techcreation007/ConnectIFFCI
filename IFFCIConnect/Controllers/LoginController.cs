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
                        return RedirectToAction("dashboard", "seeker");
                    }
                    else
                    {
                        ModelState.AddModelError("", "Login data is incorrect!");
                    }                    
                }
                return View("~/Views/login/Login.cshtml");
            }
            catch (Exception ex)
            {
                return null;
            }
        }


        public bool IsValid(string _username, string _password)
        {
            try
            {
                var encodepassword = Cryptography.Crypt(_password);
                var users = (from u in dbContext.Tbl_Seeker_Account
                             where u.email.Equals(_username) && u.password.Equals(encodepassword)
                             select u).FirstOrDefault();
                Session["Name"] = users.Full_Name != null ? users.Full_Name : string.Empty ;
                if (users != null) { return true; } else { return false; }
            }

            catch (Exception ex)
            {
                return false;
            }
        }

    }
}