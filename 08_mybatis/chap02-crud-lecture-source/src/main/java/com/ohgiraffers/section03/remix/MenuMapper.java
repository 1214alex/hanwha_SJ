package com.ohgiraffers.section03.remix;

import org.apache.ibatis.annotations.*;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

/* 설명.
 *  1. xml 파일은 mapper용 인터페이스와 같은 이름으로 되어야 한다.
 *  2. xml 파일은 mapper용 인터페이스와 같은 경로에 위치 되어야 한다.
 *  3. xml 파일의 namespace는 mapper용 인터페이스로 작성해야 한다.(풀네임으로)
 *  4. xml 파일의 쿼리 id와 mapper용 인터페이스의 추상메소드가 일치되어야 한다.
 *  xml방식(쿼리는 xml)과 java방식(dao가 간단한 추상메소드)의 장점을 혼용하기 위한 방법
* */

public interface MenuMapper {

    List<MenuDTO> selectAllMenus();

    MenuDTO selectMenu(int menuCode);

    int insertMenu(MenuDTO menu);

    int updateMenu(MenuDTO menu);

    int deleteMenu(int menuCode);


}
