using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MyOrgs.Data_Access
{
    public class StudentRoster
    {
        private int _OrgID;
        public int OrgID
        {
            get
            {
                return this._OrgID;
            }
            set 
            {
                this._OrgID = value;
            }
        }

        private int _StudentID;
        public int StudentID
        {
            get
            {
                return this._StudentID;
            }
            set
            {
                this._StudentID = value;
            }
        }

        private int _CarrollID;
        public int CarrollID
        {
            get
            {
                return this._CarrollID;
            }
            set
            {
                this._CarrollID = value;
            }
        }

        private string _Firstname;
        public string Firstname
        {
            get
            {
                return this._Firstname;
            }
            set
            {
                this._Firstname = value;
            }
        }

        private string _Lastname;
        public string Lastname
        {
            get
            {
                return this._Lastname;
            }
            set
            {
                this._Lastname = value;
            }
        }

        private string _MemberName;
        public string MemberName
        {
            get
            {
                return this._MemberName;
            }
            set
            {
                this._MemberName = value;
            }
        }
        
        private string _MemberID;
        public string MemberID
        {
            get
            {
                return this._MemberID;
            }
            set
            {
                this._MemberID = value;
            }
        }

        private string _SortOrder;
        public string SortOrder
        {
            get
            {
                return this._SortOrder;
            }
            set
            {
                this._SortOrder = value;
            }
        }

        public StudentRoster()
        { }
    }
}