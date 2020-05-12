using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

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
            else if (Results.Where(w => w.email.Contains(SeekerAccountsDetails.contact_number)).Any())
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
    }
}