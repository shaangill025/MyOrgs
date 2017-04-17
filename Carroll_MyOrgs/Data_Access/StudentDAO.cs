using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections;

namespace MyOrgs.Data_Access
{
    public class StudentDAO
    {
        MyOrgsDBDataContext dbcontext = new MyOrgsDBDataContext();

        public List<MyOrgs.Data_Access.StudentHistory> getCurrentRoster(int orgID)
        {
            List<MyOrgs.Data_Access.StudentHistory> orgroster = new List<MyOrgs.Data_Access.StudentHistory>();

            try
            {
                string orgID = orgID.ToString();
                var stud = dataContext.sp_GetMyOrgsRoster(orgID);
                foreach (var s in stud)
                {
                    MyOrgs.Data_Access.StudentRoster org = new MyOrgs.Data_Access.StudentRoster();
                    org.OrgID = s.Organization_ID;
                    org.StudentID = s.Student_ID;
                    org.CarrollID = s.Carroll_ID;
                    org.Firstname = s.FirstName;
                    org.Lastname = s.LastName;
                    org.MemberName = s.MemberName;
                    org.MemberID = s.Member_ID;
                    org.SortOrder = s.sort_order;
                    orgroster.Add(org);
                }
                return orgroster;
            }
            catch (Exception e)
            {

            }

            return orgroster;
        }
    }
}