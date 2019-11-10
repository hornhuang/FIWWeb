package classes;

public class UserImpl {
	
	private int id;
	
	private String mUserName;

	private String mUserPassword;
	
	public UserImpl() {
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getmUserName() {
		return mUserName;
	}

	public void setmUserName(String mUserName) {
		this.mUserName = mUserName;
	}

	public String getmUserPassword() {
		return mUserPassword;
	}

	public void setmUserPassword(String mUserPassword) {
		this.mUserPassword = mUserPassword;
	}
	
	@Override
	public boolean equals(Object obj) {
		// TODO Auto-generated method stub
		if ( !(obj instanceof UserImpl) ) {
			return false;
		}
		UserImpl user = (UserImpl) obj;
		if ( this.mUserName.equals(user.mUserName) &&
				this.mUserPassword.equals(user.mUserPassword)) {
			return true;
		} else {
			return false;
		}
	}

}
