package algorithm.java.object01;

public class User {
    String userId;
    private String name;
    private String[] borrowedBooks;
    private int bookCount = borrowedBooks.length;


    public void User(String userId, String name){
        this.userId = userId;
        this.name = name;
    }
    public void User() {
        borrowedBooks = new String[3];
    }
    public void borrowBook(Book book){
        if(borrowedBooks.length == 3){
            System.out.println("이미 3권을 대출하셨습니다.");
        }
        else if(borrowedBooks.length<3){
            borrowedBooks[bookCount] = book.bookId;
        }
    }
    public void returnBook(Book book){
        for (int i = 0; i <borrowedBooks.length ; i++) {
            if(book.bookId == borrowedBooks[i]){
                borrowedBooks[i] = null;
            }
            else{
                System.out.println("대출한 도서가 아닙니다.");
            }
        }

    }

    public void printBorrowedBooks() {
        for (int i = 0; i < borrowedBooks.length; i++) {
            System.out.print(borrowedBooks[i]);
        }
    }
}
