/*Alex Smetana 
 * CIS 340 - Assign03
 * 02/09/2023
 */

//Employee Class
//Purpose: Demonstration of creation of Object, Constructor and ToString using C#

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

//Employee Class
namespace Assign03
{
    internal class Employee
    {

        //Id, Name, Salary Properties
        //Getters + Setters included
        public long Id { get; set; }
        public string Name { get; set; }
        public int salary;

        public int Salary
        {
            get { return salary; }
            set { if (salary >= 0)
                {
                    salary = value;
                }
            }
        }

        #region Constructors
        //Employee Constructor
        public Employee(long id, string name, int salary)
        {
            this.Id = id;
            this.Name = name;
            this.Salary = salary;
        }

        //No Arg Constructor
        public Employee()
        {
            this.Id = 0;
            this.Name = "Null";
            this.Salary = 0;
        }
        #endregion

        //ToString
        //Returns the values of ID, Name, and Salary
        public override string ToString()
        {
            StringBuilder msg = new StringBuilder();
            msg.Append("Employee ID is " + Id + ", ").Append(" Name is " + Name + ", ").Append(" Salary is $" + Salary);
            return msg.ToString();
        }
    }
}
