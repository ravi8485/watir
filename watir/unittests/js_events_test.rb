# feature tests for JavaScript events
# revision: $Revision$

$LOAD_PATH.unshift File.join(File.dirname(__FILE__), '..') if $0 == __FILE__
require 'unittests/setup'

class TC_JSEvents < Test::Unit::TestCase
    include Watir

#button enabled/disabled tests
    def gotoJavaScriptEventsPage()
        $ie.goto($htmlRoot + "javascriptevents.html")
    end

  
    def test_Button_disabled
       gotoJavaScriptEventsPage()
       assert_false($ie.button(:caption, "Button 1").enabled?) 
    end

    def test_Button_Enabled
       gotoJavaScriptEventsPage()    
     
       $ie.text_field(:name, "entertext").fireEvent("onkeyup")
       assert($ie.button(:caption, "Button 1").enabled?)   
     
    end

    def test_Button_click

       gotoJavaScriptEventsPage()
       
       puts "Firing event to make button enabled"
       $ie.text_field(:name, "entertext").fireEvent("onKeyUp")
       puts "Clicking the button"

       $ie.button(:caption, "Button 1").click
       assert($ie.contains_text("PASS") )
    end
#end of button enabled/disabled tests

#onMouseOver tests
 #window status
    
    def test_page_nostatus
       gotoJavaScriptEventsPage()
       assert_false($ie.status == "Here is your status") 
    end
  
    def test_page_status
       gotoJavaScriptEventsPage()
       $ie.link(:text, "Check the Status").fireEvent("onMouseOver")
       assert($ie.status, "It worked") 
    end
    
    def test_page_status
       gotoJavaScriptEventsPage()
       $ie.link(:text, "Clear the Status").fireEvent("onMouseOver")
       assert($ie.status, "") 
    end
 #end of window status

#end of onMouseOver tests

end
