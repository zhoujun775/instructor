package entity;

public class Notice {
	private Integer noticeID;
	private String title;
	private String content;
	private String time;
	private User user;
	public Integer getNoticeID() {
		return noticeID;
	}
	public void setNoticeID(Integer noticeID) {
		this.noticeID = noticeID;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Notice(Integer noticeID, String title, String content, String time, User user) {
		super();
		this.noticeID = noticeID;
		this.title = title;
		this.content = content;
		this.time = time;
		this.user = user;
	}
	public Notice() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((content == null) ? 0 : content.hashCode());
		result = prime * result + ((noticeID == null) ? 0 : noticeID.hashCode());
		result = prime * result + ((time == null) ? 0 : time.hashCode());
		result = prime * result + ((title == null) ? 0 : title.hashCode());
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
		Notice other = (Notice) obj;
		if (content == null) {
			if (other.content != null)
				return false;
		} else if (!content.equals(other.content))
			return false;
		if (noticeID == null) {
			if (other.noticeID != null)
				return false;
		} else if (!noticeID.equals(other.noticeID))
			return false;
		if (time == null) {
			if (other.time != null)
				return false;
		} else if (!time.equals(other.time))
			return false;
		if (title == null) {
			if (other.title != null)
				return false;
		} else if (!title.equals(other.title))
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
		return "Notice [noticeID=" + noticeID + ", title=" + title + ", content=" + content + ", time=" + time
				+ ", user=" + user + "]";
	}
	
	
}
