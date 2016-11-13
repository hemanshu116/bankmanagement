package pojo;

public class loanpojo {
	private String loan_id;
	private String loan_type;
	private String loan_ammount;
	private String loan_apply_date;
	private String loan_issue_date;
	private String Duration_of_loan;
	private String roi;
	private String loanpaid;
	private Double EMI;

	public String getLoanpaid() {
		return loanpaid;
	}

	public void setLoanpaid(String loanpaid) {
		this.loanpaid = loanpaid;
	}

	public void setEMI(Double eMI) {
		EMI = eMI;
	}

	public String getRoi() {
		return roi;
	}

	public void setRoi(String roi) {
		this.roi = roi;
	}

	public Double getEMI() {
		return EMI;
	}

	public void setEMI(double eMI2) {
		EMI = eMI2;
	}

	public String getLoan_id() {
		return loan_id;
	}

	public void setLoan_id(String loan_id) {
		this.loan_id = loan_id;
	}

	public String getLoan_type() {
		return loan_type;
	}

	public void setLoan_type(String loan_type) {
		this.loan_type = loan_type;
	}

	public String getLoan_ammount() {
		return loan_ammount;
	}

	public void setLoan_ammount(String loan_ammount) {
		this.loan_ammount = loan_ammount;
	}

	public String getLoan_apply_date() {
		return loan_apply_date;
	}

	public void setLoan_apply_date(String loan_apply_date) {
		this.loan_apply_date = loan_apply_date;
	}

	public String getLoan_issue_date() {
		return loan_issue_date;
	}

	public void setLoan_issue_date(String loan_issue_date) {
		this.loan_issue_date = loan_issue_date;
	}

	public String getDuration_of_loan() {
		return Duration_of_loan;
	}

	public void setDuration_of_loan(String duration_of_loan) {
		Duration_of_loan = duration_of_loan;
	}

}
