// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

contract Library {
    // Public library

    // books in store
    // track borrow and returns

    address public librarianAddress;

    // Book
    struct Book {
        string name;
        string ISBN;
        string author;
        string genre;
        bool isAvailable;
    }

    Book[] public books;

    // Book Requests
    enum BookRequestStatus {
      PENDING,
      APPROVED,
    }

    struct BookRequest {
        address userAddress;
        uint bookIndex;
        BookRequestStatus status;
    }

    BookRequest[] bookRequests;

    // User struct
    struct User {
        uint ID;
        string name;
        uint age;
        bool approved;
    }

    mapping(address => User) public users;
    mapping(address => bool) public userHasRegistered;

    modifier onlyLibrarian {
      require(msg.sender == librarianAddress, "Not Authorized");
      _;
    }

    // functions
    constructor(address _librarianAddress) {
      // save librarian
      librarianAddress = _librarianAddress;
    }

    // register user - User
    function registerUser(string _name, uint _age) public returns(bool) {

      require(!userHasRegistered[msg.sender], "You already have an account");

      // create user object
      User person = User(ID: 1, name: _name, age: _age, approved: false);

      // crease address to user mapping
      users[msg.sender] = person;
      userHasRegistered[msg.sender] = true;

      return true;
    }

    // approve user - Librarian
    function approveUser(address _userAddress) public onlyLibrarian {
      user = users[_userAddress];

      require(user, "User does not exist");

      user.approved = true;
    }

    // store new book - Librarian
    function storeNewBook(string _name, string _isbn, string _author, string _genre) public onlyLibrarian {
      Book book = Book();

      book.name = _name;
      book.ISBN = _isbn;
      book.author = _author;
      book.genre = _genre;
      book.isAvailable = true;

      books.push(book);
    }

    // request book - User
    function requestBook(uint _bookIndex) public returns (bool) {
      Book book = books[_bookIndex];

      BookRequest request = BookRequest(msg.sender, book.ID, BookRequestStatus.PENDING);

      bookRequests.push(request);

      return true;
    }

    // mark book as borrowed - Librarian
    function approveRequest(uint _bookRequestIndex) public onlyLibrarian returns (bool) {
      BookRequest request = bookRequests[_bookRequestIndex];

      Book book = books[request.bookIndex];

      require(request.status == BookRequestStatus.APPROVED, "Book Request already Approved");

      require(book.isAvailable == true, "Book is Not Available");

      request.status = BookRequestStatus.APPROVED;
      book.isAvailable = false;

      return true;
    }

    // mark book as returns - Librarian
    function returnBook(uint _bookIndex) public onlyLibrarian{
      Book book = books[_bookIndex];

      book.isAvailable = true;
    }
}
