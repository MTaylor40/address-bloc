require_relative '../models/address_book'

class MenuController
  attr_accessor :address_book

  def initialize
    @address_book = AddressBook.new
  end

  def main_menu
    puts "Main Menu - #{address_book.entries.count} entries"
    puts "1 - View all entries"
    puts "2 - Create an entry"
    puts "3 - Search for an entry"
    puts "4 - IMport entries from a CSV"
    puts "5 - View Entry by Number"
    puts "6 - Exit"
    print "Enter your selection: "

    selection = gets.to_i
    case selection
    when 1
      system "clear"
      view_all_enttries
      main_menu
    when 2
      system "clear"
      create_entry
      main_menu
    when 3
      system "clear"
      search_entries
      main_menu
    when 4
      system "clear"
      read_csv
      main_menu
    when 5
      system "clear"
      view_entry_n
      main_menu
    when 6
      puts "Good-bye!"

      exit(0)

    else
      system "clear"
      puts "Sorry, that is not a valid input"
      main_menu
    end
  end

  def view_all_enttries
    @address_book.entries.each do |entry|
      system "clear"
      puts entry.to_s
      entry_submenu(entry)
    end

    system "clear"
    puts "End of entries"
  end

  def create_entry
    system "clear"
    puts "New AddressBloc Entry"

    print "Name: "
    name = gets.chomp
    print "Phone number: "
    phone = gets.chomp
    print "Email: "
    email = gets.chomp

    @address_book.add_entry(name, phone, email)

    system "clear"
    puts "New entry created"
  end

  def search_entries
  end

  def read_csv
  end

  def view_entry_n
    system "clear"
    entry_n_submenu
    main_menu
  end

  def entry_n_submenu
    print "Entry to View:"
    entry_number = gets.chomp.to_i

    if entry_number < @address_book.entries.count
      puts @address_book.entries[entry_number]
      puts "Press enter to return to menu"
      gets.chomp
      system "clear"
    else
      puts "#{entry_number} is not a valid input, try again"
      entry_n_submenu
    end
  end

  def entry_submenu(entry)
    puts "n - next entry"
    puts "d - delete entry"
    puts "e - edit this entry"
    puts "m - return to main menu"

    selection = gets.chomp

    case selection

    when "n"
    when "d"
    when "e"
    when "m"
      system "clear"
      main_menu
    else
      system "clear"
      puts "#{selection} is not a valid input"
      entries_submenu(entry)
    end
  end
end
