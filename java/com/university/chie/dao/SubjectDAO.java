package com.university.chie.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.university.chie.mapper.SubjectMapper;
import com.university.chie.vo.Ass_File;
import com.university.chie.vo.Assignment;
import com.university.chie.vo.Assignment_Submit;
import com.university.chie.vo.LectureNoticeFile;
import com.university.chie.vo.Lecture_Notice;
import com.university.chie.vo.QnAAnswer;
import com.university.chie.vo.QnAQuestion;

@Repository
public class SubjectDAO {
	
	@Autowired
	SqlSession session;
	
	public List<HashMap<String,String>> selectAllQ(String lectureNum, int startRecord, int countPerPage){
		List<HashMap<String,String>> result = null;
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		SubjectMapper mapper= session.getMapper(SubjectMapper.class);
		try {
			result = mapper.selectAllQ(lectureNum,rb);
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		return result;
	}
	
	public int getTotalQ(String lectureNum) {
		SubjectMapper mapper = session.getMapper(SubjectMapper.class);
		int total = mapper.getTotalQ(lectureNum);
		return total;
	}
	
	public int insertQ (QnAQuestion question) {
		int result = 0;
		SubjectMapper mapper = session.getMapper(SubjectMapper.class);
		try {
			result = mapper.insertQ(question);
		} catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
		return result;
	}
	
	public int updateQ(QnAQuestion question) {
		int result = 0;
		SubjectMapper mapper = session.getMapper(SubjectMapper.class);
		try {
			result = mapper.updateQ(question);
		} catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
		return result;
	}
	
	
	public HashMap<String,String> selectQ(String qSeq) {
		HashMap<String,String> result = null;
		SubjectMapper mapper = session.getMapper(SubjectMapper.class);
		try {
			result = mapper.selectQ(qSeq);
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		return result;
	}
	
	public int deleteQ(String qSeq) {
		int result = 0;
		SubjectMapper mapper = session.getMapper(SubjectMapper.class);
		try {
			result = mapper.deleteQ(qSeq);
		} catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
		
		return result;
	}
	
	public int updateCount(String qSeq) {
		int result = 0;
		SubjectMapper mapper = session.getMapper(SubjectMapper.class);
		try {
			result = mapper.updateCount(qSeq);
		} catch(Exception e) {
			e.printStackTrace();
			return 0;
		}

		return result;
	}
	
	public int decCount(String qSeq) {
		int result = 0;
		SubjectMapper mapper = session.getMapper(SubjectMapper.class);
		try {
			result = mapper.decCount(qSeq);
		} catch(Exception e) {
			e.printStackTrace();
			return 0;
		}

		return result;
	}
	
	
	public int insertA (QnAAnswer answer) {
		int result = 0;
		SubjectMapper mapper = session.getMapper(SubjectMapper.class);
		try {
			result = mapper.insertA(answer);
		} catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
		return result;
	}
	
	public QnAAnswer selectA(String aSeq) {
		QnAAnswer result = null;
		SubjectMapper mapper = session.getMapper(SubjectMapper.class);
		try {
			result = mapper.selectA(aSeq);
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		return result;
	}
	
	public int deleteA(String qSeq) {
		int result = 0;
		SubjectMapper mapper = session.getMapper(SubjectMapper.class);
		try {
			result = mapper.deleteA(qSeq);
		} catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
		
		return result;
	}
	
	public int updateA(QnAAnswer answer) {
		int result = 0;
		SubjectMapper mapper = session.getMapper(SubjectMapper.class);
		try {
			result = mapper.updateA(answer);
		} catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
		return result;
	}
	
	public String selectACon(String aSeq) {
		String result = null;
		SubjectMapper mapper = session.getMapper(SubjectMapper.class);
		try {
			result = mapper.selectACon(aSeq);
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		return result;
	}
	
	//Assignmnet
	public int insertAssign (Assignment assign) {
		int result = 0;
		SubjectMapper mapper = session.getMapper(SubjectMapper.class);
		try {
			result = mapper.insertAssign(assign);
		} catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
		return result;

	}
	
	public List<Assignment> selectAssignAll(String lectureNum){
		List<Assignment> result = null;
		SubjectMapper mapper = session.getMapper(SubjectMapper.class);
		try {
			result = mapper.selectAssignAll(lectureNum);
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		return result;
	}
	
	public Assignment selectAssign(String assSeq) {
		Assignment result = null;
		SubjectMapper mapper = session.getMapper(SubjectMapper.class);
		try {
			result = mapper.selectAssign(assSeq);
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		return result;
	}
	
	public int updateAssign(Assignment assign) {
		int result = 0;
		
		SubjectMapper mapper = session.getMapper(SubjectMapper.class);
		try {
			result = mapper.updateAssign(assign);
		} catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
		return result;
	}
	
	public int deleteAssign(String assSeq) {
		int result = 0;
		
		SubjectMapper mapper = session.getMapper(SubjectMapper.class);
		try {
			result = mapper.deleteAssign(assSeq);
		} catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
		return result;
	}
	
	//Assginment_Sub
	
	public int getTotalAssignSP(HashMap<String,String> assignSP) {
		int total = 0;
		SubjectMapper mapper = session.getMapper(SubjectMapper.class);
		total = mapper.getTotalAssignSP(assignSP);
		return total;
	}
	
	public List<HashMap<String,String>> selectAllAssignSP(HashMap<String,String> a,int startRecord, int countPerPage){
		List<HashMap<String,String>> result = null;
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		SubjectMapper mapper = session.getMapper(SubjectMapper.class);
		try {
			result = mapper.selectAllAssignSP(a,rb);
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		return result;
	}
	
	public HashMap<String,String> selectAssignSP(String aSubSeq) {
		HashMap<String,String> result = null;
		SubjectMapper mapper = session.getMapper(SubjectMapper.class);
		try {
			result = mapper.selectAssignSP(aSubSeq);
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		return result;
	}
	
	public int insertAssignS(Assignment_Submit assignSub) {
		int result = 0;
		SubjectMapper mapper = session.getMapper(SubjectMapper.class);
		try {
			result = mapper.insertAssignS(assignSub);
		} catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
		return result;
	}
	
	
	public Assignment_Submit selectAssignS(Assignment_Submit assignSub) {
		Assignment_Submit result = null;
		SubjectMapper mapper = session.getMapper(SubjectMapper.class);
		try {
			result = mapper.selectAssignS(assignSub);
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		return result;
	}
	
	public Assignment_Submit selectAssignSA(String aSubSeq) {
		Assignment_Submit result = null;
		SubjectMapper mapper = session.getMapper(SubjectMapper.class);
		try {
			result = mapper.selectAssignSA(aSubSeq);
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		return result;
	}
	
	public int deleteAssignS(String aSubSeq) {
		int result = 0;
		SubjectMapper mapper = session.getMapper(SubjectMapper.class);
		try {
			result = mapper.deleteAssignS(aSubSeq);
		} catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
		
		return result;
	}
	
	public int updateAssignS(Assignment_Submit assign) {
		int result = 0;
		SubjectMapper mapper = session.getMapper(SubjectMapper.class);
		try {
			result = mapper.updateAssignS(assign);
		} catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
		return result;
	}
	
	//ASS_FILE
	public int insertAssFile(Ass_File afile) {
		int result = 0;
		SubjectMapper mapper = session.getMapper(SubjectMapper.class);
		try {
			result = mapper.insertAssFile(afile);
		} catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
		return result;
	}
	
	public List<Ass_File> selectAssFileAll(HashMap<String,String> asFile) {
		List<Ass_File> result = null;
		SubjectMapper mapper = session.getMapper(SubjectMapper.class);
		try {
			result = mapper.selectAssFileAll(asFile);
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		return result;
	}
	
	public Ass_File selectAssFile(String fileASeq) {
		Ass_File result = null;
		SubjectMapper mapper = session.getMapper(SubjectMapper.class);
		try {
			result = mapper.selectAssFile(fileASeq);
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		return result;
	}
	
	public int deleteAssFile(String aSubSeq) {
		int result = 0;
		SubjectMapper mapper = session.getMapper(SubjectMapper.class);
		try {
			result = mapper.deleteAssFile(aSubSeq);
		} catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
		
		return result;
	}
	
	public int deleteAssFileF(String fileASeq) {
		int result = 0;
		SubjectMapper mapper = session.getMapper(SubjectMapper.class);
		try {
			result = mapper.deleteAssFileF(fileASeq);
		} catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
		
		return result;
	}
	
	//LECTURE NOTICE
	public int insertNotice(Lecture_Notice notice) {
		int result = 0;
		SubjectMapper mapper = session.getMapper(SubjectMapper.class);
		try {
			result = mapper.insertNotice(notice);
		} catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
		return result;
	}
	public int insertNoticeFile(LectureNoticeFile nFile) {
		int result = 0;
		SubjectMapper mapper = session.getMapper(SubjectMapper.class);
		try {
			result = mapper.insertNoticeFile(nFile);
		} catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
		return result;
	}
	
	//��ü �� ����
	public int getTotalNotice(HashMap<String,String> t) {
		SubjectMapper mapper = session.getMapper(SubjectMapper.class);
		int total = mapper.getTotalNotice(t);
		return total;
	}
	
	public List<Lecture_Notice> selectAllNoticeL(HashMap<String,String> noti,int startRecord, int countPerPage){
		List<Lecture_Notice> result = null;
		SubjectMapper mapper = session.getMapper(SubjectMapper.class);
		RowBounds rb = new RowBounds(startRecord,countPerPage);
		try {
			result = mapper.selectAllNoticeL(noti,rb);
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		return result;
	}
	
	public Lecture_Notice selectNoticeL(String lnSeq) {
		Lecture_Notice result = null;
		SubjectMapper mapper = session.getMapper(SubjectMapper.class);
		try {
			result = mapper.selectNoticeL(lnSeq);
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		return result;
	}
	
	public List<LectureNoticeFile> selectNoticeFileL(String lnSeq) {
		List<LectureNoticeFile> result = null;
		SubjectMapper mapper = session.getMapper(SubjectMapper.class);
		try {
			result = mapper.selectNoticeFileL(lnSeq);
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		return result;
	}
	
	public LectureNoticeFile selectNoticeFileF(String fileSeq) {
		LectureNoticeFile result = null;
		SubjectMapper mapper = session.getMapper(SubjectMapper.class);
		try {
			result = mapper.selectNoticeFileF(fileSeq);
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		return result;
	}
	
	public int updateNoticeL(Lecture_Notice notice) {
		int result = 0;
		SubjectMapper mapper = session.getMapper(SubjectMapper.class);
		try {
			result = mapper.updateNoticeL(notice);
		} catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
		return result;
	}
	
	public int deleteNoticeL(String lnSeq) {
		int result = 0;
		SubjectMapper mapper = session.getMapper(SubjectMapper.class);
		try {
			result = mapper.deleteNoticeL(lnSeq);
		} catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
		return result;
	}
	
	public int deleteNoticeFileL(String lnSeq) {
		int result = 0;
		SubjectMapper mapper = session.getMapper(SubjectMapper.class);
		try {
			result = mapper.deleteNoticeFileL(lnSeq);
		} catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
		return result;
	}
	
	public int deleteNoticeFileF(String fileSeq) {
		int result = 0;
		SubjectMapper mapper = session.getMapper(SubjectMapper.class);
		try {
			result = mapper.deleteNoticeFileF(fileSeq);
		} catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
		return result;
	}

}

