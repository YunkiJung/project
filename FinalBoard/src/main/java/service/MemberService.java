package service;

import java.util.List;

import dto.MemberDTO;

public interface MemberService {
	int insertMember(MemberDTO memberDTO);
	MemberDTO login(MemberDTO memberDTO);
}
