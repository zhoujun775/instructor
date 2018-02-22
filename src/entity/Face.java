package entity;

public class Face {
	private int faceID;
	private String faceName;
	private String url;
	private User user;
	public int getFaceID() {
		return faceID;
	}
	public void setFaceID(int faceID) {
		this.faceID = faceID;
	}
	public String getFaceName() {
		return faceName;
	}
	public void setFaceName(String faceName) {
		this.faceName = faceName;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Face(int faceID, String faceName, String url, User user) {
		super();
		this.faceID = faceID;
		this.faceName = faceName;
		this.url = url;
		this.user = user;
	}
	public Face() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + faceID;
		result = prime * result + ((faceName == null) ? 0 : faceName.hashCode());
		result = prime * result + ((url == null) ? 0 : url.hashCode());
		result = prime * result + ((user == null) ? 0 : user.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Face other = (Face) obj;
		if (faceID != other.faceID)
			return false;
		if (faceName == null) {
			if (other.faceName != null)
				return false;
		} else if (!faceName.equals(other.faceName))
			return false;
		if (url == null) {
			if (other.url != null)
				return false;
		} else if (!url.equals(other.url))
			return false;
		if (user == null) {
			if (other.user != null)
				return false;
		} else if (!user.equals(other.user))
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "Face [faceID=" + faceID + ", faceName=" + faceName + ", url=" + url + ", user=" + user + "]";
	}
	
	
}
