/*Alex Smetana 
 * CIS 340 - Assign03
 * 02/09/2023
 */


//Main Classs
//Purpose: Allows for a demonstration of the Employee Class by use of Insantiation
namespace Assign03
{
    internal class Program
    {
        static void Main(string[] args)
        {
            //Employee1 Object Creation - Added attributes and Displays to user
            Console.WriteLine("Original Employee 1 Information:");
            Employee employee1 = new Employee();
            employee1.Id = (1);
            employee1.Name = ("Garry");
            employee1.Salary = (90000);
            Console.WriteLine(employee1.ToString() + "\n");

            //Employee1 Update of Name + Display
            Console.WriteLine("Updated Employee 1 Information:");
            employee1.Name = ("Larry");
            Console.WriteLine(employee1.ToString() + "\n");

            //Employee2 Object Creation - Added attributes and Displays to user
            Console.WriteLine("Original Employee 2 Information:");
            Employee employee2 = new Employee(2, "John", 700000);
            Console.WriteLine(employee2.ToString() + "\n");

            //Employee2 Update of Name + Display
            Console.WriteLine("Updated Employee 2 Information:");
            employee2.Salary = 100000;
            Console.Write(employee2.ToString() + "\n");
        }
    }
}