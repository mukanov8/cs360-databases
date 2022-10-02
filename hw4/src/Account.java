import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity(name = "Account")
@Table(name = "account")

public class Account {
  @Id
  @Column(name = "account_id", unique = true, nullable = false)
  private int account_id;

  @Column(name = "bank_name", nullable = false)
  private String bank_name;

  @Column(name = "opening_date", nullable = false)
  @Temporal(TemporalType.DATE)
  private java.util.Date opening_date;

  @ManyToOne
  @JoinColumn(name = "owner")
  private Employee owner;

  // @ManyToOne
  // @JoinColumn(name = "employee_id")
  // @Column(name = "owner", nullable = false)
  // private Employee owner;

  public Account() {
  }

  public Account(int account_id, String bank_name, java.util.Date opening_date, Employee owner) {
    this.account_id = account_id;
    this.bank_name = bank_name;
    this.opening_date = opening_date;
    this.owner = owner;
  }

  @Override
  public boolean equals(Object obj) {
    if (obj == null)
      return false;
    if (!this.getClass().equals(obj.getClass()))
      return false;
    if (!(obj instanceof Account))
      return false;
    Account obj2 = (Account) obj;
    if ((this.account_id == obj2.getAccountId()) && (this.owner.equals(obj2.getOwner()))) {
      return true;
    }
    return false;
  }

  @Override
  public int hashCode() {
    int tmp = 0;
    tmp = (account_id + "").hashCode();
    return tmp;
  }

  public int getAccountId() {
    return account_id;
  }

  public String getBankName() {
    return bank_name;
  }

  public java.util.Date getOpeningDate() {
    return opening_date;
  }

  public Employee getOwner() {
    return owner;
  }

  public void setAccountId(int account_id) {
    this.account_id = account_id;
  }

  public void setBankName(String bank_name) {
    this.bank_name = bank_name;
  }

  public void setOpeningDate(Date opening_date) {
    this.opening_date = opening_date;
  }

  public void setOwner(Employee owner) {
    this.owner = owner;
  }

  @Override
  public String toString() {
    return "Owner Name : " + owner.getFirstName() + "  Bank Name : " + bank_name + "  Account : " + account_id
        + "  Opening Date : " + opening_date;
  }

}
