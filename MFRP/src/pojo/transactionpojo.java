package pojo;

public class transactionpojo {

	private String txnId;
	private String amount;
	private String transactiondate;
	private String Transaction_type;
	private String to_account;

	public String getTo_account() {
		return to_account;
	}

	public void setTo_account(String to_account) {
		this.to_account = to_account;
	}

	public String getTxnId() {
		return txnId;
	}

	public void setTxnId(String txnId) {
		this.txnId = txnId;
	}

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

	public String getTransaction_type() {
		return Transaction_type;
	}

	public void setTransaction_type(String transaction_type) {
		Transaction_type = transaction_type;
	}

	public String getTransactiondate() {
		return transactiondate;
	}

	public void setTransactiondate(String transactiondate) {
		this.transactiondate = transactiondate;
	}
}
