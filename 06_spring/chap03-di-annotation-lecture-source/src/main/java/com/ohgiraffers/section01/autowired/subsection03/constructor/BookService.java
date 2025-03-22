package com.ohgiraffers.section01.autowired.subsection03.constructor;

import com.ohgiraffers.section01.common.BookDAO;
import com.ohgiraffers.section01.common.BookDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service(value = "bookServiceConstructor")
public class BookService {

    private final BookDAO bookDAO;


    /* 설명.
     *  BookDAO 타입의 빈 객체를 생성자를 통해 주입 받는다.
     *  (@Autowired를 생성자에 작성하고 주입받을 타입의 bean을 매개변수로 작성한다,)
     *  (기본 생성자X)
     *
     * 설명.
     *  생성자 주입의 이점
     *  1. 필드에 final 키워드를 사용할 수 있다.(오염 방지)  --> 이걸 쓰기 위해서는 생성자 주입이 필수적
     *  2. 순환참조를 스프링 시작(컨테이너 생성 시)과 동시에 확인하고 에러를 발생시켜 준다.
     *  3. field 주입 및 setter 주입의 단점을 보완
     *      (필드 주입은 간결하지만 남용할 수 있고 이후에 setter가 없이는 수정이 불가능하다.)  --> setter 사용을 지양 @Setter를 빼고 만드는 것이 좋은 코드
     *      (setter 주입은 불변 객체를 만들고자 함에 있어 문제가 발생할 수 있으며 객체의 변경이 필요할 때만 setter를 추가하는 것이 맞다.(가급적 변경의 여지를 남기지 않아야 된다.))
     *  4. 테스트 코드 작성이 용이하다.(mock 객체 주입 용이) -> 임의의 객체를 사용할 때도 값이 변하지 않음 그래서 테스트가 용이함
    * */
    @Autowired
    public BookService(BookDAO bookDAO) {               /*NOTE 생성자 주입 방식, fianl로 필드 값을 만들 수 있음(final을 설정하기 위해서는 생성자 주입 방식이 필수적), 그렇게 되면 의존관계가 세팅이 됬는지 처음부터 확인이 가능*/
        this.bookDAO = bookDAO;
    }

    public List<BookDTO> findAllBook() {
        return bookDAO.findAllBook();
    }

    public BookDTO findBookBySequence(int sequence) {
        return bookDAO.findBookBySequence(sequence);
    }
}
