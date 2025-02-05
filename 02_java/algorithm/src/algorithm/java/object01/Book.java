package algorithm.java.object01;

public class Book {
    String bookId;
    String title;
    String author;
    private boolean isBorrowed;

    public void borrow(){
        if(isBorrowed == true){
            System.out.println("대출이 불가합니다");
        }
        else{
            isBorrowed = false;
        }

    }

    public void returnBook(){
        if(isBorrowed != true){
            System.out.println("대출되지 않은 도서입니다.");
        }
        else{
            isBorrowed = false;
        }
    }

}
