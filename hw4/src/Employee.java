import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity(name = "Employee")
@Table(name = "employee")

public class Employee {
  @Id
  @Column(name = "employee_id", unique = true, nullable = false)
  private int employee_id;

  @Column(name = "first_name", nullable = false)
  private String first_name;

  @Column(name = "last_name", nullable = false)
  private String last_name;

  @Column(name = "salary", nullable = false)
  private int salary;

  @ManyToOne
  @JoinColumn(name = "company")
  private Company company;

  @OneToMany(mappedBy = "owner", cascade = CascadeType.ALL, orphanRemoval = true)
  private Set<Account> accounts = new HashSet<Account>();

  public Employee() {
  }

  public Employee(int employee_id, String first_name, String last_name, int salary, Company company) {
    this.employee_id = employee_id;
    this.first_name = first_name;
    this.last_name = last_name;
    this.salary = salary;
    this.company = company;
  }

  @Override
  public boolean equals(Object obj) {
    if (obj == null)
      return false;
    if (!this.getClass().equals(obj.getClass()))
      return false;
    if (!(obj instanceof Employee))
      return false;

    Employee other = (Employee) obj;

    if (this.employee_id != other.employee_id)
      return false;
    if (!company.equals(other.company))
      return false;
    if (first_name == null) {
      if (other.first_name != null)
        return false;
    } else if (!first_name.equals(other.first_name))
      return false;
    if (last_name == null) {
      if (other.last_name != null)
        return false;
    } else if (!last_name.equals(other.last_name))
      return false;
    return true;
  }

  @Override
  public int hashCode() {
    int tmp = 0;
    tmp = (employee_id + "").hashCode();
    return tmp;
  }

  public int getEmployeeId() {
    return employee_id;
  }

  public String getFirstName() {
    return first_name;
  }

  public String getLastName() {
    return last_name;
  }

  public int getSalary() {
    return salary;
  }

  public Company getCompany() {
    return company;
  }

  public Set<Account> getAccounts() {
    return accounts;
  }

  public void setEmployeeId(int employee_id) {
    this.employee_id = employee_id;
  }

  public void setFirstName(String name) {
    this.first_name = name;
  }

  public void setLastName(String name) {
    this.last_name = name;
  }

  public void setSalary(int salary) {
    this.salary = salary;
  }

  public void setCompany(Company company) {
    this.company = company;
  }

  @Override
  public String toString() {
    return "EmpID : " + employee_id + "  Emp First Name : " + first_name + "  Emp Last Name : " + last_name
        + "  Salary : " + salary + "  Company : " + company.getCompanyId();
  }

}
