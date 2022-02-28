package dto;

public class BoardDTO {
	private int boardNum;
	private String title;
	private String content;
	private String writer;
	private String createDate;
	private int readCnt;
	private String isPrivate;
	private String boardPw;
	private String attachedName;
	
	public BoardDTO() {
		
	}

	public BoardDTO(int boardNum, String title, String content, String writer, String createDate, int readCnt,
			String isPrivate, String boardPw, String attachedName) {
		super();
		this.boardNum = boardNum;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.createDate = createDate;
		this.readCnt = readCnt;
		this.isPrivate = isPrivate;
		this.boardPw = boardPw;
		this.attachedName = attachedName;
	}

	public int getBoardNum() {
		return boardNum;
	}

	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
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

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public int getReadCnt() {
		return readCnt;
	}

	public void setReadCnt(int readCnt) {
		this.readCnt = readCnt;
	}

	public String getIsPrivate() {
		return isPrivate;
	}

	public void setIsPrivate(String isPrivate) {
		this.isPrivate = isPrivate;
	}

	public String getBoardPw() {
		return boardPw;
	}

	public void setBoardPw(String boardPw) {
		this.boardPw = boardPw;
	}

	public String getAttachedName() {
		return attachedName;
	}

	public void setAttachedName(String attachedName) {
		this.attachedName = attachedName;
	}

	@Override
	public String toString() {
		return "BoardDTO [boardNum=" + boardNum + ", title=" + title + ", content=" + content + ", writer=" + writer
				+ ", createDate=" + createDate + ", readCnt=" + readCnt + ", isPrivate=" + isPrivate + ", boardPw="
				+ boardPw + ", attachedName=" + attachedName + "]";
	}
	
	
	
}
