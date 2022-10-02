
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.SessionFactory;
import org.hibernate.HibernateException;
import org.hibernate.query.*;
import org.hibernate.type.DoubleType;
import org.hibernate.boot.registry.*;
import org.hibernate.boot.*;
import org.hibernate.boot.model.naming.ImplicitNamingStrategyJpaCompliantImpl;

public class App {
    private static SessionFactory factory;

    public static void main(String[] args) throws Exception {

        /*
         *
         * Write your code to implement... (Refer to page 11) 1. service registry object
         * 2. metadata object 3. Session Factory Builder object 4. Session Factory
         * object
         *
         */
        StandardServiceRegistry standardRegistry = new StandardServiceRegistryBuilder().configure("hibernate.cfg.xml")
                .build();

        Metadata metaData = new MetadataSources(standardRegistry).addAnnotatedClass(Employee.class)
                .addAnnotatedClass(Company.class).addAnnotatedClass(Account.class).getMetadataBuilder()
                .applyImplicitNamingStrategy(ImplicitNamingStrategyJpaCompliantImpl.INSTANCE).build();

        SessionFactoryBuilder sessionFactoryBuilder = metaData.getSessionFactoryBuilder();
        factory = sessionFactoryBuilder.build();

        BufferedReader br = new BufferedReader(new FileReader("testcase.txt"));

        App app = new App();

        app.answer1(br);
        app.answer2(br);
        app.answer3(br);
        app.answer4(br);
        app.answer5();

        factory.close();

    }

    // Answer #1
    public void answer1(BufferedReader br) {

        System.out.println("\n############# answer1 #############");
        Session session = factory.openSession();
        Transaction tx = null;

        String inputOpen; // new account’s opening date
        String inputFirst; // first name
        String inputLast; // inputLast is the last name of the employee
        String inputCom; // inputCom is the name of the company
        int inputSalary; // inputSalary is the salary of the employee
        int inputMoris; // Moris’ bank account id
        int inputLuis; // Luis’ bank account id
        int inputId; // employee_id

        try (session) {
            tx = session.beginTransaction();

            try {

                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

                while (!Objects.equals(br.readLine(), "#answer1"))
                    ;
                inputId = Integer.parseInt(br.readLine());
                System.out.println("Input new employee's Id: " + inputId);
                inputFirst = br.readLine();
                System.out.println("Input new employee's first name: " + inputFirst);
                inputLast = br.readLine();
                System.out.println("Input new employee's last name: " + inputLast);
                inputCom = br.readLine();
                System.out.println("Input new employee's company: " + inputCom);
                inputSalary = Integer.parseInt(br.readLine());
                System.out.println("Input new employee's salary: " + inputSalary);
                inputOpen = br.readLine();
                System.out.println("Input new employee's Account opening Data ex) 2021-11-02: " + inputOpen);
                inputMoris = Integer.parseInt(br.readLine());
                System.out
                        .println("Input new employee's Moris bank account id with 139 prefix and 10 number of digits: "
                                + inputMoris);
                inputLuis = Integer.parseInt(br.readLine());
                System.out
                        .println("Input new employee's Luis bank account id with 1100 prefix and 10 number of digits: "
                                + inputLuis);

                Date dt = dateFormat.parse(inputOpen);

                // answer1
                Query q1 = session.createQuery("from Company where company_name=:comName");
                q1.setParameter("comName", inputCom);

                Company company = (Company) q1.getSingleResult();

                Employee employee = new Employee(inputId, inputFirst, inputLast, inputSalary, company);
                Account account1 = new Account(inputMoris, "Moris", dt, employee);
                Account account2 = new Account(inputLuis, "Luis", dt, employee);

                session.save(employee);
                session.save(account1);
                session.save(account2);

                /*
                 *
                 *
                 * write your code
                 *
                 *
                 */

            } catch (Exception e) {
                System.out.println(e.getMessage());
            }

            tx.commit();

        } catch (HibernateException e) {
            if (tx != null)
                tx.rollback();
            System.out.println(e.getMessage());
            e.printStackTrace();
        }

    }

