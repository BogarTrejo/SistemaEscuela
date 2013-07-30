using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SistemaEscuela.Model;
namespace SistemaEscuela
{
    public class LoginHelper
    {
        public const string UserLoginSessionID = "UserLoginSessionID";

        public static bool CheckUserSecurity(LoginType expectedType)
        {
            bool isSuccess = true;

            var sessionLogin = HttpContext.Current.Session[LoginHelper.UserLoginSessionID];

            if (sessionLogin == null)
                return false;

            string userLogin = sessionLogin.ToString();

            // se cosulta el login

            using (var context = new multilingualEntities())
            {
                login currentLogin =
                    (
                        from l in context.logins
                        where l.Login1.Equals(userLogin)
                        select l
                    ).FirstOrDefault<login>();

                LoginType currentType = (LoginType)currentLogin.Type.Value;

                if (currentType == LoginType.Admin)
                    return true;

                if (expectedType != currentType)
                    isSuccess = false;
            }

            return isSuccess;
        }

        public static void SaveUserSession(string userName)
        {
            HttpContext.Current.Session[LoginHelper.UserLoginSessionID] = userName;
        }

        public static void DeleteUserSession()
        {
            HttpContext.Current.Session.RemoveAll();
        }

        public static string GetMessate(int message)
        {
            string msg = String.Empty;

            switch (message)
            {
                case 1:
                    msg = "Debe de iniciar sesión para poder entrar aquí o no tiene permisos suficientes";
                    break;    
                case 2:
                    msg = "Usuario o contraseña incorrectos";
                    break;
            }

            return msg;
        }
    }


    public enum LoginType
    {
        Admin = 1,
        Payments = 2,
        Students = 3
    }
    
}