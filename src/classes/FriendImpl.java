package classes;

/**
 * friends table
 * @author 30797
 *
 */
public class FriendImpl {
	
	private int id; 

	private int userId; 
	
	private String name; 

	private String sex; 
	
	private int age; 
	
	private String qq; 
	
	private String telephone; 
	
	private String email; 
	
	private String adress; 
	
	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAdress() {
		return adress;
	}

	public void setAdress(String adress) {
		this.adress = adress;
	}

	@Override
	public String toString() {
		return "FriendImpl [name=" + name + ", sex=" + sex + ", age=" + age + ", qq=" + qq + ", telephone=" + telephone
				+ ", email=" + email + ", adress=" + adress + "]";
	}

}
