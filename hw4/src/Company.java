import java.sql.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity(name = "Company")
@Table(name = "company")

public class Company {
  @Id
  @Column(name = "company_id", unique = true, nullable = false)
  private int company_id;

  @Column(name = "company_name", nullable = false)
  private String company_name;

  @Column(name = "annual_sales", nullable = false)
  private int annual_sales;

  @Column(name = "founding_date", nullable = false)
  @Temporal(TemporalType.DATE)
  private java.util.Date founding_date;

  @OneToMany(mappedBy = "company", cascade = CascadeType.ALL, orphanRemoval = true)
  private Set<Employee> employees = new HashSet<Employee>();

  public Company() {
  }

  public Company(int company_id, String company_name, int annual_sales, java.util.Date founding_date) {
    this.company_id = company_id;
    this.company_name = company_name;
    this.annual_sales = annual_sales;
    this.founding_date = founding_date;
  }

  @Override
  public boolean equals(Object obj) {
    if (obj == null) {
      return false;
    }
    if (obj == this) {
      return true;
    }
    if (!(obj instanceof Company)) {
      return false;
    }
    Company company = (Company) obj;
    return company.company_id == this.company_id;
  }

  @Override
  public int hashCode() {
    int tmp = 0;
    tmp = (company_id + "").hashCode();
    return tmp;
  }

  public int getCompanyId() {
    return company_id;
  }

  public String getCompanyName() {
    return company_name;
  }

  public int getAnnualSales() {
    return annual_sales;
  }

  public java.util.Date getFoundingDate() {
    return founding_date;
  }

  public Set<Employee> getEmployees() {
    return employees;
  }

  public void setCompanyId(int company_id) {
    this.company_id = company_id;
  }

  public void setCompanyName(String company_name) {
    this.company_name = company_name;
  }

  public void setAnnualSales(int annual_sales) {
    this.annual_sales = annual_sales;
  }

  public void setFoundingDate(Date founding_date) {
    this.founding_date = founding_date;
  }

  @Override
  public String toString() {
    return "ComID : " + company_id + "  Com name : " + company_name + "  Com annual : " + annual_sales + "  Com Fd. : "
        + founding_date;
  }
}