    // Answer #2
    public void answer2(BufferedReader br) {

        System.out.println("\n############# answer2 #############");
        Session session = factory.openSession();
        Transaction tx = null;

        String trgCom;
        int newcomID;
        double ratio;
        int year;

        try (session) {
            tx = session.beginTransaction();

            try {

                while (!Objects.equals(br.readLine(), "#answer2"))
                    ;
                trgCom = br.readLine();
                System.out.println("Input target company: " + trgCom);
                newcomID = Integer.parseInt(br.readLine());
                System.out.println("Input new company Id: " + newcomID);
                ratio = Double.parseDouble(br.readLine());
                System.out.println("Input increment ratio of salary: " + ratio);
                year = Integer.parseInt(br.readLine());
                System.out.println("Input target year: " + year);

                // answer2
                Query q1 = session.createQuery("update Company set company_id=:comId where company_name=:comName");
                q1.setParameter("comId", newcomID);
                q1.setParameter("comName", trgCom);
                int number1 = q1.executeUpdate();

                Query q2 = session
                        .createQuery("update Employee set salary=salary*:rat where company.company_id=:comId");
                q2.setParameter("rat", ratio, new DoubleType());
                q2.setParameter("comId", newcomID);
                int number2 = q2.executeUpdate();

                Query q3 = session.createQuery("delete from Account where YEAR(opening_date) <= :targetYear");
                q3.setParameter("targetYear", year);
                int number3 = q3.executeUpdate();

                System.out.println("# of updated Companies: " + number1 + " ");
                System.out.println("# of updated Employees: " + number2 + " ");
                System.out.println("# of updated Accounts: " + number3 + " ");

                /*
                 *
                 *
                 * write your code
                 *
                 *
                 */

            } catch (IOException e) {
                System.out.println(e.getMessage());
            }

            tx.commit();
        } catch (HibernateException e) {
            if (tx != null)
                tx.rollback();
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
    }

    // Answer #3
    public void answer3(BufferedReader br) {

        System.out.println("\n############# answer3 #############");
        Session session = factory.openSession();
        Transaction tx = null;

        String prefix;
        String exceptBankName;

        try (session) {
            tx = session.beginTransaction();

            try {

                while (!Objects.equals(br.readLine(), "#answer3"))
                    ;
                prefix = br.readLine();
                System.out.println("Input the prefix of accounts: " + prefix);
                exceptBankName = br.readLine();
                System.out.println("Input the bank name excluded: " + exceptBankName);

                // answer3
                Query q1 = session.createQuery(
                        "select distinct owner.employee_id from Account where str(account_id) like concat(:targetPref,'%')");
                q1.setParameter("targetPref", prefix);

                for (Iterator it = q1.list().iterator(); it.hasNext();) {
                    int id = (int) it.next();
                    // System.out.println("Employee Id: " + id);
                    Query q2 = session.createQuery(
                            "select account_id, bank_name, owner.employee_id from Account where (owner.employee_id = :targetEmployeeId) and bank_name != :excludedBankName");
                    q2.setParameter("targetEmployeeId", id);
                    q2.setParameter("excludedBankName", exceptBankName);
                    for (Iterator it2 = q2.list().iterator(); it2.hasNext();) {
                        Object[] res = (Object[]) it2.next();
                        for (Object val : res) {
                            System.out.print(val + " ");
                        }
                    }
                }
                /*
                 *
                 *
                 * write your code
                 *
                 *
                 */

            } catch (IOException e) {
                System.out.println(e.getMessage());
            }

            tx.commit();
        } catch (HibernateException e) {
            if (tx != null)
                tx.rollback();
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
    }

    // Answer #4
    public void answer4(BufferedReader br) {

        System.out.println("\n############# answer4 #############");
        Session session = factory.openSession();
        Transaction tx = null;

        int year;
        int month;

        try (session) {
            tx = session.beginTransaction();

            try {

                while (!Objects.equals(br.readLine(), "#answer4"))
                    ;

                year = Integer.parseInt(br.readLine());
                System.out.println("Input the year: " + year);
                month = Integer.parseInt(br.readLine());
                System.out.println("Input the month (1~12): " + month);

                // answer4
                Query q1 = session.createQuery(
                        "select count(account_id) as account_num, owner.first_name, owner.last_name, owner.salary, owner.company.company_name from Account where ((year(opening_date) = :targetYear and month(opening_date) >= :targetMonth) or year(opening_date) > :targetYear) group by owner.employee_id order by account_num desc, owner.salary desc");
                q1.setParameter("targetYear", year);
                q1.setParameter("targetMonth", month);

                for (Iterator it = q1.list().iterator(); it.hasNext();) {
                    Object[] res = (Object[]) it.next();
                    for (Object val : res) {
                        System.out.print(val + " ");
                    }
                    System.out.println("");
                }

                /*
                 *
                 *
                 * write your code
                 *
                 *
                 */

            } catch (IOException e) {
                System.out.println(e.getMessage());
            }

            tx.commit();
        } catch (HibernateException e) {
            if (tx != null)
                tx.rollback();
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
    }

    // Answer #5
    public void answer5() {

        System.out.println("\n############# answer5 #############");
        Session session = factory.openSession();
        Transaction tx = null;

        try (session) {
            tx = session.beginTransaction();

            // answer5
            Query q1 = session.createQuery("from Company");
            int comNum = 1;
            for (Iterator it = q1.list().iterator(); it.hasNext(); comNum++) {
                Company company = (Company) it.next();
                // System.out.println("Info of Company " + comNum + " : ");
                // System.out.println("");
                System.out.println(company.toString());

                Set<Employee> employees = company.getEmployees();
                int employeeNum = 1;
                for (Iterator empIt = employees.iterator(); empIt.hasNext(); employeeNum++) {

                    Employee employee = (Employee) empIt.next();
                    // System.out.println("Info of Employee " + employeeNum + " of company " +
                    // comNum);
                    System.out.println(employee.toString());

                    Set<Account> accounts = employee.getAccounts();
                    int accountNum = 1;
                    for (Iterator accIt = accounts.iterator(); accIt.hasNext(); accountNum++) {
                        Account account = (Account) accIt.next();
                        // System.out.println("Info of Account " + accountNum + " of employee " +
                        // employeeNum
                        // + " of company " + comNum);
                        System.out.println(account.toString());
                    }
                    System.out.println("");
                }
            }
            /*
             *
             *
             * write your code
             *
             *
             *
             */

            tx.commit();
        } catch (HibernateException e) {
            if (tx != null)
                tx.rollback();
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
    }
}
