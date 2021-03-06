require("minitest/autorun")
require("minitest/rg")
require_relative("../library.rb")

class LibraryTest < MiniTest::Test
  def setup
    @library_01 = [
    {
    title: "lord_of_the_rings",
    rental_details: {
      student_name: "Jeff",
      date: "01/12/16"
    }
    },
    {
    title: "foundation",
    rental_details: {
      student_name: "Alvaro",
      date: "03/07/18"
    }
    }
    ]
  end

  def test_get_book
    library = Library.new(@library_01)
    assert_equal(@library_01, library.books )
  end

  def test_find_info_by_title
    result = @library_01[0]
    library = Library.new(@library_01)
    assert_equal(result, library.find_info_by_title("lord_of_the_rings"))
  end

  # def test_find_info_by_title_not_found
  #   result = nil
  #   library = Library.new(@library_01)
  #   assert_equal(result, library.find_rental_details_by_name("paquito_el_chocolatero"))
  # end

  def test_find_info_by_title_not_found
    result = nil
    library = Library.new(@library_01)
    assert_nil(library.find_rental_details_by_name("paquito_el_chocolatero"))
  end

  def test_find_rental_details_by_name
    result = {
      student_name: "Jeff",
      date: "01/12/16"
    }
    library = Library.new(@library_01)
    assert_equal(result, library.find_rental_details_by_name("lord_of_the_rings"))
  end

  def test_add_book
    result = {
    title: "spartacus",
    rental_details: {
      student_name: "",
      date: ""
      }
    }
    library = Library.new(@library_01)
    library.add_book("spartacus")
    assert_equal(result, library.find_info_by_title("spartacus"))
  end

  def test_change_rental_details

    result = [
    {
    title: "lord_of_the_rings",
    rental_details: {
      student_name: "Alvaro",
      date: "06/08/18"
    }
    },
    {
    title: "foundation",
    rental_details: {
      student_name: "Alvaro",
      date: "03/07/18"
    }
    }
    ]

    library = Library.new(@library_01)
    library.change_rental_details("lord_of_the_rings", "Alvaro", "06/08/18")
    assert_equal(result, library.books)

  end

  def test_change_rental_details_wrong_book
    result =[
    {
    title: "lord_of_the_rings",
    rental_details: {
      student_name: "Jeff",
      date: "01/12/16"
    }
    },
    {
    title: "foundation",
    rental_details: {
      student_name: "Alvaro",
      date: "03/07/18"
    }
    }
    ]
    library = Library.new(@library_01)
    library.change_rental_details("wronginos", "Alvaro", "06/08/18")
    assert_equal(result, library.books)
  end

end
